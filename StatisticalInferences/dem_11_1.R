# prepare the tools
library(ggplot2)

# prepare the data
arm_strength <- c(
    17.3, 19.3, 19.5, 19.7, 22.9, 23.1, 26.4,
    26.8, 27.6, 28.1, 28.2, 28.7, 29.0, 29.6,
    29.9, 29.9, 30.3, 31.3, 36.0, 39.5, 40.4, 44.3, 44.6,
    50.4, 55.9
)
dynamic_lift <- c(
    71.7, 48.3, 88.3, 75.0, 91.7, 100.0,
    73.3, 65.0, 75.0, 88.3, 68.3, 96.7,
    6.7, 78.3, 60.0, 71., 85.0, 85.0, 88.3,
    100.0, 100.0, 100.0, 91.7, 100.0, 71.7
)
length(arm_strength) == length(dynamic_lift)

df_vpiandsu <- data.frame(
    "ArmStrength" = arm_strength,
    "DynamicLift" = dynamic_lift
)
summary(df_vpiandsu) # glimpse at data

# linear models (least squares method)
lm(formula = "DynamicLift~ArmStrength", data = df_vpiandsu)

# visualize
ggplot(df_vpiandsu, aes(ArmStrength, DynamicLift)) +
    geom_point(color = "darkblue") +
    geom_smooth(method = lm, formula = "y~x")
