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

// [[Rcpp::export]]
int cumsumCpp(NumericVector v_vect) {
    int total = 0;
    for (int curr_memb: v_vect)
        total += curr_memb;
    return total;
}

// [[Rcpp::export]]
int cumprodCpp(NumericVector v_vect) {
    int prod = 1;
    for (int curr_memb: v_vect)
        prod *= curr_memb;
    return prod;
}

// [[Rcpp::export]]
NumericVector cummaxCpp(NumericVector v_vect) {
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

// [[Rcpp::export]]
NumericVector cumminCpp(NumericVector v_vect) {
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

// [[Rcpp::export]]
NumericVector rangeCpp(NumericVector v_vect) {
    double min_thresh = std::numeric_limits<double>::min(); // a.k.a., -infinity
    double max_thresh = std::numeric_limits<double>::max(); // a.k.a., +infinity
    double *ptr = &min_thresh;
    
    // linear (sequential) search is used
    // to finding the maximum or the minimum
    // members of v_vect
    for (double nahlen: v_vect)
        if (nahlen > *ptr)
            *ptr = nahlen; // finding the max(v_vect)
    ptr = &max_thresh;
    for (double nahlen: v_vect)
        if (nahlen < *ptr)
            *ptr = nahlen; // finding the min(v_vect)
            
    // max_thresh become the minimum value of v_vect,
    // and min_thresh become the maximum value of v_vect
    NumericVector arrlocal = {max_thresh, min_thresh};
    return arrlocal;
}

// [[Rcpp::export]]
float meanCpp(NumericVector v_vect) {
    int n = v_vect.size();
    double total = 0.0;
    for (int nahlen: v_vect)
        total += nahlen;
    float measured = total / n;
    return measured;
}

// [[Rcpp::export]]
double varianceCpp(NumericVector v_vect) {
    int n = v_vect.size();
    NumericVector vsq_vect;
    for (int i = 0; i < n; ++i) {
        int vsq_memb = pow(v_vect.at(i), 2);
        vsq_vect.push_back(vsq_memb);
    }
    int curr_term = (n * cumsumCpp(vsq_vect)) - pow(cumsumCpp(v_vect), 2);
    double var_measured = (1.0 / (n * (n - 1))) * curr_term;
    return var_measured;
}

#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector attribs() {
    NumericVector out = NumericVector::create(1, 2, 3);
    
    out.names() = CharacterVector::create("a", "b", "c");
    out.attr("my-attr") = "my-value";
    out.attr("class") = "my-class";
    
    return out;
}

// [[Rcpp::export]]
double mpe(List mod) {
    if (!mod.inherits("lm")) stop("Input must be a linear model");
    
    NumericVector resid = as<NumericVector>(mod["residuals"]);
    NumericVector fitted = as<NumericVector>(mod["fitted.values"]);
    
    int n = resid.size();
    double err = 0;
    for(int i = 0; i < n; ++i) {
        err += resid[i] / (fitted[i] + resid[i]);
    }
    return err / n;
}

// [[Rcpp::export]]
RObject callWithOne(Function f) {
    return f(1);
}

// [[Rcpp::export]]
List lapply1(List input, Function f) {
    int n = input.size();
    List out(n);
    
    for(int i = 0; i < n; i++) {
        out[i] = f(input[i]);
    }
    
    return out;
}

// [[Rcpp::export]]
List scalar_missings() {
    int int_s = NA_INTEGER;
    String chr_s = NA_STRING;
    bool lgl_s = NA_LOGICAL;
    double num_s = NA_REAL;
    
    return List::create(int_s, chr_s, lgl_s, num_s);
}

// [[Rcpp::export]]
List rleC(NumericVector x) {
    std::vector<int> lengths;
    std::vector<double> values;
    
    // Initialise first value
    int i = 0;
    double prev = x[0];
    values.push_back(prev);
    lengths.push_back(1);
    
    NumericVector::iterator it;
    for(it = x.begin() + 1; it != x.end(); ++it) {
        if (prev == *it) {
            lengths[i]++;
        } else {
            values.push_back(*it);
            lengths.push_back(1);
            
            i++;
            prev = *it;
        }
    }
    
    return List::create(
        _["lengths"] = lengths, 
        _["values"] = values
    );
}

// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
allOpCpp(c(3, 2, 5), '>', 1)
allOpCpp(c(3, 2, 5), '<', 1)
allOpCpp(c(3, 2, 5), '=', 1)

mod <- lm(mpg ~ wt, data = mtcars)
mpe(mod)

callWithOne(function(x) x + 1)
callWithOne(paste)
*/
