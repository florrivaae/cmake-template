cmake_minimum_required (VERSION 3.22)

set(CMAKE_CXX_STANDARD 20)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

project (
  "cmake_template"
  VERSION 0.1
  LANGUAGES C CXX
)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(NoInSourceBuilds)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)

add_definitions(-DRES_PATH="${PROJECT_SOURCE_DIR}/res")

if(MSVC)
 set(CMAKE_CXX_FLAGS_CUSTOM /W4 /WX /permissive- /we6246)
 message("CUSTOM LOG: Setting compiler flags globally for MSVC: ${CMAKE_CXX_FLAGS_CUSTOM}")
elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
 set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
 set(CMAKE_CXX_FLAGS_CUSTOM -Wall -Wextra -Werror -Wpedantic -Wshadow)
 message("CUSTOM LOG: Setting compiler flags globally for GCC/Clang:${CMAKE_CXX_FLAGS_CUSTOM}")
endif()

# Include sub-projects.
add_subdirectory(extern)
add_subdirectory(src)
add_subdirectory(apps bin)