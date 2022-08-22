library(Rcpp)
#> 
#> Attaching package: 'Rcpp'
#> The following object is masked from 'package:inline':
#> 
#>     registerPlugin
cppFunction('int add(int x, int y, int z) {
  int sum = x + y + z;
  return sum;
}')
# add works like a regular R function
add
#> function (x, y, z) 
#> .Call(<pointer: 0x7f96ecb3ef20>, x, y, z)
add(1, 2, 3)
#> [1] 6

# added code

cppFunction('int myprod(int x, int y, int z) {
    int the_prod = x * y * z;
    return the_prod;
}')
myprod
myprod(1, 2, 5)

# function to return if a number is greter,
# less than, or equals to zero

signR <- function(x) {
    if (x == 0) {
        return(0)
    } else if (x >0) {
        return(1)
    } else {
        return(-1)
    }
}

cppFunction('int signInCpp(int x) {
    if (x == 0) {
        return 0;
    } else if (x > 0) {
        return 1;
    } else {
        return -1;
    }
}')
signInCpp(5)

# sum in R and C

sumInR <- function(v_vect) {
    theSum <- 0
    for (nahlen in v_vect) {
        theSum <- theSum + nahlen
    }
    return(theSum)
}

sumInR(c(3, 2, 5))

cppFunction("double sumInCpp(NumericVector v_vect) {
	int n = v_vect.size();
	double total = 0;
	for (int i = 0; i < n; ++i) {
		total = total + v_vect[i];
	}
	
	return total;
}")

# benchmark
given_vector <- runif(1e3)
microbenchmark::microbenchmark(
    sum(given_vector),
    sumInCpp(given_vector),
    sumInR(given_vector)
)

# point euclidean distance
pdistR <- function(x, ys) {
    return(sqrt((x - ys) ** 2))
}

cppFunction('NumericVector pdistC(double x, NumericVector ys) {
  int n = ys.size();
  NumericVector out(n);

  for(int i = 0; i < n; ++i) {
    out[i] = sqrt(pow(ys[i] - x, 2.0));
  }
  return out;
}')

# sum for each row in matrix
cppFunction('NumericVector rowSumsC(NumericMatrix x) {
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
}')
