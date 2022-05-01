# dem 12.3
library(magrittr)

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
summary(dem_12_3)

# Estimate the regression's coefficient for model
# y = b0 + b1x1 + b2x2
dem_12_3_lm <- lm(
    formula = ChemistryGrade~TestScore+ClassMissed,
    data = dem_12_3
)

# Estimate the chemistry_grade for student
# which have test_score = 60 and class_missed = 4
(dem_12_3_lm %>%
    coefficients() %>%
    as.vector() * c(1, 60, 4)) %>%
    sum()
