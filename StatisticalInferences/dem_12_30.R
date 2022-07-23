araw_data_dem_12_30 <- c(
    14.62, 226.0, 7.000, 128.40,
    15.63, 220.0, 3.375, 52.62,
    14.62, 217.4, 6.375, 113.90,
    15.00, 220.0, 6.000, 98.01,
    14.50, 226.5, 7.625, 139.90,
    15.25, 224.1, 6.000, 102.60,
    16.12, 220.5, 3.375, 48.14,
    15.13, 223.5, 6.125, 109.60,
    15.50, 217.6, 5.000, 82.68,
    15.13, 228.5, 6.625, 112.60,
    15.50, 230.2, 5.750, 97.52,
    16.12, 226.5, 3.750, 59.06,
    15.13, 226.6, 6.125, 111.80,
    15.63, 225.6, 5.375, 89.09,
    15.38, 234.0, 8.875, 171.90,
    15.50, 230.0, 4.000, 66.80,
    14.25, 224.3, 8.000, 157.10,
    14.50, 240.5, 10.870, 208.40,
    14.62, 223.7, 7.375, 133.40
)

araw_data_dem_12_30 <-  araw_data_dem_12_30 %>% matrix(nrow = 19, ncol = 4, byrow = TRUE)

dem_12_30 <- data.frame(
    "EmitterRS" = araw_data_dem_12_30[,1],
    "cBaseRS" = araw_data_dem_12_30[,2],
    "EBRS" = araw_data_dem_12_30[,3],
    "hFE1M5V" = araw_data_dem_12_30[,4]
)
View(dem_12_30)
write.csv(dem_12_30, file = "datasets/dem_12_30.csv")
summary(dem_12_30)

dem_12_30_lm <- lm(
    formula = hFE1M5V~EmitterRS+cBaseRS+EBRS,
    data = dem_12_30
)

summary(dem_12_30_lm)
anova(dem_12_30_lm)
vcov(dem_12_30_lm)

predict(
    dem_12_30_lm, newdata = data.frame(
        "EmitterRS" = 15.0,
        "cBaseRS" = 220.0,
        "EBRS" = 6.0
    ), interval = "confidence"
)

predict(
    dem_12_30_lm, newdata = data.frame(
        "EmitterRS" = 15.0,
        "cBaseRS" = 220.0,
        "EBRS" = 6.0
    ), interval = "prediction"
)
