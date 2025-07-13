#include <algorithm>
#include <iostream>
#include <map>
#include <vector>

using namespace std;

int total(const map<char, int> *choices) {
    int t = 0;
    for (const auto &e : *choices) {
        t += e.second;
    }

    return t;
}

pair<char, int> most_common(const map<char, int> *choices) {
    vector<pair<char, int>> heapVec(choices->begin(), choices->end());
    make_heap(heapVec.begin(), heapVec.end(), [](const auto &a, const auto &b) {
        return a.second < b.second;
    });

    return *heapVec.begin();
}

int main() {
    string line;
    cin >> line;

    int n = line.size();

    map<char, int> choices;

    for (const char &c : line) {
        choices.insert_or_assign(c, choices[c] + 1);
    }

    vector<char> left;

    while (total(&choices) > 0) {
        pair<char, int> l = most_common(&choices);
        if (l.second >= 2) {
            for (int i = 0; i < l.second / 2; i++) {
                left.push_back(l.first);
            }
            choices.insert_or_assign(l.first, l.second - (l.second / 2) * 2);
        } else if (l.second == 1) {
            left.push_back(l.first);
            choices.insert_or_assign(l.first, l.second - 1);
            break;
        }
    }

    pair<char, int> l = most_common(&choices);
    if (l.second == 0) {
        for (const char &c : left) {
            cout << c;
        }
        int start = left.size() - ((n & 0x1) == 0 ? 1 : 2);
        for (int i = start; i >= 0; i--) {
            cout << left[i];
        }
    } else {
        cout << "NO SOLUTION" << endl;
    }
}
