# prepare the data
car_models_in1980 <- c(
	141, 359, 247, 940, 882, 494, 306, 210, 105, 880,
	200, 223, 188, 940, 241, 190, 300, 435, 241, 380
)
car_models_in1990 <- c(
	140, 160, 20, 20, 223, 60, 20, 95, 360, 70,
	220, 400, 217, 58, 235, 380, 200, 175, 85, 65
)

# compute each variances
c(var(car_models_in1980), var(car_models_in1990))

# compute the Fisher var test
var.test(car_models_in1990, car_models_in1980)
