# prepare the tools
library(ggplot2)

dem_11_1_to_11_13 <- function(st_data, nd_data, st_name, nd_name) {
    x_length <- length(st_data)
    y_length <- length(nd_data)
    if (x_length != y_length) {
        return("the length is not equals")
    } else {
        # construct the data frames
        df_xy <- data.frame(st_name = st_data, 
                            nd_name = nd_data)
        print(lm(formula = nd_name~st_name, data = df_xy))
        # visualize
        plt <- ggplot(df_xy, aes(st_name, nd_name)) +
            geom_point(color = "darkblue") +
            geom_smooth(method = lm, formula = "y~x") +
            ggtitle("Scatter diagram with regression lines") +
            xlab("variable, x") +
            ylab("response, y")
        # glimpse of data
        names(df_xy)[1] <- st_name
        names(df_xy)[2] <- nd_name
        View(df_xy)
        print(summary(df_xy))
        plt
    }
}

# prepare the data
temperature_ <- c(
    1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7,
    1.8, 1.9, 2.0
)
converted_sugar <- c(
    8.1, 7.8, 8.5, 9.8, 9.5, 8.9, 8.6, 10.2,
    9.3, 9.2, 10.5
)

dem_11_1_to_11_13(
    temperature_, converted_sugar,
    "Temperature", "ConvertedSugar"
)
