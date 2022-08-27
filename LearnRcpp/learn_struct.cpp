#include <bits/stdc++.h>
using namespace std;

struct product {
	int weight;
	double price;
};

product apple;

int main(void) {
	apple.weight = 32;
	apple.price = 32.5;

	cout << "The apple product is " << endl;
	cout << "Weight : " << apple.weight;
	cout << "\nPrice : " << apple.price << endl;

	cout << "\nUsing arrow operator\n";

	product *ptr_prod = &apple;
	cout << "The apple product is\n";
	cout << "Weight : " << ptr_prod->weight << endl;
	cout << "Price : " << ptr_prod->price << endl;

	cout << "\nWritting the equivalent term of arrow operator\n";
	cout << "The apple product is\n";
	cout << "Weight : " << (*ptr_prod).weight << endl;
	cout << "Price : " << (*ptr_prod).price << endl;
}
