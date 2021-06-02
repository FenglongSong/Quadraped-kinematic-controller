# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.18.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(tinyobjloader-populate NONE)

include(ExternalProject)
ExternalProject_Add(tinyobjloader-populate
                     "UPDATE_DISCONNECTED" "False" "URL" "https://github.com/tinyobjloader/tinyobjloader/archive/v2.0-rc1.zip" "URL_HASH" "MD5=f660a9f91fc2ea5c4f33d7530f6a69bc"
                    SOURCE_DIR          "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-src"
                    BINARY_DIR          "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


