library(ggplot2)

xdomain <- seq(0.1, 3, 0.1)
fun <- function(xreal) xreal + log(xreal)
phi <- function(real) exp(-real)
point <- 0.3
idsvect <- 0
for (i in 1:length(xdomain)) {
    idsvect[i] <- phi(point)
    point <- phi(point)
}

dframe <- data.frame("xvalue" = xdomain, "f.x" = fun(xdomain), "phi.x" = phi(xdomain))
fixedpoint <- data.frame("x.axis" = -log(idsvect), "ith.iterate" = idsvect)
head(dframe)

head(fixedpoint)
tail(fixedpoint)
View(fixedpoint)
funplot <- ggplot(data = dframe, mapping = aes(xvalue, f.x)) + geom_line(color = "blue")
phiplot <- ggplot(data = dframe, mapping = aes(xvalue, phi.x)) + geom_line(color = "darkblue")
fpplot <- ggplot(data = fixedpoint, mapping = aes(x.axis, ith.iterate)) + geom_line()

funplot
phiplot
fpplot
