# dem 12.7

library(ggplot2)
library(magrittr)

blood_flow <- c(
    84.33, 87.90, 82.20, 78.21, 78.44,
    80.01, 83.53, 79.46, 75.22, 76.58,
    77.90, 78.80, 80.67, 86.60, 78.20
)
arterial_oxygen_tension <- c(
    603.40, 582.50, 556.20, 594.60, 558.90,
    575.20, 580.10, 451.20, 404.00, 484.00,
    452.40, 448.40, 334.80, 320.30, 350.30
)

dem_12_7 <- data.frame(
    "BloodFlow" = blood_flow, # y
    "ArterialOxygenTension" = arterial_oxygen_tension # x
)
View(dem_12_7)
write.csv(dem_12_7, file = "datasets/dem_12_7.csv")
summary(dem_12_7)

# construct the multiple linear regression model
# in polynomial of degree 2
dem_12_7_lm <- lm(
    formula = BloodFlow ~
        poly(ArterialOxygenTension, degree = 2, raw = TRUE),
    data = dem_12_7
)

# visualize
ggplot(dem_12_7, aes(ArterialOxygenTension, BloodFlow)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y~poly(x, degree = 2, raw = TRUE)
    )
