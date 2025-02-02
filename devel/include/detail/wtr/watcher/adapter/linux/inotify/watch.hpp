#pragma once

#if (defined(__linux__) || defined(__ANDROID_API__)) \
  && ! defined(WATER_WATCHER_USE_WARTHOG)

#include <linux/version.h>

#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 7, 0)) || defined(__ANDROID_API__)

#include "wtr/watcher.hpp"
#include <atomic>
#include <cassert>
#include <cstring>
#include <filesystem>
#include <functional>
#include <sys/epoll.h>
#include <sys/inotify.h>
#include <system_error>
#include <tuple>
#include <unistd.h>
#include <unordered_map>

namespace detail {
namespace wtr {
namespace watcher {
namespace adapter {
namespace inotify {

/*  - delay
        The delay, in milliseconds, while `epoll_wait` will
        'sleep' for until we are woken up. We usually check
        if we're still alive at that point.
    - event_wait_queue_max
        Number of events allowed to be given to do_event_recv
        (returned by `epoll_wait`). Any number between 1 and
        some large number should be fine. We don't lose events
        if we 'miss' them, the events are still waiting in the
        next call to `epoll_wait`.
    - event_buf_len:
        For our event buffer, 4096 is a typical page size and
        sufficiently large to hold a great many events. That's
        a good thumb-rule.
    - in_init_opt
        Use non-blocking IO.
    - in_watch_opt
        Everything we can get.
    @todo
    - Measure perf of IN_ALL_EVENTS
    - Handle move events properly.
      - Use IN_MOVED_TO
      - Use event::<something> */
inline constexpr auto delay_ms = 16;
inline constexpr auto event_wait_queue_max = 1;
inline constexpr auto event_buf_len = 4096;
inline constexpr auto in_init_opt = IN_NONBLOCK;
inline constexpr auto in_watch_opt =
  IN_CREATE | IN_MODIFY | IN_DELETE | IN_MOVED_FROM | IN_Q_OVERFLOW;

/*  - path_map_type
        An alias for a map of file descriptors to paths.
    - sys_resource_type
        An object representing an inotify file descriptor,
        an epoll file descriptor, an epoll configuration,
        and whether or not the resources are valid */
using path_map_type = std::unordered_map<int, std::filesystem::path>;

struct sys_resource_type {
  bool valid;
  int watch_fd;
  int event_fd;
  epoll_event event_conf;
};

/*  If the path given is a directory
      - find all directories above the base path given.
      - ignore nonexistent directories.
      - return a map of watch descriptors -> directories.
    If `path` is a file
      - return it as the only value in a map.
      - the watch descriptor key should always be 1. */
inline auto path_map(
  std::filesystem::path const& base_path,
  ::wtr::watcher::event::callback const& callback,
  sys_resource_type const& sr) noexcept -> path_map_type
{
  namespace fs = std::filesystem;
  using ev = ::wtr::watcher::event;
  using diter = fs::recursive_directory_iterator;
  using dopt = fs::directory_options;

  /*  Follow symlinks, and ignore paths which we
      don't have permissions for. */
  static constexpr auto fs_dir_opt =
    dopt::skip_permission_denied & dopt::follow_directory_symlink;

  static constexpr auto path_map_reserve_count = 256;

  auto pm = path_map_type{};
  pm.reserve(path_map_reserve_count);

  auto do_mark = [&](fs::path const& d) noexcept -> bool
  {
    int wd = inotify_add_watch(sr.watch_fd, d.c_str(), in_watch_opt);
    return wd > 0 ? pm.emplace(wd, d).first != pm.end() : false;
  };

  try {
    if (sr.valid)
      if (do_mark(base_path))
        if (fs::is_directory(base_path))
          for (auto dir : diter(base_path, fs_dir_opt))
            if (fs::is_directory(dir))
              if (! do_mark(dir.path()))
                callback(
                  {"w/sys/not_watched@" + base_path.string() + "@"
                     + dir.path().string(),
                   ev::effect_type::other,
                   ev::path_type::watcher});
  } catch (...) {}

  return pm;
};

/*  Produces a `sys_resource_type` with the file descriptors from
    `inotify_init` and `epoll_create`. Invokes `callback` on errors. */
inline auto
open_system_resources(::wtr::watcher::event::callback const& callback) noexcept
  -> sys_resource_type
{
  auto do_error = [&callback](
                    char const* const msg,
                    int watch_fd,
                    int event_fd = -1) noexcept -> sys_resource_type
  {
    callback(
      {msg,
       ::wtr::watcher::event::effect_type::other,
       ::wtr::watcher::event::path_type::watcher});
    return sys_resource_type{
      .valid = false,
      .watch_fd = watch_fd,
      .event_fd = event_fd,
      .event_conf = {.events = 0, .data = {.fd = watch_fd}}
    };
  };

  int watch_fd
#if defined(__ANDROID_API__)
    = inotify_init();
#else
    = inotify_init1(in_init_opt);
#endif

  if (watch_fd >= 0) {
    epoll_event event_conf{.events = EPOLLIN, .data{.fd = watch_fd}};

    int event_fd
#if defined(__ANDROID_API__)
      = epoll_create(event_wait_queue_max);
#else
      = epoll_create1(EPOLL_CLOEXEC);
#endif

    if (event_fd >= 0)
      if (epoll_ctl(event_fd, EPOLL_CTL_ADD, watch_fd, &event_conf) >= 0)
        return sys_resource_type{
          .valid = true,
          .watch_fd = watch_fd,
          .event_fd = event_fd,
          .event_conf = event_conf};
      else
        return do_error("e/sys/epoll_ctl", watch_fd, event_fd);
    else
      return do_error("e/sys/epoll_create", watch_fd, event_fd);
  }
  else
    return do_error("e/sys/inotify_init", watch_fd);
}

inline auto close_system_resources(sys_resource_type&& sr) noexcept -> bool
{
  return close(sr.watch_fd) == 0 && close(sr.event_fd) == 0;
}

/*  Reads through available (inotify) filesystem events.
    There might be several events from a single read.
    Three possible states:
     - eventful: there are events to read
     - eventless: there are no events to read
     - error: there was an error reading events
    The EAGAIN "error" means there is nothing
    to read. We count that as 'eventless'.
    Discerns each event's full path and type.
    Looks for the full path in `pm`, our map of
    watch descriptors to directory paths.
    Updates the path map, adding the directories
    with `create` events and removing the ones
    with `destroy` events.
    Forward events and errors to the user.
    Return when eventless.
    @todo
    Consider running and returning `find_dirs` from here.
    Remove destroyed watches. */
inline auto do_event_recv(
  int watch_fd,
  path_map_type& pm,
  std::filesystem::path const& base_path,
  ::wtr::watcher::event::callback const& callback) noexcept -> bool
{
  namespace fs = std::filesystem;

  auto do_error = [&base_path,
                   &callback](char const* const msg) noexcept -> bool
  {
    return (
      callback(
        {std::string{msg} + "@" + base_path.string(),
         ::wtr::watcher::event::effect_type::other,
         ::wtr::watcher::event::path_type::watcher}),
      false);
  };

  static constexpr auto event_count_upper_lim =
    event_buf_len / sizeof(inotify_event);

  unsigned event_count = 0;
  alignas(inotify_event) char event_buf[event_buf_len];
  auto read_len = read(watch_fd, event_buf, sizeof(event_buf));
  enum class read_state {
    eventful,
    eventless,
    error
  } read_state = read_len > 0    ? read_state::eventful
               : read_len == 0   ? read_state::eventless
               : errno == EAGAIN ? read_state::eventless
                                 : read_state::error;

  switch (read_state) {
    case read_state::eventful : {
      auto* this_event = (inotify_event*)(event_buf);
      auto const* const last_event = (inotify_event*)(event_buf + read_len);
      while (this_event < last_event) {
        enum class event_state {
          eventful,
          e_count,
          w_q_overflow
        } event_state =
          event_count++ > event_count_upper_lim ? event_state::e_count
          : this_event->mask & IN_Q_OVERFLOW    ? event_state::w_q_overflow
                                                : event_state::eventful;
        switch (event_state) {
          case event_state::eventful : {
            auto path_name =
              pm.find(this_event->wd)->second / fs::path{this_event->name};

            auto path_type = this_event->mask & IN_ISDIR
                             ? ::wtr::watcher::event::path_type::dir
                             : ::wtr::watcher::event::path_type::file;

            auto effect_type = this_event->mask & IN_CREATE
                               ? ::wtr::watcher::event::effect_type::create
                             : this_event->mask & IN_DELETE
                               ? ::wtr::watcher::event::effect_type::destroy
                             : this_event->mask & IN_MOVE
                               ? ::wtr::watcher::event::effect_type::rename
                             : this_event->mask & IN_MODIFY
                               ? ::wtr::watcher::event::effect_type::modify
                               : ::wtr::watcher::event::effect_type::other;

            if (
              path_type == ::wtr::watcher::event::path_type::dir
              && effect_type == ::wtr::watcher::event::effect_type::create)
              pm[inotify_add_watch(watch_fd, path_name.c_str(), in_watch_opt)] =
                path_name;

            else if (
              path_type == ::wtr::watcher::event::path_type::dir
              && effect_type == ::wtr::watcher::event::effect_type::destroy) {
              inotify_rm_watch(watch_fd, this_event->wd);
              pm.erase(this_event->wd);
            }

            callback({path_name, effect_type, path_type});  // <- Magic happens

          } break;

          case event_state::e_count : return do_error("e/sys/bad_count");

          case event_state::w_q_overflow : return ! do_error("w/sys/overflow");
        }

        this_event = (inotify_event*)((char*)this_event + this_event->len);
        this_event =
          (inotify_event*)((char*)this_event + sizeof(inotify_event));
      }

      return true;
    }

    case read_state::eventless : return true;

    case read_state::error : return do_error("e/sys/read");
  }

  assert(! "Unreachable");
  return false;
}

inline auto watch(
  std::filesystem::path const& path,
  ::wtr::watcher::event::callback const& callback,
  std::atomic<bool>& is_living) noexcept -> bool
{
  using ev = ::wtr::watcher::event;

  auto do_error = [&path, &callback](auto& f, std::string&& msg) -> bool
  {
    callback(
      {msg + path.string(), ev::effect_type::other, ev::path_type::watcher});
    f();
    return false;
  };

  /*  While:
      - A lifetime the user hasn't ended
      - A historical map of watch descriptors
        to long paths (for event reporting)
      - System resources for inotify and epoll
      - An event buffer for events from epoll
      - We're alive
      Do:
      - Await filesystem events
      - Invoke `callback` on errors and events */

  auto sr = open_system_resources(callback);

  epoll_event event_recv_list[event_wait_queue_max];

  auto pm = path_map(path, callback, sr);

  auto close = [&sr]() -> bool
  { return close_system_resources(std::move(sr)); };

  if (sr.valid) [[likely]]

    if (pm.size() > 0) [[likely]] {
      while (is_living) [[likely]]

      {
        int event_count = epoll_wait(
          sr.event_fd,
          event_recv_list,
          event_wait_queue_max,
          delay_ms);

        if (event_count < 0)
          return do_error(close, "e/sys/epoll_wait@");

        else if (event_count > 0) [[likely]]
          for (int n = 0; n < event_count; n++)
            if (event_recv_list[n].data.fd == sr.watch_fd) [[likely]]
              if (! do_event_recv(sr.watch_fd, pm, path, callback)) [[unlikely]]
                return do_error(close, "e/self/event_recv@");
      }

      return close();
    }
    else
      return do_error(close, "e/self/path_map@");

  else
    return do_error(close, "e/self/sys_resource@");
}

} /* namespace inotify */
} /* namespace adapter */
} /* namespace watcher */
} /* namespace wtr */
} /* namespace detail */

#endif
#endif
