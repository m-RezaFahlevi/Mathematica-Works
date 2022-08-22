#include <cstring>
#include <iostream>
#include <vector>

using namespace std;
vector<int> myVector(int);
int main()
{
    int n;
    vector<int> vect= myVector(n);
    for (std::vector<int>::iterator it = vect.begin(); it != vect.end(); ++it)
      std::cout << ' ' << *it;
      std::cout << '\n';
     
    return 0;
}

vector<int> myVector(int number ){
     unsigned int remainder=0;
     unsigned int division=10;
     vector<int> residual;
     while (division!=0)
     {
         division=number/10;
         remainder=number%10;
	 cout <<"division:\n"<<number<<endl<<remainder<<endl;
         residual.push_back(remainder);
         number=division;
     }
     return residual;  
}
