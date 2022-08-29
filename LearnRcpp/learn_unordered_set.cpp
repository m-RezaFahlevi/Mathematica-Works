#include <bits/stdc++.h>
using namespace std;

int main(void) {
	unordered_set<int> v_vect = {2, 3, 5, 7};
	cout << v_vect.insert(11).second << endl;
	unordered_set<int>::iterator ptrmain = v_vect.begin();
	for (; ptrmain != v_vect.end(); ++ptrmain)
		cout << *ptrmain << " ";
	cout << endl;

	cout << "Display member of unordered_set directly\n";
	for (const int &nahlen: v_vect)
		cout << nahlen << " ";
	cout << endl;
	
	// checking
	cout << "checking whether a new element already inserted or not\n";
	pair<unordered_set<int>::iterator, bool> ret = v_vect.insert(11);
	cout << *ret.first << endl;
	cout << ret.second << endl;
}
