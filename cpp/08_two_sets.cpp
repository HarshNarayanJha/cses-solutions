#include <iostream>
#include <set>

using namespace std;

int main() {
    long n;
    cin >> n;

    long s = n * (n + 1) / 2;
    if (s % 2 != 0) {
        cout << "NO" << endl;
        return 0;
    }

    cout << "YES" << endl;

    s /= 2;

    set<int> left;
    while (s >= n) {
        left.insert(n);
        s -= n;
        n -= 1;
    }

    if (s > 0) {
        left.insert(s);
    }

    set<int> right;
    for (int i = 1; i <= n; i++) {
        if (left.find(i) == left.end()) {
            right.insert(i);
        }
    }

    cout << left.size() << endl;
    for (const int &i : left) {
        cout << i << ' ';
    }
    cout << endl;

    cout << right.size() << endl;
    for (const int &i : right) {
        cout << i << ' ';
    }
    cout << endl;

    return 0;
}
