#include <fmt/format.h>
#include <iostream>

int main() {

    std::cout << fmt::format("hello, {}", "world") << std::endl;
    return 0;
}
