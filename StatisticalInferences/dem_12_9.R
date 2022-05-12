# dem 12.9

library(magrittr)
library(readr)
library(ggplot2)

# eg_11_8.csv datasets is used
eg_11_8 <- read_csv("datasets/eg_11_8.csv")
eg_11_8 <- eg_11_8[1:12,2:3]
View(eg_11_8)
summary(eg_11_8)

# polynomial regression degree 2 model
dem_12_9_lm <- lm(
    formula = yield_chemical_reaction ~
        poly(x_in_celcius, degree = 2, raw = TRUE),
    data = eg_11_8
)

# plot for polynomial regression degree 2 model
ggplot(eg_11_8, aes(x_in_celcius, yield_chemical_reaction)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y ~ poly(x, degree = 2, raw = TRUE)
    )

# plot for simple linear regression model
ggplot(eg_11_8, aes(x_in_celcius, yield_chemical_reaction)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y~x
    )

# Estimation the yield of the chemical reaction for a
# temperature of 225◦ C.
(dem_12_9_lm %>% coefficients() %>%
    as.vector() * c(1, 225, 225 ** 2)) %>% sum()