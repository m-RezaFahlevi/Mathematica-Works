#include <bits/stdc++.h>
using namespace std;

int main(void) {
	unordered_set<int> v_vect = {2, 3, 5, 7};
	cout << *v_vect.insert(11).first << endl;
	unordered_set<int>::iterator ptrmain = v_vect.begin();
	for (; ptrmain != v_vect.end(); ++ptrmain)
		cout << *ptrmain << " ";
}
