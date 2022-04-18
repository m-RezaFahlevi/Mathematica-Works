#' dem_11_36
library(dplyr)
library(ggplot2)
#' The dataset consists of variable relating to blood pressure
#' of 15 Peruvians (n = 15) who have moved from rural, high-
#' altitude areas to urban, lower altitude areas. The variables
#' in this data sets are: Systolic blood pressure (Y),
#' weight (X1), heigh (X2), and pulse.
systolic_pressure_mmHg <- c(
    170, 120, 125, 148, 140, 
    106, 120, 108, 124, 134,
    116, 114, 130, 118, 138
)
weight_kg <- c(
    71.0, 56.5, 56.0, 61.0, 65.0,
    62.0, 53.0, 53.0, 65.0, 57.0,
    66.5, 59.1, 64.0, 69.5, 64.0
)
height_mm <- c(
    1629, 1569, 1561, 1619, 1566,
    1639, 1494, 1568, 1540, 1530,
    1622, 1486, 1578, 1645, 1648
)
pulse_per_minute <- c(
    88, 64, 68, 52, 72,
    72, 64, 80, 76, 60,
    68, 72, 88, 60, 60
)
dem_11_36 <- data.frame(
    "Weight_kg" = weight_kg, # X1
    "Heigh_mm" = height_mm, # X2
    "Pulse_per_minute" = pulse_per_minute,
    "Systolic_pressure_mmHg" = systolic_pressure_mmHg # Y
)
summary(dem_11_36)

#' i. Hypothesis testing with regards to determine
#' weight and systolic pressure are in linear relationship,
#' that is, hypothesis testing on slope for Y~X1
lmodels_X1 <-lm(
    "Systolic_pressure_mmHg~Weight_kg",
    data = dem_11_36
)
lmodels_X1
summary(lmodels_X1)
skripsi::t_local_search(0.05/2, 15-2) # critical value of t
anova(lmodels_X1)
skripsi::f_local_search(0.05, 1, 15-2) # critical value of f
#' let alpha = 0.05, then the critical value for f with 1 and
#' n-2 = 13 degrees of freedom is 4.667193, and the critical
#' value for t with n-2 = 13 degrees of freedom and alpha/2
#' level of significance is 2.160369. Using t-statistics, the
#' hypothesis on the slope lead to unable to reject (do not re-
#' ject) the null hypothesis H0:beta_00 = 0.
#' Using One-way-ANOVA, the hypothesis testing on the slope lead
#' to unable to (do not) reject the null hypothesis H0:beta_00=0

#' Visualization Y~X1
plt_lm_x1 <- ggplot(dem_11_36, aes(weight_kg, systolic_pressure_mmHg)) +
    geom_point(aes(color = Systolic_pressure_mmHg)) +
    geom_smooth(method = lm, formula = "y~x") +
    ggtitle("Regreesion line y~x1")

#' ii. ANOVA for testing linearity of regression for x1
dem_11_36 %>% tibble %>%
    select(Weight_kg, Systolic_pressure_mmHg) %>%
    arrange(Weight_kg) %>% group_by(Weight_kg) %>%
    summarise(mean = mean(Systolic_pressure_mmHg),
              n = sum((Systolic_pressure_mmHg - mean(Systolic_pressure_mmHg)) ** 2))
EnvStats::anovaPE(lmodels_X1)
#' Conclusion
#' Table ANOVA for testing linearity of regression for y~x1
#' show that, at alpha = 0.05 level of significance, it's show
#' that an insignificant amount of variation due to lack of fit.
#' Thus, the experimental data do not seem to suggest the need
#' to consider terms higher than first order in the model, and
#' the null hypothesis is not rejected.

#' iii. Hypothesis testing with regards to determine
#' weight and systolic pressure are in linear relationship,
#' that is, hypothesis testing on slope for Y~Pulse
lmodels_pulse <- lm(
    "Systolic_pressure_mmHg~Pulse_per_minute",
    data = dem_11_36
)
#' Visualize Y~Pressure
plt_lm_pressure <- ggplot(dem_11_36, aes(Pulse_per_minute, Systolic_pressure_mmHg)) +
    geom_point(aes(color = Systolic_pressure_mmHg)) +
    geom_smooth(method = lm, formula = "y~x") +
    ggtitle("Regression line y~pressure")
lmodels_pulse
summary(lmodels_pulse)
skripsi::t_local_search(0.05/2, 15-2)
anova(lmodels_pulse)
skripsi::f_local_search(0.05, 1, 15-2)

#' ANOVA for testing linearity of regression for pressure
dem_11_36 %>% tibble %>%
    select(Pulse_per_minute, Systolic_pressure_mmHg) %>%
    arrange(Pulse_per_minute) %>% group_by(Pulse_per_minute) %>%
    summarise(mean = mean(Systolic_pressure_mmHg),
              n = sum((Systolic_pressure_mmHg - mean(Systolic_pressure_mmHg)) ** 2))
EnvStats::anovaPE(lmodels_pulse)
skripsi::f_local_search(0.05, 6, 7)
#' Conclusion
#' Table ANOVA for testing linearity of regression for y~pressure
#' show that, at alpha = 0.05 level of significance, it's show
#' that an insignificant amount of variation due to lack of fit.
#' Thus, the experimental data do not seem to suggest the need
#' to consider terms higher than first order in the model, and
#' the null hypothesis is not rejected.

#' Construction y~x2
lmodels_X2 <- lm(
    "Systolic_pressure_mmHg~Heigh_mm",
    data = dem_11_36
)
plt_lm_x2 <- ggplot(dem_11_36, aes(Heigh_mm, Systolic_pressure_mmHg)) +
    geom_point(aes(color = Systolic_pressure_mmHg)) +
    geom_smooth(method = lm, formula = "y~x") +
    ggtitle("Regression line y~x2")
summary(lmodels_X2)
skripsi::t_local_search(0.05/2, 15-2)
anova(lmodels_X2)
skripsi::f_local_search(0.05, 1, 15-2)
#' Conclusion
#' With regards to which regressor variable is better,
#' according to its P-values computed from
#' one-way ANOVA tables, the conclusion lead to Weight_kg (X1)
#' is better regressor variable as predictor of the systolic
#' blood pressure.

#' Visualize altogether linear models
gridExtra::grid.arrange(
    plt_lm_x1, plt_lm_x2, plt_lm_pressure,
    nrow = 2
)
