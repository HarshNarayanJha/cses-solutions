#include <iostream>
#include <sstream>

using namespace std;

int main() {
    int n;
    cin >> n;

    // consume the \n
    string line;
    getline(cin, line);

    for (int i = 0; i < n; i++) {
        getline(cin, line);

        istringstream ss(line);
        long x, y;

        ss >> y;
        ss >> x;

        if (x == 1 && y == 1) {
            printf("1");
        } else if (x > y) {
            if (x % 2 != 0)
                printf("%ld", x * x - y + 1);
            else
                printf("%ld", (x - 1) * (x - 1) + y);
        } else {
            if (y % 2 == 0)
                printf("%ld", y * y - x + 1);
            else
                printf("%ld", (y - 1) * (y - 1) + x);
        }

        printf("\n");
    }

    return 0;
}
