#include <iostream>
#include <core/public_foo.hpp>

int main()
{
	std::cout << "Hello CMake." << std::endl;
	int foo = publicFoo();
	return 0;
}