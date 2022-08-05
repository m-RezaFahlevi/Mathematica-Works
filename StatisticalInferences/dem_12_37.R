library(plotly)

dem_12_37_raw_data <- c(
    "Buick Estate Wagon", 4.360, 16.9, 2.73,
    "Ford Country Squire Wagon", 4.054, 15.5, 2.26,
    "Chevy Ma libu Wagon", 3.605, 19.2, 2.56,
    "Chrysler LeBaron Wagon", 3.940, 18.5, 2.45,
    "Chevette", 2.155, 30.0, 3.70,
    "Toyota Corona", 2.560, 27.5, 3.05,
    "Datsun 510", 2.300, 27.2, 3.54,
    "Dodge Omni", 2.230, 30.9, 3.37,
    "Audi 5000", 2.830, 20.3, 3.90,
    "Volvo 240 CL", 3.140, 17.0, 3.50,
    "Saab 99 GLE", 2.795, 21.6, 3.77,
    "Peugeot 694 SL", 3.410, 16.2, 3.58,
    "Buick Century Special", 3.380, 20.6, 2.73,
    "Mercury Zephyr", 3.070, 20.8, 3.08,
    "Dodge Aspen", 3.620, 18.6, 2.71,
    "AMC Concord D/L", 3.410, 18.1, 2.73,
    "Chevy Caprice Classic", 3.840, 17.0, 2.41,
    "Ford LTP", 3.725, 17.6, 2.26,
    "Mercury Grand Marquis", 3.955, 16.5, 2.26,
    "Dodge St Regis", 3.830, 18.2, 2.45,
    "Ford Mustang 4", 2.585, 26.5, 3.08,
    "Ford Mustang Ghia", 2.910, 21.9, 3.08,
    "Mazda GLC", 1.975, 34.1, 3.73,
    "Dodge Colt", 1.915, 35.1, 2.97,
    "AMC Spirit", 2.670, 27.4, 3.08,
    "VW Scirocco", 1.990, 31.5, 3.78,
    "Honda Accord LX", 2.135, 29.5, 3.05,
    "Buick Skylark", 2.570, 28.4, 2.53,
    "Chevy Citation", 2.595, 28.8, 2.69,
    "Olds Omega", 2.700, 26.8, 2.84,
    "Pontiac Phoenix", 2.556, 33.5, 2.69,
    "Plymouth Horizon", 2.200, 34.2, 3.37,
    "Datsun 210", 2.020, 31.8, 3.70,
    "Fiat Strada", 2.130, 37.3, 3.10,
    "VW Dasher", 2.190, 30.5, 3.70,
    "Datsun 810", 2.815, 22.0, 3.70,
    "BMW 320i", 2.600, 21.5, 3.64,
    "VW Rabbit", 1.925, 31.9, 3.78
)

dem_12_37_raw_data <- dem_12_37_raw_data %>%
    matrix(nrow = 38, ncol = 4, byrow = TRUE)

dem_12_37 <- data.frame(
    "VehicleModel" = dem_12_37_raw_data[,1],
    "WT" = dem_12_37_raw_data[,2] %>% as.numeric(),
    "MPG" = dem_12_37_raw_data[,3] %>% as.numeric(),
    "DR_RATIO" = dem_12_37_raw_data[,4] %>% as.numeric()
)
View(dem_12_37)
write.csv(dem_12_37, file = "datasets/dem_12_37.csv")
summary(dem_12_37)

dem_12_37_lm_log <- lm(formula = MPG~log(WT), data = dem_12_37)
dem_12_37_lm_mlr <- lm(formula = MPG~WT+DR_RATIO, data = dem_12_37)
dem_12_37_lm_slr <- lm(formula = MPG~WT, data = dem_12_37)

summary(dem_12_37_lm_log)
anova(dem_12_37_lm_log)
vcov(dem_12_37_lm_log)

summary(dem_12_37_lm_mlr)
anova(dem_12_37_lm_mlr)
vcov(dem_12_37_lm_mlr)

summary(dem_12_37_lm_slr)
anova(dem_12_37_lm_slr)
vcov(dem_12_37_lm_slr)

# visualization
dem_12_37 %>% ggplot(mapping = aes(WT, MPG)) +
    geom_smooth(method = "lm", formula = y~log(x)) +
    geom_point(color = "darkblue")

dem_12_37 %>% ggplot(mapping = aes(WT, MPG)) +
    geom_smooth(method = "lm", formula = y~x) +
    geom_point(color = "darkblue")

dem_12_37 %>% plot_ly(
    x = ~MPG, y = ~DR_RATIO, z = ~WT
) %>% add_markers()
