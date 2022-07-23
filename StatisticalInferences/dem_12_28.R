library(ggplot2)
library(dplyr)

araw_data <- c(
    193, 1.6, 851,
    230, 15.5, 816,
    172, 22.0, 1058,
    91, 43.0, 1201,
    113, 33.0, 1357,
    125, 40.0, 1115
)

araw_data <- araw_data %>% matrix(nrow = 6, ncol = 3, byrow = TRUE)

dem_12_28 <- data.frame(
    "Wear" = araw_data[,1],
    "OilViscosity" = araw_data[,2],
    "Load" = araw_data[,3]
)
View(dem_12_28)
write.csv(dem_12_8, file = "datasets/dem_12_28.csv")
summary(dem_12_28)

dem_12_28_lm <- lm(
    formula = Wear~OilViscosity+Load,
    data = dem_12_28
)

summary(dem_12_28_lm)
anova(dem_12_28_lm)
vcov(dem_12_28_lm)

predict(
    dem_12_28_lm, newdata = data.frame(
        "OilViscosity" = 20,
        "Load" = 1000
    ), interval = "confidence"
)

predict(
    dem_12_28_lm, newdata = data.frame(
        "OilViscosity" = 20,
        "Load" = 1000
    ), interval = "prediction"
)
