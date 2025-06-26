#include <core/foo.hpp>
#include <core/public_foo.hpp>

int foo() { return 200; }

int publicFoo() { return foo(); }
