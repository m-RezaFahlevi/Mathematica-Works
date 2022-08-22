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
int myprod(int x, int y, int z) {
    int the_prod = x * y * z;
    return the_prod;
}

// [[Rcpp::export]]
int signInCpp(int x) {
    if (x == 0) {
        return 0;
    } else if (x > 0) {
        return 1;
    } else {
        return -1;
    }
}

// [[Rcpp::export]]
double sumInCpp(NumericVector v_vect) {
    int n = v_vect.size();
    double total = 0;
    for (int i = 0; i < n; ++i) {
        total = total + v_vect[i];
    }
    
    return total;
}

// [[Rcpp::export]]
NumericVector pdistC(double x, NumericVector ys) {
    int n = ys.size();
    NumericVector out(n);
    
    for(int i = 0; i < n; ++i) {
        out[i] = sqrt(pow(ys[i] - x, 2.0));
    }
    return out;
}

// [[Rcpp::export]]
NumericVector rowSumsC(NumericMatrix x) {
    int nrow = x.nrow(), ncol = x.ncol();
    NumericVector out(nrow);
    
    for (int i = 0; i < nrow; i++) {
        double total = 0;
        for (int j = 0; j < ncol; j++) {
            total += x(i, j);
        }
        out[i] = total;
    }
    return out;
}

// [[Rcpp::export]]
double meanC(NumericVector x) {
    int n = x.size();
    double total = 0;
    
    for(int i = 0; i < n; ++i) {
        total += x[i];
    }
    return total / n;
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
library(microbenchmark)
x <- runif(1e5)
microbenchmark(
    mean(x),
    meanC(x)
)
*/
