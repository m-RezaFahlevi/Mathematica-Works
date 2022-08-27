#include <bits/stdc++.h>
#include <utility>
using namespace std;

struct product {
	int weight;
	double price;
};

product apple;

int main(void) {
	apple.weight = 32;
	apple.price = 32.5;

	// writting an equivalent term 
	// using pair utility
	pair<int, double> an_apple;
	an_apple = make_pair(32, 32.5);

	cout << "The apple product is " << endl;
	cout << "Weight : " << apple.weight;
	cout << "\nPrice : " << apple.price << endl;

	cout << "\nUsing arrow operator\n";

	product *ptr_prod = &apple;
	pair<int, double> *ptr_pair = &an_apple;
	cout << "The apple product is\n";
	cout << "Weight : " << ptr_prod->weight << endl;
	cout << "Price : " << ptr_prod->price << endl;

	cout << "\nWritting the equivalent term of arrow operator\n";
	cout << "The apple product is\n";
	cout << "Weight : " << (*ptr_prod).weight << endl;
	cout << "Price : " << (*ptr_prod).price << endl;

	cout << "\nWritting the equivalent term of apple using a pair\n";
	cout << "The apple product is\n";
	cout << "Weight : " << an_apple.first << endl;
	cout << "Price : " << an_apple.second << endl;

	cout << "\nPair output using arrow operator\n";
	cout << "The apple product is\n";
	cout << "Weight : " << ptr_pair->first << endl;
	cout << "Price : " << ptr_pair->second << endl;
}
