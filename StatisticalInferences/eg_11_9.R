#' Eg 11.9
#' Muhammad Reza Fahlevi

library(dplyr)
library(ggplot2)

v_cm3 <- c(50, 60, 70, 90, 100)
p_kg_per_cm2 <- c(64.7, 51.3, 40.5, 25.9, 7.8)

eg_11_9 <- data.frame("V_cm3" = v_cm3, "P_kg_per_cm2" = p_kg_per_cm2)

eg_11_9 <- eg_11_9 %>% tibble() %>%
    mutate(ln_v_cm3 = -1 * log(V_cm3), ln_p_kg_per_cm2 = log(P_kg_per_cm2))

write.csv(eg_11_9, file = "datasets/eg_11_9.csv")

summary(eg_11_9)

lmodels_eg_11_9 <- lm(
    "ln_p_kg_per_cm2 ~ ln_v_cm3",
    data = eg_11_9
)

ggplot(eg_11_9, aes(V_cm3, p_kg_per_cm2)) +
    geom_point(color = "darkblue") +
    geom_smooth(method = "lm", formula = "y~log(x)") +
    ggtitle("Linear Regression y~log(x)")
