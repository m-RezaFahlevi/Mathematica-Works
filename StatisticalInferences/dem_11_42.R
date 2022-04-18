# dem 11.42
library(ggplot2)

students_weight <- c(
	rep(44, 4), rep(50, 4),
	rep(58, 4), rep(64, 4)
)
weight_lifted <- c(
	35, 38, 33, 30,
	37, 40, 31, 42,
	39, 48, 42, 40,
	55, 46, 41, 51
)
dem_11_42 <- data.frame(
	"StudentsWeight" = students_weight,
	"WeightLifted" = weight_lifted
)
dem_11_42
summary(dem_11_42) # take a glimpse to the dataset

lmodels_11_42 <- lm("WeightLifted~StudentsWeight", data = dem_11_42)
lmodels_11_42

# Compute the ANOVA for testing
# linearity of regression
sum(residuals(lmodels_11_42) ** 2) # compute the SSE or sum square of residuals
# Compute the mean square for residuals
sum(residuals(lmodels_11_42) ** 2) / (dim(dem_11_42)[1] - 2)
EnvStats::anovaPE(lmodels_11_42)

#plot the linear regreesion y~x
ggplot(dem_11_42, aes(StudentsWeight, WeightLifted)) +
	geom_point(color = "darkblue") +
	geom_smooth(method = lm, formula = "y~x") +
	ggtitle("Regression line y~x")
