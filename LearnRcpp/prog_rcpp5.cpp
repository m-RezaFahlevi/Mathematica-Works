#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
int cumsumCppPtr(NumericVector v_vect) {
    int total = 0;
    for (NumericVector::iterator ptrloc = v_vect.begin(); ptrloc != v_vect.end(); ++ptrloc)
        total += *ptrloc;
    return total;
}

// [[Rcpp::export]]
List rleCpp(NumericVector v_vect) {
    std::vector<int> v_value, v_length;
    
    // init first value
    int prev_val = v_vect.at(0);
    v_value.push_back(prev_val);
    v_length.push_back(1);
    
    NumericVector::iterator ptrloc;
    for (ptrloc = v_vect.begin() + 1; ptrloc != v_vect.end(); ++ptrloc) {
        if (*ptrloc == prev_val) {
            ++*v_length.rbegin();
        } else {
            v_value.push_back(*ptrloc);
            v_length.push_back(1);
            prev_val = *ptrloc;
        }
    }
    
    return List::create(
        _["v_length"] = v_length,
        _["v_value"] = v_value
    );
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
cumsumCppPtr(c(3, 2, 5))
rleCpp(c(3, 2, 2, 2, 5, 5))
*/
