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
