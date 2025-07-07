#include <iostream>

using namespace std;

int main() {
    int n;
    cin >> n;

    if (n == 1) {
        cout << 1;
        return 0;
    }

    if (n <= 3) {
        cout << "NO SOLUTION";
        return 0;
    }

    int value = 2;
    while (value <= n) {
        cout << value << ' ';
        value += 2;
    }

    value = 1;
    while (value <= n) {
        cout << value << ' ';
        value += 2;
    }

    return 0;
}
