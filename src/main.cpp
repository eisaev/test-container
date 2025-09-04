#include <array>
#include <format>
#include <iostream>

int main(int argc, char* argv[])
{
    auto xxx { 8U };
    int* i { new int(123) };
    std::cout << "Absolutely useless app!" << std::endl;
    std::cout << std::format("{}", 123) << std::endl;
    std::array<int, 3> arr { 1, 2, 3 };
    return 0;
}
