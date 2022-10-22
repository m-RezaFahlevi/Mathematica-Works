library(ggplot2)
library(dplyr)

# parameters init
lvl_of_significance <- 0.025
tol_quantity <- 1e-3
max_iter <- 50
degf1 <- 32
degf2 <- 35
n_expr <- 36

# data gathering
num_iter_z <- c()
num_iter_t <- c()
num_iter_chisq <-c()
num_iter_f <- c()
for (iteration in 1:n_expr) {
    num_iter_z <- num_iter_z %>%
        append(dim(skripsi::z_local_search(lvl_of_significance, tol_quantity, 
                                       max_iter, is_echo = TRUE))[1])
    num_iter_t <- num_iter_t %>%
        append(dim(skripsi::t_local_search(lvl_of_significance, degf1, 
                                       tol_quantity, max_iter, is_echo = TRUE))[1])
    num_iter_chisq <- num_iter_chisq %>%
        append(dim(skripsi::chisq_local_search(lvl_of_significance, degf1,
                                           tol_quantity, max_iter, is_echo = TRUE))[1])
    num_iter_f <- num_iter_f %>%
        append(dim(skripsi::f_local_search(lvl_of_significance, degf1, degf2, 
                                        tol_quantity, max_iter, is_echo = TRUE))[1])
}

# create a data.frame to approximate the standard deviation
obt_df <- data.frame(
    "num_iter_z" = num_iter_z,
    "num_iter_t" = num_iter_t,
    "num_iter_chisq" = num_iter_chisq,
    "num_iter_f" = num_iter_f
)

write.csv(obt_df, file = "datasets/skripsi.csv")
View(obt_df)
summary(obt_df)

var(obt_df) %>% diag() %>% sqrt()
t.test(num_iter_z)
t.test(num_iter_t)
t.test(num_iter_chisq)
t.test(num_iter_f)

chisq_onleft <- skripsi::chisq_local_search(1- 0.05/2, n_expr - 1, tol_quantity, max_iter, ui = 300)
chisq_onright <- skripsi::chisq_local_search(0.05/2, n_expr - 1, tol_quantity, max_iter, ui = 300)

# Estimation of its variances
c((n_expr - 1) * var(num_iter_z) / chisq_onright,
  (n_expr - 1) * var(num_iter_z) / chisq_onleft)

c((n_expr - 1) * var(num_iter_t) / chisq_onright,
  (n_expr - 1) * var(num_iter_t) / chisq_onleft)

c((n_expr - 1) * var(num_iter_chisq) / chisq_onright,
  (n_expr - 1) * var(num_iter_chisq) / chisq_onleft)

c((n_expr - 1) * var(num_iter_f) / chisq_onright,
  (n_expr - 1) * var(num_iter_f) / chisq_onleft)

# construct the normal quantile-quantile plot
# to detect either the data came from a N(0,1)
# distritbution or not.

part_qq <- data.frame(
    "nth_expr" = 1:dim(obt_df)[1],
    "num_iter_z" = sort(obt_df[,1]), # sorted
    "num_iter_t" = sort(obt_df[,2]), # sorted
    "num_iter_chisq" = sort(obt_df[,3]), # sorted
    "num_iter_f" = sort(obt_df[,4]), # sorted
    "spec_frac" = (seq_len(dim(obt_df)[1]) - (3/8))/(n_expr + (1/4))
)
part_qq["stdnq"] <- 4.91 * ((part_qq["spec_frac"] ** 0.14) - 
                                  ((1 - part_qq["spec_frac"]) ** 0.14))
part_qq

ggplot(part_qq, aes(stdnq, num_iter_z)) +
    geom_point(color = "darkblue", size = 1) +
    geom_smooth(method = "lm", formula = "y~x", se = FALSE) +
    xlab("Standard Normal Quantile") +
    ylab("Quantile y") +
    ggtitle(
        label = "Normal quantile-quantile plot iter z",
        subtitle = "Diagnose is the data came from a N(0,1)"
    )

ggplot(part_qq, aes(stdnq, num_iter_t)) +
    geom_point(color = "darkblue", size = 1) +
    geom_smooth(method = "lm", formula = "y~x", se = FALSE) +
    xlab("Standard Normal Quantile") +
    ylab("Quantile y") +
    ggtitle(
        label = "Normal quantile-quantile plot iter t",
        subtitle = "Diagnose is the data came from a N(0,1)"
    )

ggplot(part_qq, aes(stdnq, num_iter_chisq)) +
    geom_point(color = "darkblue", size = 1) +
    geom_smooth(method = "lm", formula = "y~x", se = FALSE) +
    xlab("Standard Normal Quantile") +
    ylab("Quantile y") +
    ggtitle(
        label = "Normal quantile-quantile plot iter chisq",
        subtitle = "Diagnose is the data came from a N(0,1)"
    )

ggplot(part_qq, aes(stdnq, num_iter_f)) +
    geom_point(color = "darkblue", size = 1) +
    geom_smooth(method = "lm", formula = "y~x", se = FALSE) +
    xlab("Standard Normal Quantile") +
    ylab("Quantile y") +
    ggtitle(
        label = "Normal quantile-quantile plot iter f",
        subtitle = "Diagnose is the data came from a N(0,1)"
    )


# construct the frequency distribution with classes
# Let the number of class is 10
# step 1: find the class width
(max(num_iter_z) - min(num_iter_z))/10

# step 2:
seq(min(num_iter_z), max(num_iter_z), 2.6) 

# plot using ggplot2 library
pltz_ggplot <- ggplot(obt_df, aes(num_iter_z)) +
    geom_histogram(aes(y = ..density..), bins = 10, color = "darkblue", fill = "skyblue") +
    geom_density(alpha = .2, color = "darkblue", fill = "#0000FF") +
    geom_vline(aes(xintercept = mean(num_iter_z)),
               color = "blue", linetype = "dashed", size = 1) +
    xlab("iteration") +
    ggtitle("Histogram with density plot", subtitle = "Number iteration required to finding z-value")

# Create data frame for to estimate the mean and variance,
# and to check its distributions.
# Let significant value alpha = 0.05, then we need a sample
# of size n, where n = (t_{\alpha/2}s/e)^2

z_val <- skripsi::z_local_search(
    level_of_significance = lvl_of_significance,
    tol = 1e-3, max_iteration = 50
) %>% round(digits = 3)

t_val <- skripsi::t_local_search(
    level_of_significance = lvl_of_significance,
    dfreedom = n_expr - 1, tol = 1e-3, max_iteration = 50
) %>% round(digits = 3)

n_sizez <- ((t_val * sqrt(var(num_iter_z))/0.05) ** 2) %>% ceiling()
n_sizet <- ((t_val * sqrt(var(num_iter_t))/0.05) ** 2) %>% ceiling()
n_sizechisq <- ((t_val * sqrt(var(num_iter_chisq))/0.05) ** 2) %>% ceiling()
n_sizef <- ((t_val * sqrt(var(num_iter_f))/0.05) ** 2) %>% ceiling()

# Create dataset required to estimate the mu and sigma

# data gathering
req_iter_z <- c()
req_iter_t <- c()
req_iter_chisq <-c()
req_iter_f <- c()

curr_iter <- NULL
for (curr_iter in 1:n_sizet) {
    req_iter_z <- req_iter_z %>%
        append(dim(skripsi::z_local_search(lvl_of_significance, tol_quantity, 
                                           max_iter, is_echo = TRUE))[1])
    req_iter_t <- req_iter_t %>%
        append(dim(skripsi::t_local_search(lvl_of_significance, degf1, 
                                           tol_quantity, max_iter, is_echo = TRUE))[1])
    req_iter_chisq <- req_iter_chisq %>%
        append(dim(skripsi::chisq_local_search(lvl_of_significance, degf1,
                                               tol_quantity, max_iter, is_echo = TRUE))[1])
    req_iter_f <- req_iter_f %>%
        append(dim(skripsi::f_local_search(lvl_of_significance, degf1, degf2, 
                                           tol_quantity, max_iter, is_echo = TRUE))[1])
}

remove("curr_iter")

# create a data.frame to approximate the standard deviation
req_df <- data.frame(
    "niter_z" = req_iter_z,
    "niter_t" = req_iter_t,
    "niter_chisq" = req_iter_chisq,
    "niter_f" = req_iter_f
)
write.csv(req_df, file = "datasets/req_df.csv")
View(req_df)
summary(req_df)
