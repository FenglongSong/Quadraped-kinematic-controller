# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.18.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.18.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild

# Utility rule file for tinyobjloader-populate.

# Include the progress variables for this target.
include CMakeFiles/tinyobjloader-populate.dir/progress.make

CMakeFiles/tinyobjloader-populate: CMakeFiles/tinyobjloader-populate-complete


CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-install
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-mkdir
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-download
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-update
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-patch
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-configure
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-build
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-install
CMakeFiles/tinyobjloader-populate-complete: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'tinyobjloader-populate'"
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles/tinyobjloader-populate-complete
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-done

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-install: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'tinyobjloader-populate'"
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E echo_append
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-install

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'tinyobjloader-populate'"
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-src
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/tmp
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-mkdir

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-download: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-urlinfo.txt
tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-download: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'tinyobjloader-populate'"
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps && /usr/local/Cellar/cmake/3.18.3/bin/cmake -P /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/download-tinyobjloader-populate.cmake
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps && /usr/local/Cellar/cmake/3.18.3/bin/cmake -P /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/verify-tinyobjloader-populate.cmake
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps && /usr/local/Cellar/cmake/3.18.3/bin/cmake -P /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/extract-tinyobjloader-populate.cmake
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-download

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-update: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'tinyobjloader-populate'"
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E echo_append
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-update

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-patch: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'tinyobjloader-populate'"
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E echo_append
	/usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-patch

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-configure: tinyobjloader-populate-prefix/tmp/tinyobjloader-populate-cfgcmd.txt
tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-configure: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No configure step for 'tinyobjloader-populate'"
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E echo_append
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-configure

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-build: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No build step for 'tinyobjloader-populate'"
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E echo_append
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-build

tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-test: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "No test step for 'tinyobjloader-populate'"
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E echo_append
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-test

tinyobjloader-populate: CMakeFiles/tinyobjloader-populate
tinyobjloader-populate: CMakeFiles/tinyobjloader-populate-complete
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-install
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-mkdir
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-download
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-update
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-patch
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-configure
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-build
tinyobjloader-populate: tinyobjloader-populate-prefix/src/tinyobjloader-populate-stamp/tinyobjloader-populate-test
tinyobjloader-populate: CMakeFiles/tinyobjloader-populate.dir/build.make

.PHONY : tinyobjloader-populate

# Rule to build all files generated by this target.
CMakeFiles/tinyobjloader-populate.dir/build: tinyobjloader-populate

.PHONY : CMakeFiles/tinyobjloader-populate.dir/build

CMakeFiles/tinyobjloader-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tinyobjloader-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tinyobjloader-populate.dir/clean

CMakeFiles/tinyobjloader-populate.dir/depend:
	cd /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/CMakeFiles/tinyobjloader-populate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tinyobjloader-populate.dir/depend

