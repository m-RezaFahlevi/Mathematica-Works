# eg 12.5

library(ggplot2)
library(magrittr)
library(readr)

# Continued of eg. 12.3

# import datasets
eg_12_3 <- read_csv("datasets/eg_12_3.csv")
eg_12_3 <- eg_12_3[,2:4]
View(eg_12_3)
summary(eg_12_3) 

# construct the polynomial regression
eg_12_3_lm <- lm(
    formula = PercentOfImpurities ~ Temperature +
        SterilizingTime +
        I(Temperature^2) +
        I(SterilizingTime^2) +
        Temperature * SterilizingTime,
    data = eg_12_3
)
summary(eg_12_3_lm)
