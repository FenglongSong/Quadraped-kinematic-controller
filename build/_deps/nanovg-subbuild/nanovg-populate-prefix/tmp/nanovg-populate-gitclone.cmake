
if(NOT "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-subbuild/nanovg-populate-prefix/src/nanovg-populate-stamp/nanovg-populate-gitinfo.txt" IS_NEWER_THAN "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-subbuild/nanovg-populate-prefix/src/nanovg-populate-stamp/nanovg-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-subbuild/nanovg-populate-prefix/src/nanovg-populate-stamp/nanovg-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/local/bin/git"  clone --no-checkout "https://github.com/memononen/nanovg" "nanovg-src"
    WORKING_DIRECTORY "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/memononen/nanovg'")
endif()

execute_process(
  COMMAND "/usr/local/bin/git"  checkout 077b65e0cf3e22ee4f588783e319b19b0a608065 --
  WORKING_DIRECTORY "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: '077b65e0cf3e22ee4f588783e319b19b0a608065'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/local/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-subbuild/nanovg-populate-prefix/src/nanovg-populate-stamp/nanovg-populate-gitinfo.txt"
    "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-subbuild/nanovg-populate-prefix/src/nanovg-populate-stamp/nanovg-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/nanovg-subbuild/nanovg-populate-prefix/src/nanovg-populate-stamp/nanovg-populate-gitclone-lastrun.txt'")
endif()

