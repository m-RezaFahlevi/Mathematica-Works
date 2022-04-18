# prepare the data
st_company <- c(102, 86, 98, 109, 92)
nd_company <- c(81, 165, 97, 134, 92, 87, 114)

# compute the sample variance of both
c(var(st_company), var(nd_company))
var(st_company) / var(nd_company)

# compute the fisher var test
var.test(x = st_company, y = nd_company)
