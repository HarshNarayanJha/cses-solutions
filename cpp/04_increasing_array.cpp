#include <iostream>
#include <sstream>
#include <vector>

using namespace std;

int main() {
    long n;
    cin >> n;

    // consume the \n
    string line;
    getline(cin, line);

    vector<int> nums;

    getline(cin, line);
    istringstream ss(line, istringstream::in);

    long temp;
    while (ss >> temp) {
        nums.push_back(temp);
    }

    long moves = 0;
    for (int i = 1; i < n; i++) {
        if (nums[i] < nums[i - 1]) {
            long diff = nums[i - 1] - nums[i];
            moves += diff;
            nums[i] = nums[i - 1];
        }
    }

    cout << moves;
}
