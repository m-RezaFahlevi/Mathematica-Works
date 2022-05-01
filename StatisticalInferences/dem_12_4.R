# dem.12.4

final_weight <- c(
    95, 77, 80, 100, 97, 
    70, 60, 80, 92, 84
)
initial_weight <- c(
    42, 33, 33, 45, 39,
    36, 32, 41, 40, 38
)
feed_weight <- c(
    272, 226, 259, 292, 311,
    183, 173, 236, 230, 235
)

dem_12_4 <- data.frame(
    "FinalWeight" = final_weight, # y
    "InitialWeight" = initial_weight, # x1
    "FeedWeight" = feed_weight # x2
)
View(dem_12_4)
write.csv(dem_12_4, file = "datasets/dem_12_4.csv")
summary(dem_12_4)

dem_12_4_lm <- lm(
    formula = FinalWeight~InitialWeight+FeedWeight,
    data = dem_12_4
)

# Prediction for the final weight of an animal that
# has an intial weight of 35 kilograms and is
# given 250 kilograms of feed
(dem_12_4_lm %>% coefficients() %>%
    as.vector() * c(1, 35, 250)) %>% sum()