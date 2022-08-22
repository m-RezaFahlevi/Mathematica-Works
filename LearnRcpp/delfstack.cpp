#include <iostream>
#include <vector>
#include <iterator>

using std::cout; using std::endl;
using std::vector;

vector<int> multiplyByFour(vector<int> &arr)
{
    vector<int> mult;
    mult.reserve(arr.size());

    for (const auto &i : arr) {
        mult.push_back(i * 4);
    }
    return mult;
}

int main() {
    vector<int> arr = {1,2,3,4,5,6,7,8,9,10};
    vector<int> arrby4;

    arrby4 = multiplyByFour(arr);

    cout << "arr    - | ";
    copy(arr.begin(), arr.end(),
         std::ostream_iterator<int>(cout," | "));
    cout << endl;
    cout << "arrby4 - | ";
    copy(arrby4.begin(), arrby4.end(),
         std::ostream_iterator<int>(cout," | "));
    cout << endl;


    return EXIT_SUCCESS;
}

