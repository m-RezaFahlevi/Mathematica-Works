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


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
cumsumCppPtr(c(3, 2, 5))
*/
