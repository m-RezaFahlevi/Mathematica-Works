# prepare the data
lubricant <- c(
	10.2, 9.7, 10.1, 10.3, 10.1, 9.8, 9.9,
	10.4, 10.3, 9.8
)

# take a glimpse at the data
summary(lubricant)

# compute the variance
var(lubricant)

# compute the p-value
chi_sq = (length(lubricant) - 1) * var(lubricant) / 0.03 # h0 : sigma_square = 0.03
p_val = 2 * (1 - pchisq(chi_sq, df = length(lubricant) - 1))
p_val
