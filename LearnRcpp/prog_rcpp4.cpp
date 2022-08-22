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
bool is_allgeth(NumericVector v_vect, int nahlen) {
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

// [[Rcpp::export]]
bool is_allleth(NumericVector v_vect, int nahlen) {
    bool check_leq = true;
    
    for (int curr_memb: v_vect)
        if (curr_memb >= nahlen) {
            check_leq = false;
            break;
        }
        
    return check_leq;
}

// [[Rcpp::export]]
bool is_all_eq(NumericVector v_vect, int nahlen) {
    bool check_eq = true;
    
    for (int curr_memb: v_vect)
        if (curr_memb != nahlen) {
            check_eq = false;
            break;
        }
        
    return check_eq;
}

// [[Rcpp::export]]
bool allOpCpp(NumericVector v_vect, char rel, int nahlen) {
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
        std::cout << "Unknown relation\n";
        break;
    }
    
    return all_check;
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
allOpCpp(c(3, 2, 5), '>', 1)
allOpCpp(c(3, 2, 5), '<', 1)
allOpCpp(c(3, 2, 5), '=', 1)
*/
