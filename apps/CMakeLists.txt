add_executable(main "main.cpp")

target_link_libraries(main PRIVATE core)

set_target_properties(main PROPERTIES FOLDER "App")