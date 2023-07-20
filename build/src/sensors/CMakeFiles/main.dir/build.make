# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/michn/Software/datasim

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/michn/Software/datasim/build

# Include any dependencies generated for this target.
include src/sensors/CMakeFiles/main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/sensors/CMakeFiles/main.dir/compiler_depend.make

# Include the progress variables for this target.
include src/sensors/CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include src/sensors/CMakeFiles/main.dir/flags.make

src/sensors/CMakeFiles/main.dir/main.cpp.o: src/sensors/CMakeFiles/main.dir/flags.make
src/sensors/CMakeFiles/main.dir/main.cpp.o: /home/michn/Software/datasim/src/sensors/main.cpp
src/sensors/CMakeFiles/main.dir/main.cpp.o: src/sensors/CMakeFiles/main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/michn/Software/datasim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/sensors/CMakeFiles/main.dir/main.cpp.o"
	cd /home/michn/Software/datasim/build/src/sensors && /usr/lib64/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/sensors/CMakeFiles/main.dir/main.cpp.o -MF CMakeFiles/main.dir/main.cpp.o.d -o CMakeFiles/main.dir/main.cpp.o -c /home/michn/Software/datasim/src/sensors/main.cpp

src/sensors/CMakeFiles/main.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/main.cpp.i"
	cd /home/michn/Software/datasim/build/src/sensors && /usr/lib64/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/michn/Software/datasim/src/sensors/main.cpp > CMakeFiles/main.dir/main.cpp.i

src/sensors/CMakeFiles/main.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.cpp.s"
	cd /home/michn/Software/datasim/build/src/sensors && /usr/lib64/ccache/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/michn/Software/datasim/src/sensors/main.cpp -o CMakeFiles/main.dir/main.cpp.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

src/sensors/main: src/sensors/CMakeFiles/main.dir/main.cpp.o
src/sensors/main: src/sensors/CMakeFiles/main.dir/build.make
src/sensors/main: src/libpaho-mqttpp3.so.1.2.0
src/sensors/main: /usr/local/lib64/libpaho-mqtt3as.so
src/sensors/main: /usr/lib64/libssl.so
src/sensors/main: /usr/lib64/libcrypto.so
src/sensors/main: src/sensors/CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/michn/Software/datasim/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable main"
	cd /home/michn/Software/datasim/build/src/sensors && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/sensors/CMakeFiles/main.dir/build: src/sensors/main
.PHONY : src/sensors/CMakeFiles/main.dir/build

src/sensors/CMakeFiles/main.dir/clean:
	cd /home/michn/Software/datasim/build/src/sensors && $(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : src/sensors/CMakeFiles/main.dir/clean

src/sensors/CMakeFiles/main.dir/depend:
	cd /home/michn/Software/datasim/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/michn/Software/datasim /home/michn/Software/datasim/src/sensors /home/michn/Software/datasim/build /home/michn/Software/datasim/build/src/sensors /home/michn/Software/datasim/build/src/sensors/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/sensors/CMakeFiles/main.dir/depend
