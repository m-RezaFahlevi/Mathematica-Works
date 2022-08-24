#include <bits/stdc++.h>
#include <limits>
using namespace std;

// the purpose of this program is to recreate all function
// that already written in R. For example, suppose that x
// be a vector, all(x > 3) return TRUE if and only if for all
// member of x is greater then 3, and all(x > 3) return FALSE if
// there exist member of x is not greater then 3, i.e., there
// exist member of x is less than or equals to 3.

bool is_allgeth(vector<int> v_vect, int nahlen) {
	int n = v_vect.size();
	bool check_geq = true;

	for (int curr_memb = 0; curr_memb < n; ++curr_memb) {
		if (v_vect.at(curr_memb) <= nahlen) {
			check_geq = false;
			break;
		}
	}

	return check_geq;
}

bool is_allleth(vector<int> v_vect, int nahlen) {
	int n = v_vect.size();
	bool check_leq = true;

	for (int curr_memb: v_vect)
		if (curr_memb >= nahlen) {
			check_leq = false;
			break;
		}
	
	return check_leq;
}

bool is_all_eq(vector<int> v_vect, int nahlen) {
	int n = v_vect.size();
	bool check_eq = true;

	for (int curr_memb: v_vect)
		if (curr_memb != nahlen) {
			check_eq = false;
			break;
		}
	
	return check_eq;
}

bool allOpCpp(vector<int> v_vect, char rel, int nahlen) {
	bool all_check = true;

	switch (rel) {
		case '>':
			all_check = is_allgeth(v_vect, nahlen);
			break;
		case '<':
			all_check = is_allleth(v_vect, nahlen);
			break;
		case '=':
			all_check = is_all_eq(v_vect, nahlen);
			break;
		default:
			cout << "Unknown relation\n";
			break;
	}

	return all_check;
}

int cumsumCpp(vector<int> v_vect) {
	int total = 0;
	for (int curr_memb: v_vect)
		total += curr_memb;
	return total;
}

int cumprodCpp(vector<int> v_vect) {
	int prod = 1;
	for (int curr_memb: v_vect)
		prod *= curr_memb;
	return prod;
}

// The purpose of this function is to transform a vector
// numeric where the elements to be a cummulative maximum.
// For example, v = (3, 2, 5), then the cumulative maximum
// of v is (3, 3, 5).
vector<int> cummaxCpp(vector<int> v_vect) {
	int curr_thresh = std::numeric_limits<int>::min(); // a.k.a., -infinity
	int n = v_vect.size();
	for (int curr_memb = 0; curr_memb < n; curr_memb++) {
		int current_state = v_vect.at(curr_memb);
		if (current_state > curr_thresh)
			curr_thresh = current_state;
		else
			v_vect.at(curr_memb) = curr_thresh;
	}
	return v_vect;
}

// cumminCpp function is the converse of the cummax. For example,
// if v = (3, 2, 5), then cummin of v is (3, 2, 2).
vector<int> cumminCpp(vector<int> v_vect) {
	int curr_thresh = std::numeric_limits<int>::max(); // a.k.a., infinity
	int n = v_vect.size();
	for (int curr_memb = 0; curr_memb < n; curr_memb++) {
		int current_state = v_vect.at(curr_memb);
		if (current_state < curr_thresh)
			curr_thresh = current_state;
		else
			v_vect.at(curr_memb) = curr_thresh;
	}
	return v_vect;
}

int *fooptr(vector<int> v_vect) {
	static int arrlocal[2];
	arrlocal[0] = v_vect.at(0);
	arrlocal[1] = v_vect.at(1);
	return arrlocal;
}

int *rangeCpp(vector<int> v_vect) {
	int min_thresh = std::numeric_limits<int>::min(); // a.k.a., -infinity
	int max_thresh = std::numeric_limits<int>::max(); // a.k.a., +infinity
	int *ptr = &min_thresh;

	// linear (sequential) search is used
	// to finding the maximum or the minimum
	// members of v_vect
	for (int nahlen: v_vect)
		if (nahlen > *ptr)
			*ptr = nahlen; // finding the max(v_vect)
	ptr = &max_thresh;
	for (int nahlen: v_vect)
		if (nahlen < *ptr)
			*ptr = nahlen; // finding the min(v_vect)

	// max_thresh become the minimum value of v_vect,
	// and min_thresh become the maximum value of v_vect
	static int arrlocal[2] = {max_thresh, min_thresh};
	return arrlocal;
}

float meanCpp(vector<int> v_vect) {
	int n = v_vect.size();
	double total = 0.0;
	for (int nahlen: v_vect)
		total += nahlen;
	float measured = total / n;
	return measured;
}

// variances could be defined as var(x) = mean(x^2) - mean^2(x)
double varianceCpp(vector<int> v_vect) {
	int n = v_vect.size();
	vector<int> vsq_vect;
	for (int i = 0; i < n; ++i) {
		int vsq_memb = pow(v_vect.at(i), 2);
		vsq_vect.push_back(vsq_memb);
	}
	double var_measured = meanCpp(vsq_vect) - pow(meanCpp(v_vect), 2);
	return var_measured;
}

int main(void) {
	int inp_s = 1;
	vector<int> created_vect = {3, 2, 5};

	string geth_check = allOpCpp(created_vect, '>', inp_s) ? "TRUE" : "FALSE";
	string leth_check = allOpCpp(created_vect, '<', inp_s) ? "TRUE" : "FALSE";
	string eq_check = allOpCpp(created_vect, '=', inp_s) ? "TRUE" : "FALSE";

	cout << geth_check << " " << leth_check << " " << eq_check << endl;

	// cumsum and cumprod
	cout << "The cumulative sum of created vector is : " << cumsumCpp(created_vect) << endl;
	cout << "The cumulative product of created vector is : " << cumprodCpp(created_vect) << endl;

	// cummax and cummin
	cout << "Function cummax in cpp : ";
	for (int curr_memb: cummaxCpp(created_vect))
		cout << curr_memb << " ";
	cout << "\nFunction cummin in cpp : ";
	for (int curr_memb: cumminCpp(created_vect))
		cout << curr_memb << " ";
	cout << endl;

	// function return an array;
	int *ptrdec = fooptr(created_vect);
	cout << ptrdec[0] << " " << ptrdec[1] << endl;
	cout << *ptrdec << "\n";

	// range function
	int *obtain_range = rangeCpp(created_vect);
	cout << obtain_range[0] << " " << obtain_range[1] << endl;

	// var function
	cout << "The variance of created vector is : ";
	cout << varianceCpp(created_vect) << endl;
}
