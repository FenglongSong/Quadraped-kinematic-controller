# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

function(check_file_hash has_hash hash_is_good)
  if("${has_hash}" STREQUAL "")
    message(FATAL_ERROR "has_hash Can't be empty")
  endif()

  if("${hash_is_good}" STREQUAL "")
    message(FATAL_ERROR "hash_is_good Can't be empty")
  endif()

  if("MD5" STREQUAL "")
    # No check
    set("${has_hash}" FALSE PARENT_SCOPE)
    set("${hash_is_good}" FALSE PARENT_SCOPE)
    return()
  endif()

  set("${has_hash}" TRUE PARENT_SCOPE)

  message(STATUS "verifying file...
       file='/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip'")

  file("MD5" "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip" actual_value)

  if(NOT "${actual_value}" STREQUAL "f660a9f91fc2ea5c4f33d7530f6a69bc")
    set("${hash_is_good}" FALSE PARENT_SCOPE)
    message(STATUS "MD5 hash of
    /Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip
  does not match expected value
    expected: 'f660a9f91fc2ea5c4f33d7530f6a69bc'
      actual: '${actual_value}'")
  else()
    set("${hash_is_good}" TRUE PARENT_SCOPE)
  endif()
endfunction()

function(sleep_before_download attempt)
  if(attempt EQUAL 0)
    return()
  endif()

  if(attempt EQUAL 1)
    message(STATUS "Retrying...")
    return()
  endif()

  set(sleep_seconds 0)

  if(attempt EQUAL 2)
    set(sleep_seconds 5)
  elseif(attempt EQUAL 3)
    set(sleep_seconds 5)
  elseif(attempt EQUAL 4)
    set(sleep_seconds 15)
  elseif(attempt EQUAL 5)
    set(sleep_seconds 60)
  elseif(attempt EQUAL 6)
    set(sleep_seconds 90)
  elseif(attempt EQUAL 7)
    set(sleep_seconds 300)
  else()
    set(sleep_seconds 1200)
  endif()

  message(STATUS "Retry after ${sleep_seconds} seconds (attempt #${attempt}) ...")

  execute_process(COMMAND "${CMAKE_COMMAND}" -E sleep "${sleep_seconds}")
endfunction()

if("/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip" STREQUAL "")
  message(FATAL_ERROR "LOCAL can't be empty")
endif()

if("https://github.com/tinyobjloader/tinyobjloader/archive/v2.0-rc1.zip" STREQUAL "")
  message(FATAL_ERROR "REMOTE can't be empty")
endif()

if(EXISTS "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip")
  check_file_hash(has_hash hash_is_good)
  if(has_hash)
    if(hash_is_good)
      message(STATUS "File already exists and hash match (skip download):
  file='/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip'
  MD5='f660a9f91fc2ea5c4f33d7530f6a69bc'"
      )
      return()
    else()
      message(STATUS "File already exists but hash mismatch. Removing...")
      file(REMOVE "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip")
    endif()
  else()
    message(STATUS "File already exists but no hash specified (use URL_HASH):
  file='/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip'
Old file will be removed and new file downloaded from URL."
    )
    file(REMOVE "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip")
  endif()
endif()

set(retry_number 5)

message(STATUS "Downloading...
   dst='/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip'
   timeout='none'"
)

foreach(i RANGE ${retry_number})
  sleep_before_download(${i})

  foreach(url https://github.com/tinyobjloader/tinyobjloader/archive/v2.0-rc1.zip)
    message(STATUS "Using src='${url}'")

    
    
    
    

    file(
        DOWNLOAD
        "${url}" "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip"
        SHOW_PROGRESS
        # no TIMEOUT
        STATUS status
        LOG log
        
        
    )

    list(GET status 0 status_code)
    list(GET status 1 status_string)

    if(status_code EQUAL 0)
      check_file_hash(has_hash hash_is_good)
      if(has_hash AND NOT hash_is_good)
        message(STATUS "Hash mismatch, removing...")
        file(REMOVE "/Users/fenglongsong/Documents/GitHub/a2-FenglongSong/build/_deps/tinyobjloader-subbuild/tinyobjloader-populate-prefix/src/v2.0-rc1.zip")
      else()
        message(STATUS "Downloading... done")
        return()
      endif()
    else()
      string(APPEND logFailedURLs "error: downloading '${url}' failed
       status_code: ${status_code}
       status_string: ${status_string}
       log:
       --- LOG BEGIN ---
       ${log}
       --- LOG END ---
       "
      )
    endif()
  endforeach()
endforeach()

message(FATAL_ERROR "Each download failed!
  ${logFailedURLs}
  "
)
