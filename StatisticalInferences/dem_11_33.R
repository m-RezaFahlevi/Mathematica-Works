# Dem 11_33
df_x <- c(0.5, 1.5, 3.2, 4.2, 5.1, 6.5)
df_y <- c(1.3, 3.4, 6.7, 8.0, 10.0, 13.2)
dem_11_33 <- data.frame("this_is_x" = df_x, "this_is_y" = df_y)

write.csv(dem_11_33, file = "datasets/dem_11_33.csv")

lmodels_dem_11_33_through_origin <- lm(
    formula = "this_is_y~0+this_is_x",
    data = dem_11_33
)
lmodels_dem_11_33_through_origin

lmodels_dem_11_33 <- lm(
    "this_is_y~this_is_x",
    data = dem_11_33
)
lmodels_dem_11_33

summary(lmodels_dem_11_33)
summary(lmodels_dem_11_33_through_origin)

# One-way ANOVA
anova(lmodels_dem_11_33)
anova(lmodels_dem_11_33_through_origin)
