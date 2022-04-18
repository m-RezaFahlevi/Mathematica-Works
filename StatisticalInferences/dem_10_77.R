# prepare the data
pline1 <- c(
	0.48, 0.39, 0.42, 0.52,
	0.40, 0.48, 0.52, 0.52
)
pline2 <- c(
	0.38, 0.37, 0.39, 0.41, 
	0.38, 0.39, 0.40, 0.39
)

# glimpse at data
summary(pline1)
summary(pline2)

# compute both variances
c(var(pline1), var(pline2))

# compute the fisher test
var.test(pline2, pline1)

