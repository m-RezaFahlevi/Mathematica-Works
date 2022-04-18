# dem 11.43

mathematics_grade <- c(70, 92, 80, 74, 65, 83)
english_grade <- c(74, 84, 63, 87, 78, 90)
dem_11_43 <- data.frame(
    "MathematicsGrade" = mathematics_grade,
    "EnglishGrade" = english_grade
)
View(dem_11_43)
summary(dem_11_43)
write.csv(dem_11_43, file = "datasets/dem_11_43.csv")
# Calculate the Sxx
sum(
    (mathematics_grade - mean(mathematics_grade)) ** 2
)
# Calculate the Syy
sum(
    (english_grade - mean(english_grade)) ** 2
)
# Calculate the Sxy
sum(
    (mathematics_grade - mean(mathematics_grade)) *
        (english_grade - mean(english_grade))
)
