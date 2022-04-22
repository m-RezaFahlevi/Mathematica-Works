# eg 12.3

library(plotly)

temperature <- c(
    rep(c(75, 100, 125), 6)
)
sterilizing_time <- c(
    rep(15, 6), rep(20, 6), rep(25, 6)
)
percent_of_impurities <- c(
    14.05, 10.55, 7.55,
    14.93, 9.48, 6.59,
    16.56, 13.63, 9.23,
    15.85, 11.75, 8.78,
    22.41, 18.55, 15.93,
    21.66, 17.98, 16.44
)
eg_12_3 <- data.frame(
    "Temperature" = temperature, # x1
    "SterilizingTime" = sterilizing_time, # x2
    "PercentOfImpurities" = percent_of_impurities # y
)
View(eg_12_3)
summary(eg_12_3)
write.csv(eg_12_3, file = "datasets/eg_12_3.csv")

# construct the polynomial regression
# y ~ x1 + x2 + (x1 ** 2) + (x2 ** 2) + (x1 * x2)
eg_12_3_lm <- lm(
    formula = PercentOfImpurities~Temperature+
        SterilizingTime+I(Temperature^2)+
        I(SterilizingTime^2)+Temperature*SterilizingTime,
    data = eg_12_3
)

# visualize
plot_ly(
    data = eg_12_3,
    x = eg_12_3$Temperature,
    y = eg_12_3$SterilizingTime,
    z = eg_12_3$PercentOfImpurities,
    type = "scatter3d",
    mode = "markers",
    color = eg_12_3$Temperature
)
