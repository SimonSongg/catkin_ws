# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/adv/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adv/catkin_ws/build

# Include any dependencies generated for this target.
include simple_follower/CMakeFiles/avoidance.dir/depend.make

# Include the progress variables for this target.
include simple_follower/CMakeFiles/avoidance.dir/progress.make

# Include the compile flags for this target's objects.
include simple_follower/CMakeFiles/avoidance.dir/flags.make

simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o: simple_follower/CMakeFiles/avoidance.dir/flags.make
simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o: /home/adv/catkin_ws/src/simple_follower/src/avoidance.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/adv/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o"
	cd /home/adv/catkin_ws/build/simple_follower && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/avoidance.dir/src/avoidance.cpp.o -c /home/adv/catkin_ws/src/simple_follower/src/avoidance.cpp

simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/avoidance.dir/src/avoidance.cpp.i"
	cd /home/adv/catkin_ws/build/simple_follower && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/adv/catkin_ws/src/simple_follower/src/avoidance.cpp > CMakeFiles/avoidance.dir/src/avoidance.cpp.i

simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/avoidance.dir/src/avoidance.cpp.s"
	cd /home/adv/catkin_ws/build/simple_follower && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/adv/catkin_ws/src/simple_follower/src/avoidance.cpp -o CMakeFiles/avoidance.dir/src/avoidance.cpp.s

simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.requires:

.PHONY : simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.requires

simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.provides: simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.requires
	$(MAKE) -f simple_follower/CMakeFiles/avoidance.dir/build.make simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.provides.build
.PHONY : simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.provides

simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.provides.build: simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o


# Object files for target avoidance
avoidance_OBJECTS = \
"CMakeFiles/avoidance.dir/src/avoidance.cpp.o"

# External object files for target avoidance
avoidance_EXTERNAL_OBJECTS =

/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: simple_follower/CMakeFiles/avoidance.dir/build.make
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/libroscpp.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/librosconsole.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/librostime.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /opt/ros/melodic/lib/libcpp_common.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/adv/catkin_ws/devel/lib/simple_follower/avoidance: simple_follower/CMakeFiles/avoidance.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/adv/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/adv/catkin_ws/devel/lib/simple_follower/avoidance"
	cd /home/adv/catkin_ws/build/simple_follower && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/avoidance.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
simple_follower/CMakeFiles/avoidance.dir/build: /home/adv/catkin_ws/devel/lib/simple_follower/avoidance

.PHONY : simple_follower/CMakeFiles/avoidance.dir/build

simple_follower/CMakeFiles/avoidance.dir/requires: simple_follower/CMakeFiles/avoidance.dir/src/avoidance.cpp.o.requires

.PHONY : simple_follower/CMakeFiles/avoidance.dir/requires

simple_follower/CMakeFiles/avoidance.dir/clean:
	cd /home/adv/catkin_ws/build/simple_follower && $(CMAKE_COMMAND) -P CMakeFiles/avoidance.dir/cmake_clean.cmake
.PHONY : simple_follower/CMakeFiles/avoidance.dir/clean

simple_follower/CMakeFiles/avoidance.dir/depend:
	cd /home/adv/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adv/catkin_ws/src /home/adv/catkin_ws/src/simple_follower /home/adv/catkin_ws/build /home/adv/catkin_ws/build/simple_follower /home/adv/catkin_ws/build/simple_follower/CMakeFiles/avoidance.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : simple_follower/CMakeFiles/avoidance.dir/depend

