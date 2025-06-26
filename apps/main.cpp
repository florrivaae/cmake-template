#include <core/public_foo.hpp>
#include <iostream>

int main()
{
  std::cout << "Hello CMake." << std::endl;
  int foo = publicFoo();
  return 0;
}
