# dem 12 .36
library(magrittr)

dem_12_36_raw_data <- c(
    7.6, -1, -1, -1,
    8.4, 1, -1, -1,
    9.2, -1, 1, -1,
    10.3, -1, -1, 1,
    9.8, 1, 1, -1,
    11.1, 1, -1, 1,
    10.2, -1, 1, 1,
    12.6, 1, 1, 1
)

dem_12_36_raw_data <- dem_12_36_raw_data %>% matrix(nrow = 8, ncol = 4, byrow = TRUE)

dem_12_36 <- data.frame(
    "Yield" = dem_12_36_raw_data[,1],
    "Temperature" = dem_12_36_raw_data[,2],
    "ReactionTime" = dem_12_36_raw_data[,3],
    "Concentration" = dem_12_36_raw_data[,4]
)
View(dem_12_36)
write.csv(dem_12_36, file = "datasets/dem_12_36.csv")
summary(dem_12_36)

dem_12_36_lm <- lm(
    formula = Yield~Temperature+ReactionTime+Concentration,
    data = dem_12_36
)
summary(dem_12_36_lm)
anova(dem_12_36_lm)
vcov(dem_12_36_lm)
