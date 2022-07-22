# dem 12.2

optical_density <- c(
    0.231, 0.107, 0.053, 0.129, 0.069,
    0.030, 1.005, 0.559, 0.321, 2.948,
    1.633, 0.934
)
band_frequency <- c(
    rep(740, 3), rep(805, 3), rep(980, 3), rep(1235, 3)
)
film_thickness <- c(
    rep(c(1.10, 0.62, 0.31), 4)
)

dem_12_2 <- data.frame(
    "OpticalDensity" = optical_density, # y
    "BandFrequency" = band_frequency, # x1
    "FilmThickness" = film_thickness
)
View(dem_12_2)
write.csv(dem_12_2, file = "datasets/dem_12_2.csv")
summary(dem_12_2)

# Estimate the regression's coefficients for model
# y = b0 + b1x1 + b2x2
dem_12_2_lm <- lm(
    formula = OpticalDensity~BandFrequency+FilmThickness,
    data = dem_12_2
)

anova(dem_12_2_lm)
vcov(dem_12_2_lm)
predict(dem_12_2_lm)
predict(
    dem_12_2_lm, newdata = data.frame(
        "BandFrequency" = 900,
        "FilmThickness" = 1.00
    ), interval = "confidence"
)
predict(
    dem_12_2_lm, newdata = data.frame(
        "BandFrequency" = 900,
        "FilmThickness" = 1.00
    ), interval = "prediction"
)

t(c(1.0, 900, 1.0)) %*% (vcov(dem_12_2_lm)/0.1561) %*%
    t(t(c(1.0, 900, 1.0)))
