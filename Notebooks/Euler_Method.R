library(plotly)

diffeq <- function(x, y) {
    return(x + y)
}

tanget_line <- function(xo, yo, step_size) {
    yi = yo + step_size*diffeq(xo, yo)
    return(yi)
}

x_vect <- seq(0, 5, 0.1)
y_vect <- c(1)
slope_value <- c()  #initialization

for (iter in 1:length(x_vect)) {
    # to avoid indexing by 0 value
    if(iter == 1) {
        slope_value[iter] <- diffeq(x = x_vect[iter], y = y_vect)
        y_vect[iter] <- tanget_line(xo = x_vect[iter], yo = y_vect, step_size = 0.1)
    } else {
        slope_value[iter] <- diffeq(x = x_vect[iter], y = y_vect[iter - 1])
        y_vect[iter] <- tanget_line(xo = x_vect[iter], yo = y_vect[iter - 1], step_size = 0.1)
    }
    
}

xn_indexing <- seq(0.1, 5.1, 0.1)   # indexing a result
df <- data.frame(xn_indexing, y_vect, "slope_value" = slope_value)
head(df) 
print(df)
ploting <- ggplot(data = df, mapping = aes(xn_indexing, y_vect)) + geom_line()
ploting
