#include <bits/stdc++.h>
using namespace std;

int add(int x, int y, int z) {
    int total = x + y + z;
    return total;
}

int myprod(int x, int y, int z) {
    int the_prod = x * y * z;
    return the_prod;
}

int check_sign(int number) {
    if (number == 0) {
        return 0;
    } else if (number > 0) {
        return 1;
    } else {
        return -1;
    }
}

double sumInCpp(vector<double> v_vect) {
	int n = v_vect.size();
	double total = 0;
	for (int i = 0; i < n; ++i) {
		total = total + v_vect[i];
	}
	
	return total;
}

vector<double> pdistInCpp(double s, vector<double> v_vect) {
	vector<double> dist_vect;
	int n = v_vect.size();

	for (int i = 0; i < n; ++i) {
		double dist_calc = sqrt(pow(s - v_vect.at(i), 2));
		dist_vect.push_back(dist_calc);
	}

	return dist_vect;
}

vector<int> rowSumInCpp(vector<vector<int>> mn_matrix) {
	vector<int> row_sum;
	int nrow = mn_matrix.size(), ncol = mn_matrix.at(0).size();

	for (int curr_row = 0; curr_row < nrow; curr_row++) {
		int total = 0;
		for (int curr_col = 0; curr_col < ncol; curr_col++) {
			total += mn_matrix.at(curr_row).at(curr_col);
		}
		row_sum.push_back(total);
	}

	return row_sum;
}

int main(void) {
	// declare an input
	double s_inp = 0;
	vector<double> created_vect = {3.0, 2.2, 5.5};
	vector<vector<int>> created_matrix = {
		{1, 0, 0},
		{0, 1, 0},
		{0, 0, 1}
	};

	cout << "The size of vector created_matrix : " << created_matrix.size() << endl;
	cout << "Access an element at (2,2) position :  " << created_matrix[1][1] << endl;

	cout << "The created matrix is : " << endl;

	// display created matrix
	for (int curr_row = 0; curr_row < created_matrix.size(); curr_row++) {
		for (int curr_col = 0; curr_col < created_matrix.at(0).size(); curr_col++) {
			cout << created_matrix.at(curr_row).at(curr_col) << " ";
		}
		cout << endl;
	}

	// display the sum of each row for matrix created_matrix
	cout << "The sum for each row is : ";
	for (int nahlen: rowSumInCpp(created_matrix))
		cout << nahlen << " ";
	cout << endl;

    cout << "This is demo program in C++" << endl;
    cout << "add function " << add(3, 2, 5) << endl;
    cout << "prod function " << myprod(3, 2, 5) << endl;
    
    cout << "sign function " << check_sign(-5);
    cout << " " << check_sign(5) << " " << check_sign(0) << endl;

	// print all members of the vectors
	for (int i = 0; i < created_vect.size(); ++i) {
		cout << created_vect[i] << " ";
	} 
	cout << endl;

	cout << "The sum of vector : " << sumInCpp(created_vect) << endl;

	// display the vector return by a function
	for (double nahlen: pdistInCpp(s_inp, created_vect))
		cout << nahlen << " ";
}
