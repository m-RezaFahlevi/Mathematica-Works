# dem 12.8

library(ggplot2)
library(dplyr)

concentration <- c(
    rep(10.0, 3), rep(15.0, 3), rep(20.0, 3),
    rep(25.0, 3), rep(30.0, 3)
)
compressive_strength <- c(
    25.2, 27.3, 28.7,
    29.8, 31.1, 27.8,
    31.2, 32.6, 29.7,
    31.7, 30.1, 32.3,
    29.4, 30.8, 32.8
)

dem_12_8 <- data.frame(
    "Concentration" = concentration, # x
    "CompressiveStrength" = compressive_strength # y
)
View(dem_12_8)
write.csv(dem_12_8, file = "datasets/dem_12_8.csv")
summary(dem_12_8)

# polynomial regression
dem_12_8_lm <- lm(
    formula = CompressiveStrength ~
        poly(Concentration, degree = 2, raw = TRUE),
    data = dem_12_8
)

# simple linear regression
dem_12_8_slr <- lm(
    formula = CompressiveStrength~Concentration,
    data = dem_12_8
)

# plot for polynomial regression model (degree 3)
ggplot(dem_12_8, aes(Concentration, CompressiveStrength)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y~poly(x, degree = 3, raw = TRUE)
    )

# plot for polynomial regression model (degree 2)
ggplot(dem_12_8, aes(Concentration, CompressiveStrength)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y~poly(x, degree = 2, raw = TRUE)
    )

# plot for simple linear regression model
ggplot(dem_12_8, aes(Concentration, CompressiveStrength)) +
    geom_point(color = "darkblue") +
    geom_smooth(
        method = "lm",
        formula = y~x
    )


# data wrangling
dem_12_8_wrangling <- dem_12_8 %>% tibble() %>%
    group_by(Concentration) %>%
    mutate(mean_concom = mean(CompressiveStrength)) %>%
    ungroup() %>%
    group_by(mean_concom) %>%
    mutate(sum_sq = sum((CompressiveStrength - mean_concom) ** 2)) %>%
    ungroup()

View(dem_12_8_wrangling)
write.csv(dem_12_8_wrangling, file = "datasets/dem_12_8_wrangling.csv")
summary(dem_12_8_wrangling)

# test lack of fit
EnvStats::anovaPE(dem_12_8_slr)

# compute the pure error manually
dem_12_8_wrangling %>% 
    distinct(sum_sq) %>%
    summarise(pure_error = sum(sum_sq))