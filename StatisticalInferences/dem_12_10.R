# dem 12.10

library(ggplot2)
library(magrittr)

givenx12_10 <- seq(0, 6)
giveny12_10 <- c(1, 4, 5, 3, 2, 3, 6)

dem_12_10 <- data.frame(
    "Givenx12_10" = givenx12_10, # x
    "Giveny12_10" = giveny12_10 # y
)
View(dem_12_10)
write.csv(dem_12_10, file = "datasets/dem_12_10.csv")
summary(dem_12_10)

# construct the polynomial regression
dem_12_10_lm <- lm(
    formula = Giveny12_10~poly(Givenx12_10, degree = 3, raw = TRUE),
    data = dem_12_10
)

# prediction for Y when x = 2
(dem_12_10_lm %>% coefficients %>%
    as.vector() * c(1, 2, 2 ** 2, 2 ** 3)) %>% sum()

# visualization
ggplot(dem_12_10, aes(Givenx12_10, Giveny12_10)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y~poly(x, degree = 3, raw = TRUE)
    )
