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
CMAKE_SOURCE_DIR = /Users/edant/dev/watcher

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/edant/dev/watcher

# Include any dependencies generated for this target.
include CMakeFiles/wtr.watcher.ubsan.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/wtr.watcher.ubsan.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/wtr.watcher.ubsan.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wtr.watcher.ubsan.dir/flags.make

CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o: CMakeFiles/wtr.watcher.ubsan.dir/flags.make
CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o: src/wtr/watcher/main.cpp
CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o: CMakeFiles/wtr.watcher.ubsan.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/edant/dev/watcher/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o"
	/nix/store/7dkbcs6vgwbkb6rafh03j9j0bn8qpki0-clang-wrapper-11.1.0/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o -MF CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o.d -o CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o -c /Users/edant/dev/watcher/src/wtr/watcher/main.cpp

CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.i"
	/nix/store/7dkbcs6vgwbkb6rafh03j9j0bn8qpki0-clang-wrapper-11.1.0/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/edant/dev/watcher/src/wtr/watcher/main.cpp > CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.i

CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.s"
	/nix/store/7dkbcs6vgwbkb6rafh03j9j0bn8qpki0-clang-wrapper-11.1.0/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/edant/dev/watcher/src/wtr/watcher/main.cpp -o CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.s

# Object files for target wtr.watcher.ubsan
wtr_watcher_ubsan_OBJECTS = \
"CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o"

# External object files for target wtr.watcher.ubsan
wtr_watcher_ubsan_EXTERNAL_OBJECTS =

wtr.watcher.ubsan: CMakeFiles/wtr.watcher.ubsan.dir/src/wtr/watcher/main.cpp.o
wtr.watcher.ubsan: CMakeFiles/wtr.watcher.ubsan.dir/build.make
wtr.watcher.ubsan: CMakeFiles/wtr.watcher.ubsan.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/edant/dev/watcher/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable wtr.watcher.ubsan"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wtr.watcher.ubsan.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wtr.watcher.ubsan.dir/build: wtr.watcher.ubsan
.PHONY : CMakeFiles/wtr.watcher.ubsan.dir/build

CMakeFiles/wtr.watcher.ubsan.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wtr.watcher.ubsan.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wtr.watcher.ubsan.dir/clean

CMakeFiles/wtr.watcher.ubsan.dir/depend:
	cd /Users/edant/dev/watcher && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/edant/dev/watcher /Users/edant/dev/watcher /Users/edant/dev/watcher /Users/edant/dev/watcher /Users/edant/dev/watcher/CMakeFiles/wtr.watcher.ubsan.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wtr.watcher.ubsan.dir/depend

