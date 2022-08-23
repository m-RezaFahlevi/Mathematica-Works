#include <bits/stdc++.h>
using namespace std;

int main(void) {
	int st_val, nd_val;
	int *ptr1, *ptr2;

	ptr1 = &st_val;
	*ptr1 = 3;
	ptr2 = &nd_val;
	*ptr2 = 5;

	cout << "The value of st_val and nd_val are, respectively, ";
	cout << st_val << " and " << nd_val << endl;

	ptr2 = ptr1;
	*ptr2 = 13;

	cout << "st_val is changed by ptr2, hence, st_val is ";
	cout << st_val << endl;

	// pointers and arrays
	int numbers[5];
  	int * p;
  	p = numbers;  *p = 10;
  	p++;  *p = 20;
  	p = &numbers[2];  *p = 30;
  	p = numbers + 3;  *p = 40;
  	p = numbers;  *(p+4) = 50;
  	for (int n=0; n<5; n++)
    	cout << numbers[n] << ", ";	
}
