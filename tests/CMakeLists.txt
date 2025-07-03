include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

enable_testing()

include(GoogleTest)

add_executable(test1 fooTest.cpp)

target_include_directories(test1
  SYSTEM PUBLIC
  $<TARGET_PROPERTY:GTest::gtest_main,INTERFACE_INCLUDE_DIRECTORIES>
)
target_link_libraries(test1 GTest::gtest_main)

gtest_discover_tests(test1)

set_target_properties(test1 PROPERTIES FOLDER "Tests")
set_target_properties(gmock PROPERTIES FOLDER "Tests")
set_target_properties(gmock_main PROPERTIES FOLDER "Tests")
set_target_properties(gtest PROPERTIES FOLDER "Tests")
set_target_properties(gtest_main PROPERTIES FOLDER "Tests")
