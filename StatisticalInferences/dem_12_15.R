# dem 12.11
library(magrittr)

dem_12_15_raw_data <- c(
    11.2, 56.5, 71.0, 38.5, 43.0,
    14.5, 59.5, 72.5, 38.2, 44.8,
    17.2, 69.2, 76.0, 42.5, 49.0,
    17.8, 74.5, 79.5, 43.4, 56.3,
    19.3, 81.2, 84.0, 47.5, 60.2,
    24.5, 88.0, 86.2, 47.4, 62.0,
    21.2, 78.2, 80.5, 44.5, 58.1,
    16.9, 69.0, 72.0, 41.8, 48.1,
    14.8, 58.1, 68.0, 42.1, 46.0,
    20.0, 80.5, 85.0, 48.1, 60.3,
    13.2, 58.3, 71.0, 37.5, 47.1,
    22.5, 84.0, 87.2, 51.0, 65.2
)
dem_12_15_raw_data <- dem_12_15_raw_data %>% matrix(nrow = 12, 5, byrow = TRUE)

dem_12_15 <- data.frame(
    "JobPerformanceRating" = dem_12_15_raw_data[,1],
    "FirstTestScore" = dem_12_15_raw_data[,2],
    "SecondTestScore" = dem_12_15_raw_data[,3],
    "ThirdTestScore" = dem_12_15_raw_data[,4],
    "FourthTestScore" = dem_12_15_raw_data[,5]
)
View(dem_12_15)
write.csv(dem_12_15, file = "datasets/dem_12_15.csv")
summary(dem_12_15)

dem_12_15_lm <- lm(
    formula = JobPerformanceRating~FirstTestScore+
        SecondTestScore+ThirdTestScore+FourthTestScore,
    data = dem_12_15
)

# The first two variable is excluded
dem_12_15_restricted_lm <- lm(
    formula = JobPerformanceRating~ThirdTestScore+FourthTestScore,
    data = dem_12_15
)

# usefull information for dem_12_15_lm
summary(dem_12_15_lm)
anova(dem_12_15_lm)
vcov(dem_12_15_lm)

# usefull information for dem_12_15_restricted_lm
summary(dem_12_15_restricted_lm)
anova(dem_12_15_restricted_lm)
vcov(dem_12_15_restricted_lm)

# lse matrix of normal equation X'X
XX_dem_12_15_restrictied_lm <- (vcov(dem_12_15_restricted_lm)/2.834) %>% solve()

# obtain the y vector in Ax=y
XX_dem_12_15_restrictied_lm %*%
    coef(dem_12_15_restricted_lm)

# calculated the SSR\{b1, b2}
((predict(dem_12_15_restricted_lm) - mean(dem_12_15[,1])) ** 2) %>%
    sum()
