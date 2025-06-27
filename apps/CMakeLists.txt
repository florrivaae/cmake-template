add_executable(app "main.cpp")

target_link_libraries(app PRIVATE core)

set_target_properties(app PROPERTIES FOLDER "App")

add_compile_commands_copy_target(app)
