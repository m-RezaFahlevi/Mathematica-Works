# preprae the tools
library(dplyr)

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
# data wrangling
station <- data.frame("n.of.organism.per.square.meter" = station1, "station.number" = "station_1")
station <- tibble(station)
station <- station %>% 
	bind_rows(tibble("n.of.organism.per.square.meter" = station2, "station.number" = "station_2"))
station <- station %>% mutate(station.number = as.factor(station.number))
station

length(station1)
length(station2)

# glimpse of dataset
summary(station1)
summary(station2)
summary(station)

# the variances
var(station1)
var(station2)

# Fisher's F-test, var.test(x, y)
var.test(station1, station2)

# compute the Welch t-statistic since
# Fisher's F-test return p < 0.05
t.test(station1, station2, var.equal = FALSE)

# Step to Compute Manually without Builtin Function

# compute the degrees of freedom v
nominator = (var(station1) / length(station1)) + (var(station2) / length(station2))
nominator = nominator ** 2
denominator1 = ((var(station1) / length(station1)) ** 2) / (length(station1) - 1)
denominator2 = ((var(station2) / length(station2)) ** 2) / (length(station2) - 1)
denominator = denominator1 + denominator2
deg_of_freedom = nominator / denominator
deg_of_freedom

# compute the t' statistics
delta_mean = mean(station1) - mean(station2)
tprime_denominator = (var(station1) / length(station1)) + (var(station2) / length(station2))
tprime_denominator = sqrt(tprime_denominator)
tprime_statistics = delta_mean / tprime_denominator
tprime_statistics

