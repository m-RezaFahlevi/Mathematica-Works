# prepare the data
radial_tires <- c(
	4.2, 4.7, 6.6, 7.0, 6.7,
	4.5, 5.7, 6.0, 7.4, 4.9,
	6.1, 5.2
)
belted_tires <- c(
	4.1, 4.9, 6.2, 6.9, 6.8,
	4.4, 5.7, 5.8, 6.9, 4.7,
	6.0, 4.9
)
diff_beltrad_tires <- radial_tires - belted_tires
diff_beltrad_tires

# take a glimpse at the data
summary(radial_tires)
summary(belted_tires)
summary(diff_beltrad_tires)

# compute the variance
var(radial_tires)
var(belted_tires)

sqrt(var(diff_beltrad_tires)) # compute the standard deviation

# compute the t statistics
t.test(radial_tires, belted_tires, paired=TRUE)
