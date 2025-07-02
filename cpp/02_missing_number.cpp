#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int main() {
    int n;
    cin >> n;

    // consume the \n
    string line;
    getline(cin, line);

    vector<int> nums;

    getline(cin, line);
    istringstream ss(line, istringstream::in);
    int temp;

    while (ss >> temp) {
        nums.push_back(temp);
    }

    long actual = 0;
    for (int i = 0; i < n - 1; i++) {
        actual += (long)nums[i];
    }

    long sum = (long)n * (n + 1) / (long)2;
    printf("%ld\n", sum - actual);
}
