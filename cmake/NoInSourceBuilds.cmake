if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR
    "\n"
    "In-source builds are not allowed.\n"
    "Instead, provide a path to binary directory for CMake like so:\n"
    "cmake -B <destination>\n"
    "OR\n"
    "'binaryDir': '${sourceDir}/build/${presetName}' in CMakePresets.json\n"
    "\n"
    "To remove files you accidentally created execute:\n"
    "rm -rf CMakeFiles CMakeCache.txt\n"
  )
 endif()