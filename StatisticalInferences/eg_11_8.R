# anova (Concept of lack-of-fit)
# given the following datasets
x_temperature <- c(
    150, 150, 150, 200, 200, 200,
    250, 250, 250, 300, 300, 300
)
y_chemical_reaction <- c(
    77.4, 76.7, 78.2, 84.1, 84.5, 83.7,
    88.9, 89.2, 89.7, 94.8, 94.7, 95.9
)
eg_11_8 <- data.frame(
    "x_in_celcius" = x_temperature,
    "yield_chemical_reaction" = y_chemical_reaction
)
write.csv(eg_11_8, file = "datasets/eg_11_8.csv")
suggested_model <- lm(
    "yield_chemical_reaction~x_in_celcius",
    data = eg_11_8
) # Compute the linear model y = a + bx
suggested_model
anova(suggested_model) # Compute the anova tables
# Compute the anova for testing
# linearity of regression
EnvStats::anovaPE(suggested_model)