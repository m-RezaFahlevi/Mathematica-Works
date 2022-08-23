// pointers as arguments:
#include <bits/stdc++.h>
using namespace std;

void increment_all (int* start, int* stop)
{
  int *current = start;
  while (current != stop) {
    ++(*current);  // increment value pointed
    ++current;     // increment pointer
  }
}

void print_all (const int* start, const int* stop)
{
  const int * current = start;
  while (current != stop) {
    cout << *current << '\n';
    ++current;     // increment pointer
  }
}

int main ()
{
  	int numbers[] = {10,20,30};
  	increment_all (numbers,numbers+3);
  	print_all (numbers,numbers+3);
	int x;
    		int	*		p1 = &x;  // non-const pointer to non-const int
	const 	int	*   	p2 = &x;  // non-const pointer to const int
    		int * const p3 = &x;  // const pointer to non-const int
	const 	int * const p4 = &x;  // const pointer to const int 
  	return 0;
}
