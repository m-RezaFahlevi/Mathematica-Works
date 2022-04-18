# prepare the tools
library(ggplot2)

# prepare the data
x_ <- c(77, 50, 71, 72, 81, 94, 96, 99, 67)
y_ <- c(82, 66, 78, 34, 47, 85, 99, 99, 68)

# construct the data frame
grades_of_class <- data.frame("MidtermGrade" = x_, "FinalGrade" = y_)
summary(grades_of_class) # glimpse at data

# linear models (least-squares method)
lm(formula = "FinalGrade~MidtermGrade", data = grades_of_class)

# visualize
ggplot(grades_of_class, aes(FinalGrade, MidtermGrade)) +
    geom_point(color = "darkblue") +
    geom_smooth(method = lm, formula = "y~x")
