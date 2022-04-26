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
