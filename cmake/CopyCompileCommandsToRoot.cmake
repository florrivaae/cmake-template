if(!CMAKE_EXPORT_COMPILE_COMMANDS OR !ENABLE_COMPILE_COMANDS_COPY_TO_ROOT)

  if(!CMAKE_EXPORT_COMPILE_COMMANDS)
    message(STATUS " 🔴 compile_commands.json generation is disabled in this project")
  elseif(!ENABLE_COMPILE_COMANDS_COPY_TO_ROOT)
    message(STATUS " 🔴 compile_commands.json copying to root is disabled in this project")
  endif()

  function(add_compile_commands_copy_target target)
    # just a stub
  endfunction()

else()

  set(INIT_PATH "${CMAKE_BINARY_DIR}/compile_commands.json")
  set(ROOT_PATH "${CMAKE_SOURCE_DIR}/compile_commands.json")

  if(WIN32 AND ENABLE_FORMATTING_WORKAROUND_WIN)

    set(FORMAT_SCRIPT "${CMAKE_SOURCE_DIR}/cmake/FormatCompileCommands.cmake")

    message(STATUS "🟢 Compilation database will be formatted and copied to the root of the project!")

    # Call this function after last user-defined target (entrypoint exec)
    function(add_compile_commands_copy_target target)

      # This command FORMATS AND COPIES COMPILE_COMMANDS.JSON to root dir
      add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND}
          -D INPUT_FILE=${INIT_PATH}
          -P ${FORMAT_SCRIPT}
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
          ${INIT_PATH}
          ${ROOT_PATH}
          COMMENT "Updating compile_commands.json"
          VERBATIM
        )
    endfunction()
  else()

    message(STATUS "🟢 Compilation database will be copied to the root of the project!")

    # Call this function after last user-defined target (entrypoint exec)
    function(add_compile_commands_copy_target target)

      # This command COPIES COMPILE_COMMANDS.JSON to root dir
      add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
          ${INIT_PATH}
          ${ROOT_PATH}
          COMMENT "Updating compile_commands.json"
          VERBATIM
        )
    endfunction()
  endif()
endif()
