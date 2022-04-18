# prepare the data
station1 <- c(
	5030, 4980, 13700, 11910, 10730, 8130,
	11400, 26850, 860, 17660, 2200, 22800,
	4250, 1130, 15040, 1690
)
station2 <- c(
	2800, 2810, 4670, 1330, 6890, 3320,
	7720, 1230, 7030, 2130, 7330, 2190
)
summary(station1)
summary(station2)

# compute sample variances of both
c(var(station1), var(station2))

# compute the fisher var test
var.test(x = station2, y = station1)
