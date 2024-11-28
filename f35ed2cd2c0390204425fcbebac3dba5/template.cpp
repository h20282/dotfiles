#include <iostream>

inline void print(const char *f) {
    std::cout << f;
}

template <typename First, typename... Rest>
inline void print(const char *format, const First &first, const Rest &...rest) {
    if (*format == '\0') { return; }
    while (*format && !(format[0] == '{' && (format[1] == '}'))) {
        putchar(*format++);
    }
    std::cout << first;
    print(format + 2, rest...);
}

int main() {
    print("{}, {}\n", "hello", "world");
    return 0;
}
