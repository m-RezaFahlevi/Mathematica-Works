# dem 12.5

power_consumption <- c(
    240, 236, 290, 274, 301, 
    316, 300, 296, 267, 276,
    288, 261
)
ambient_temperature <- c(
    25, 31, 45, 60, 65,
    72, 80, 84, 75, 60,
    50, 38
) # in avarege
number_of_days <- c(
    24, 21, 24, 25, 25, 26,
    25, 25, 24, 25, 25, 23
) # in month
product_purity <- c(
    91, 90, 88, 87, 91, 94,
    87, 86, 88, 91, 90, 89
) # in average
product_produced <- c(
    100, 95, 110, 88, 94,
    99, 97, 96, 110, 105,
    100, 98
) # in tons

dem_12_5 <- data.frame(
    "PowerConsumption" = power_consumption, # y
    "AmbientTemperature" = ambient_temperature, # x1
    "NumberOfDays" = number_of_days, # x2
    "ProductPurity" = product_purity, # x3
    "ProductProduced" = product_produced # x4
)
View(dem_12_5)
write.csv(dem_12_5, file = "datasets/dem_12_5.csv")
summary(dem_12_5)

# Estimation for regression's coefficient for model
# y = b0 + b1x1 + b2x2 + b3x3 + b4x4
dem_12_5_lm <- lm(
    formula = PowerConsumption~AmbientTemperature+
        NumberOfDays+
        ProductPurity+
        ProductProduced,
    data = dem_12_5
)

# Prediction for power consumption for a month in which
# x1 = 75, x2 = 24, x3 = 90, x4 = 98
(dem_12_5_lm %>% coefficients() %>%
    as.vector() * c(1, 75, 24, 90, 98)) %>% sum()

anova(dem_12_5_lm)
vcov(dem_12_5_lm) # variance-covariance matrix
predict(
    dem_12_5_lm, newdata = data.frame(
        "AmbientTemperature" = 75,
        "NumberOfDays" = 24,
        "ProductPurity" = 90,
        "ProductProduced" = 98
    ), interval = "prediction"
)

predict(
    dem_12_5_lm, newdata = data.frame(
        "AmbientTemperature" = 75,
        "NumberOfDays" = 24,
        "ProductPurity" = 90,
        "ProductProduced" = 98
    ), interval = "confidence"
)

# compute the t(x) inv(X'X) x
t(c(1, 75, 24, 90, 98)) %*%
    (vcov(dem_12_5_lm)/242.7) %*%
    t(t(c(1, 75, 24, 90, 98)))
