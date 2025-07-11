#include <cmath>
#include <iostream>

int main() {
    std::ios::sync_with_stdio(false);
    long n;
    std::cin >> n;

    long z = 0, i = 1;

    while (true) {
        long k = n / (long)std::pow(5, i);
        if (k < 1) break;
        z += k;
        i += 1;
    }

    std::cout << z << std::endl;
}
