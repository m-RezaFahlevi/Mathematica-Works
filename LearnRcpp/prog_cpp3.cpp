#include <bits/stdc++.h>
using namespace std;

bool *duplicatedCpp(vector<int> v_vect) {
	unordered_set<int> seen;

	// dynamically to allocate memory to contain
	// a block (an array) of elements of its type
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
	
	/*
	 * After the memory is dynamically allocate to a block
	 * (an array) to its type, then the memory that already
	 * allocated can be freed by using delete or delete[]
	 * operator. When the program is end or finish in execution,
	 * all the memory it used is returned to the operating system.
	 * Nevertheless, it is good practice to free the memory which
	 * is already allocated to.
	 */
	delete[] vbool;
}
