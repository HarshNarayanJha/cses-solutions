#include <iostream>
#include <string>

int main() {
    std::string line;
    std::cin >> line;

    int longest = 1;
    int t       = 1;

    for (size_t i = 1; i < line.size(); i++) {
        if (line[i] == line[i - 1]) {
            t++;
        } else {
            longest = std::max(longest, t);
            t       = 1;
        }
    }

    longest = std::max(longest, t);
    std::cout << longest;
}
