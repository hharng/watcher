# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake

# The command to remove a file.
RM = /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/edant/dev/watcher/_deps/snitch-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/edant/dev/watcher/_deps/snitch-subbuild

# Utility rule file for snitch-populate.

# Include any custom commands dependencies for this target.
include CMakeFiles/snitch-populate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/snitch-populate.dir/progress.make

CMakeFiles/snitch-populate: CMakeFiles/snitch-populate-complete

CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-install
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-mkdir
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-download
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-patch
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-configure
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-build
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-install
CMakeFiles/snitch-populate-complete: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'snitch-populate'"
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E make_directory /Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles/snitch-populate-complete
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-done

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update:
.PHONY : snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-build: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'snitch-populate'"
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E echo_append
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-build

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-configure: snitch-populate-prefix/tmp/snitch-populate-cfgcmd.txt
snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-configure: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'snitch-populate'"
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E echo_append
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-configure

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-download: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-gitinfo.txt
snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-download: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'snitch-populate'"
	cd /Users/edant/dev/watcher/_deps && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -P /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/tmp/snitch-populate-gitclone.cmake
	cd /Users/edant/dev/watcher/_deps && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-download

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-install: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'snitch-populate'"
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E echo_append
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-install

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'snitch-populate'"
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -Dcfgdir= -P /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/tmp/snitch-populate-mkdirs.cmake
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-mkdir

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-patch: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'snitch-populate'"
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E echo_append
	/nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-patch

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update:
.PHONY : snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-test: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'snitch-populate'"
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E echo_append
	cd /Users/edant/dev/watcher/_deps/snitch-build && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -E touch /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-test

snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'snitch-populate'"
	cd /Users/edant/dev/watcher/_deps/snitch-src && /nix/store/x27c0x6982aj1ycrywlr7pl7piz3cqjj-cmake-3.25.3/bin/cmake -P /Users/edant/dev/watcher/_deps/snitch-subbuild/snitch-populate-prefix/tmp/snitch-populate-gitupdate.cmake

snitch-populate: CMakeFiles/snitch-populate
snitch-populate: CMakeFiles/snitch-populate-complete
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-build
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-configure
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-download
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-install
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-mkdir
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-patch
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-test
snitch-populate: snitch-populate-prefix/src/snitch-populate-stamp/snitch-populate-update
snitch-populate: CMakeFiles/snitch-populate.dir/build.make
.PHONY : snitch-populate

# Rule to build all files generated by this target.
CMakeFiles/snitch-populate.dir/build: snitch-populate
.PHONY : CMakeFiles/snitch-populate.dir/build

CMakeFiles/snitch-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/snitch-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/snitch-populate.dir/clean

CMakeFiles/snitch-populate.dir/depend:
	cd /Users/edant/dev/watcher/_deps/snitch-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/edant/dev/watcher/_deps/snitch-subbuild /Users/edant/dev/watcher/_deps/snitch-subbuild /Users/edant/dev/watcher/_deps/snitch-subbuild /Users/edant/dev/watcher/_deps/snitch-subbuild /Users/edant/dev/watcher/_deps/snitch-subbuild/CMakeFiles/snitch-populate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/snitch-populate.dir/depend

