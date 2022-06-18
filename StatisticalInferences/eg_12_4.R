# eg 12.4
library(dplyr)

raw_data <- c(
    25.5, 1.74, 5.30, 10.80,
    31.2, 6.32, 5.42, 9.40,
    25.9, 6.22, 8.41, 7.20,
    38.4, 10.52, 4.63, 8.50,
    18.4, 1.19, 11.60, 9.40,
    26.7, 1.22, 5.85, 9.90,
    26.4, 4.10, 6.62, 8.00,
    25.9, 6.32, 8.72, 9.10,
    32.0, 4.08, 4.42, 8.70,
    25.2, 4.15, 7.60, 9.20,
    39.7, 10.15, 4.83, 9.40,
    35.7, 1.72, 3.12, 7.60,
    26.5, 1.70, 5.30, 8.20
) %>% matrix(
    nrow = 13, ncol = 4, byrow = TRUE
)

eg_12_4 <- data.frame(
    "Survival" = raw_data[,1],
    "X1" = raw_data[,2],
    "X2" = raw_data[,3],
    "X3" = raw_data[,4]
)
write.csv(eg_12_4, file = "datasets/eg_12_4.csv")
View(eg_12_4)
summary(eg_12_4)

eg_12_4_lm <- lm(
    formula = Survival~X1+X2+X3,
    data = eg_12_4
)
summary(eg_12_4_lm)
anova(eg_12_4_lm)

eg_12_4_lm_coef <- eg_12_4_lm %>%
    coefficients() %>%
    as.vector()
sum(eg_12_4_lm_coef * c(1, 3, 8, 9))

# construct the least square estimators matrix
lse_mat <-  c(
    eg_12_4 %>% tibble() %>%
        summarise(
            sum_survival = sum(Survival),
            sum_X0 = 13,
            sum_X1 = sum(X1),
            sum_X2 = sum(X2),
            sum_X3 = sum(X3)
        ) %>% as.numeric(),
    eg_12_4 %>% tibble() %>%
        summarise(
            sum_survival = sum(X1 * Survival),
            sum_X0 = sum(X1),
            sum_X1 = sum(X1 * X1),
            sum_X2 = sum(X1 * X2),
            sum_X3 = sum(X1 * X3)
        ) %>% as.numeric(),
    eg_12_4 %>% tibble() %>%
        summarise(
            sum_survival = sum(X2 * Survival),
            sum_X0 = sum(X2),
            sum_X1 = sum(X2 * X1),
            sum_X2 = sum(X2 * X2),
            sum_X3 = sum(X2 * X3)
        ) %>% as.numeric(),
    eg_12_4 %>% tibble() %>%
        summarise(
            sum_survival = sum(X2 * Survival),
            sum_X0 = sum(X3),
            sum_X1 = sum(X3 * X1),
            sum_X2 = sum(X3 * X2),
            sum_X3 = sum(X3 * X3)
        ) %>% as.numeric()
) %>% matrix(
    nrow = 4, ncol = 5, byrow = TRUE
)
lse_mat <- lse_mat[,2:5] # lse matrix
lse_mat %>% solve() # variance and covariance

# for x1 = 3, x2 = 8, x3 = 9, then
c(1, 3, 8, 9) %*%
    (lse_mat %>% solve()) %*%
    t(t(c(1, 3, 8, 9)))
