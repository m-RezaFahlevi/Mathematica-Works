# prepare the data
instrumentA <- c(
	0.86, 0.82, 0.75, 0.61, 0.89, 
	0.64, 0.81, 0.68, 0.65
)
instrumentB <- c(
	0.87, 0.74, 0.63, 0.55, 0.76, 
	0.70, 0.69, 0.57, 0.53
)

# take a glimpse at data
summary(instrumentA)
summary(instrumentB)

# compute the variances
c(var(instrumentA), var(instrumentB))
var(instrumentA) / var(instrumentB)

# compute the fisher var test
var.test(x = instrumentA, y = instrumentB)
