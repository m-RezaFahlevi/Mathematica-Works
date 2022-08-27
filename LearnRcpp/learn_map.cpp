#include <bits/stdc++.h>
using namespace std;

int main(void) {
	map<int, int> nats;
	
	// define the domain and the co-domain;
	vector<int> domain_nats = {1, 2, 3, 4, 5, 6, 7};
	vector<int> codomain_nats= {2, 3, 5, 7, 11, 13, 17};

	// declare a requiared iterator
	vector<int>::iterator dn_itr = domain_nats.begin();
	vector<int>::iterator cn_itr = codomain_nats.begin();

	// classic insertion
	for (; dn_itr != domain_nats.end(); ++dn_itr) {
		nats.insert(pair<int, int>(*dn_itr, *cn_itr));
		++cn_itr;
	}

	// print the output
	map<int, int>::iterator itrloc;
	for (itrloc = nats.begin(); itrloc != nats.end(); ++itrloc)
		cout << "f(" << itrloc->first << ") = " << itrloc->second << endl;
}
