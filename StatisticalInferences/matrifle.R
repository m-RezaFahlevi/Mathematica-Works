new_x <- runif(n= 400, 50, 100)
new_y <- 12.0623 + 0.7771 * new_x +
    rnorm(
        400, 
        mean = 12.0623 + 0.7771 * runif(400, 50, 100),
        sd = 0.7771
    )

new_grades_of_class <- data.frame(
    "MidtermGrade" = new_x,
    "FinalGrade" = new_y
)
summary(new_grades_of_class)

# linear models (least-squares method)
lm(formula = "FinalGrade~MidtermGrade", data = new_grades_of_class)

ggplot(new_grades_of_class, aes(FinalGrade, MidtermGrade)) +
    geom_point(color = "darkblue") +
    geom_smooth(method = lm, formula = "y~x")
