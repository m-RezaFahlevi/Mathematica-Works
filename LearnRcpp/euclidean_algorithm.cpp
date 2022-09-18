#include <bits/stdc++.h>
using namespace std;

vector<int> gcd(int a, int b) {
	// if a < b, then swap the value of a and b
	// such that a > b
	int mod_counter = 0;
	if (a < b) {
		int temp = a;
		a = b;
		b = temp;
	}
	while (b != 0) {
		int r = a % b;	// i.e., r = a mod b
		a = b;
		b = r;
		mod_counter++;
	}
	vector<int> gcd_ret = {a, mod_counter};
	return gcd_ret;
}

vector<pair<int, int>> generate_intpairs(int given_range) {
	vector<pair<int, int>> intpairs;
	for (int i = 0; i <= given_range; i++) {
		for (int j = 0; j <= given_range; j++) {
			if ((i == 0 && j == 0) || (i == 1 && j == 1))
				continue;
			intpairs.push_back(pair<int, int>(i, j));
		}
	}
	return intpairs;
}

int main(void) {
	int created_range = 50; // pair numbers (a, b) such that 0 <= a,b <= created_range
	vector<pair<int, int>> integer_pairs = generate_intpairs(created_range);
	map<int, pair<int, int>> nmod;

	// print the gcd pair as table
	vector<pair<int, int>>::iterator ptr_intpairs;
	for (ptr_intpairs = integer_pairs.begin(); ptr_intpairs != integer_pairs.end(); ++ptr_intpairs) {
		vector<int> calcgcd = gcd(ptr_intpairs->first, ptr_intpairs->second);
		if (ptr_intpairs->second == created_range)
			cout << calcgcd.at(0) << endl;
		else
			cout << calcgcd.at(0) << " ";
	} cout << "\n";

	// print how many times operator mod is executed
	for (ptr_intpairs =  integer_pairs.begin(); ptr_intpairs != integer_pairs.end(); ++ptr_intpairs) {
		vector<int> calcgcd = gcd(ptr_intpairs->first, ptr_intpairs->second);
		if (ptr_intpairs->second == created_range)
			cout << calcgcd.at(1) << endl;
		else
			cout << calcgcd.at(1) << " ";
	} cout << "\n";

	// print the gcd(a, b)
	for (ptr_intpairs = integer_pairs.begin(); ptr_intpairs != integer_pairs.end(); ++ptr_intpairs) {
		vector<int> calcgcd = gcd(ptr_intpairs->first, ptr_intpairs->second);
		cout << "gcd(" << ptr_intpairs->first << ", " << ptr_intpairs->second << ") ";
		cout << "= " << calcgcd.at(0) << " ";
		cout << "with " <<  calcgcd.at(1) << " times modulo operate\n";
	}

	// print the smallest input pair a, b, a > b, that requires 
	// n modulus operations in the Euclidean algorithm
	//
	// insert to nmod map
	for (ptr_intpairs = integer_pairs.begin(); ptr_intpairs != integer_pairs.end(); ++ptr_intpairs) {
		int calcnmod = gcd(ptr_intpairs->first, ptr_intpairs->second).at(1);
		nmod.insert(pair<int, pair<int, int>>(calcnmod, pair<int, int>(ptr_intpairs->first, ptr_intpairs->second)));
	}

	// print the output
	cout << "\na\tb\t" << "number of modulus operations\n";
	map<int, pair<int, int>>::iterator itrmap;
	for (itrmap = nmod.begin(); itrmap != nmod.end(); ++itrmap) {
		cout << itrmap->second.second << "\t" << itrmap->second.first << "\t";
		cout << itrmap->first << endl;
	}
}
