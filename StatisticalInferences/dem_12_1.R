# dem 12.1

cooking_time <- c(
    6.40, 15.05, 18.75, 30.25, 44.85,
    48.94, 51.55, 61.50, 100.44, 111.42
)
oven_width <- c(
    1.32, 2.69, 3.56, 4.41, 5.35,
    6.20, 7.12, 8.87, 9.80, 10.65
)
flue_temperature <- c(
    1.15, 3.40, 4.10, 8.75, 14.82,
    15.15, 15.32, 18.18, 35.19, 40.40
)

dem_12_1 <- data.frame(
    "CookingTime" = cooking_time, # y
    "OvenWidth" = oven_width, # x1
    "FlueTemperature" = flue_temperature # x2
)
View(dem_12_1)
write.csv(dem_12_1, file = "datasets/dem_12_1.csv")
summary(dem_12_1)

# Estimate the regression's coefficients for model
# y = b0 + b1x1 + b2x2
dem_12_1_lm <- lm(
    formula = CookingTime~OvenWidth+FlueTemperature,
    data = dem_12_1
)

anova(dem_12_1_lm)
vcov(dem_12_1_lm)
