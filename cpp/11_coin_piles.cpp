#include <iostream>

using namespace std;

int main() {
    int n;
    cin >> n;

    while (n--) {
        int a, b;
        cin >> a >> b;

        if ((a + b) % 3 == 0 && min(a, b) * 2 >= max(a, b)) {
            cout << "YES" << endl;
        } else {
            cout << "NO" << endl;
        }
    }

    return 0;
}
