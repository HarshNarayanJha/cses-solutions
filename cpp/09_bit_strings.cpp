#include <iostream>

typedef unsigned long ul;

#define MOD (ul)(1e9 + 7)

ul binPow(ul b, ul n) {
    if (n == 0) return 1;
    if (n == 1) return b % MOD;

    ul res = binPow(b, n / 2);
    res    = (res * res) % MOD;

    if ((n & 0x1) != 0) res = (res * b) % MOD;

    return res;
}

int main() {
    std::ios::sync_with_stdio(false);
    int n;
    std::cin >> n;
    ul res = binPow(2, n);

    std::cout << res << std::endl;
    return 0;
}
