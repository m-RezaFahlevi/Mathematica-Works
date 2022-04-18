# dem 11.37
library(dplyr)

Dose <- c(
    rep(0,5), rep(2.3, 5), rep(4.6, 5),
    rep(9.2, 5), rep(18.4, 5)
)
Activity <- c(
    10.9, 10.6, 10.8, 9.8, 9.0,
    11.0,11.6, 11.4, 9.9, 10.1,
    10.6, 10.4, 8.8, 11.1, 8.4,
    9.7, 7.8, 9.0, 8.2, 2.3,
    2.9, 2.2, 3.4, 5.4, 8.2
)
dem_11_37 <- data.frame(
    "Animals" = seq_len(25),
    "Dose_x" = Dose, "Activity_y" = Activity
)
summary(dem_11_37)
write.csv(dem_11_37, file = "datasets/dem_11_37.csv")

lmodels_dem_11_37 <- lm(
    "Activity_y~Dose_x", dem_11_37
)
lmodels_dem_11_37
anova(lmodels_dem_11_37)
EnvStats::anovaPE(lmodels_dem_11_37)

# data wrangling with dplyr
# to compute pure error
dem_11_37 %>% tibble() %>% 
    group_by(Dose_x) %>% 
    summarise(mean = mean(Activity_y), 
              n = sum((Activity_y - mean(Activity_y)) ** 2))
