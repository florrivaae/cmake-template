if(!CMAKE_EXPORT_COMPILE_COMMANDS)
  message(STATUS " 🔴 compile_commands.json generation is disabled in this project")
else()
  # Function to add copy command to a target
  # Call this function after configuring user-defined targets (app, core, etc.)
  function(add_compile_commands_copy_target target)
    add_custom_command(
      TARGET ${target}
      POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy_if_different
        "${CMAKE_BINARY_DIR}/compile_commands.json"
        "${CMAKE_SOURCE_DIR}/compile_commands.json"
        COMMENT "Updating compile_commands.json"
        VERBATIM
      )
  endfunction()
endif()
