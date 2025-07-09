#include <iostream>

using namespace std;

int main() {
    int n;
    cin >> n;

    for (int k = 1; k < n + 1; k++) {
        cout << (long)k * k * (k * k - 1) / 2 - 4 * (k - 2) * (k - 1) << endl;
    }

    return 0;
}
