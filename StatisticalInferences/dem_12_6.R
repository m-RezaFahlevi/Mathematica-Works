# dem 12.6

library(ggplot2)
library(magrittr)

speed <- c(35, 50, 65, 80, 95, 110) # in km/hr
stopping_distance <- c(16, 26, 41, 62, 88, 119) # in m

dem_12_6 <- data.frame(
    "Speed" = speed, # x1
    "StoppingDistance" = stopping_distance # y
)
View(dem_12_6)
write.csv(dem_12_6, file = "datasets/dem_12_6.csv")
summary(dem_12_6)

# construct the linear model (in polynomial)
dem_12_6_lm <- lm(
    formula = StoppingDistance ~ 
        poly(Speed, degree = 2, raw = TRUE),
    data = dem_12_6
)

# Estimation the stopping distance when the car
# is travelling at 70 kilometers per hour
(dem_12_6_lm %>% 
    coefficients() %>%
    as.vector() * c(1, rep(70, 2))) %>%
    sum()

# visualization
ggplot(dem_12_6, aes(Speed, StoppingDistance)) +
    geom_point(color = "darkblue") +
    geom_smooth(method = "lm",
                formula = y~poly(x, degree = 2, raw = TRUE))