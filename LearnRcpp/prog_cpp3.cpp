#include <bits/stdc++.h>
using namespace std;

bool *duplicatedCpp(vector<int> v_vect) {
	unordered_set<int> seen;
	bool *v_bool = new bool[v_vect.size()];

	vector<int>::iterator ptrloc;
	bool *ptrarr = v_bool;
	for (ptrloc = v_vect.begin(); ptrloc != v_vect.end(); ++ptrloc) {
		*ptrarr = !seen.insert(*ptrloc).second;
		++ptrarr;
	}
	
	return v_bool;
}

int main(void) {
	vector<int> created_vect = {2, 3, 3, 5};
	bool *vbool = duplicatedCpp(created_vect);

	int n = created_vect.size();
	for (bool *ptrloc = vbool; ptrloc != vbool + n; ++ptrloc)
		cout << *ptrloc << " ";
	cout << endl;
}
