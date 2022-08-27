#include <bits/stdc++.h>
using namespace std;

int main(void) {
	map<char, int> nats;
	
	// define the domain and the co-domain;
	vector<char> domain_nats = {'1', '2', '3', '4', '5', '6', '7'};
	vector<int> codomain_nats= {2, 3, 5, 7, 11, 13, 17};

	// declare a requiared iterator
	vector<char>::iterator dn_itr = domain_nats.begin();
	vector<int>::iterator cn_itr = codomain_nats.begin();

	// classic insertion
	for (; dn_itr != domain_nats.end(); ++dn_itr) {
		nats.insert(pair<char, int>(*dn_itr, *cn_itr));
		++cn_itr;
	}

	// print the output
	map<char, int>::iterator itrloc;
	for (itrloc = nats.begin(); itrloc != nats.end(); ++itrloc)
		cout << "f(" << itrloc->first << ") = " << itrloc->second << endl;
	
	// find function
	cout << nats.find('2')->first << endl;

	// checking
	pair<map<char, int>::iterator, bool> ret;
	ret = nats.insert(pair<char, int> ('3', 12));
	cout << ret.first->second << endl;
	cout << ret.second << endl; // it's false
	
	ret = nats.insert(pair<char, int> ('8', 19));
	cout << endl << "f(" << ret.first->first << ") = " << ret.first->second << endl;
	cout << ret.second << endl;
}
