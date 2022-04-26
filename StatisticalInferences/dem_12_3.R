# dem 12.3

chemistry_grade <- c(
    85, 74, 76, 90,
    85, 87, 94, 98,
    81, 91, 76, 74
)
test_score <- c(
    65, 50, 55, 65,
    55, 70, 65, 70,
    55, 70, 50, 55
)
class_missed <- c(
    1, 7, 5, 2,
    6, 3, 2, 5,
    4, 3, 1, 4
)

dem_12_3 <- data.frame(
    "ChemistryGrade" = chemistry_grade, # y
    "TestScore" = test_score, # x1
    "ClassMissed" = class_missed # x2
)
View(dem_12_3)
write.csv(dem_12_3, file = "datasets/dem_12_3.csv")
