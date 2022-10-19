library(ggplot2)
library(dplyr)

# parameters init
lvl_of_significance <- 0.025
tol_quantity <- 1e-3
max_iter <- 50
degf1 <- 32
degf2 <- 35
n_expr <- 125

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

# create a data.frame
obt_df <- data.frame(
    "num_iter_z" = num_iter_z,
    "num_iter_t" = num_iter_t,
    "num_iter_chisq" = num_iter_chisq,
    "num_iter_f" = num_iter_f
)

write.csv(obt_df, file = "datasets/skripsi.csv")
View(obt_df)
summary(obt_df)

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

gft_z <- obt_df %>% 
    select(num_iter_z) %>%
    mutate(num_iter_z = sort(num_iter_z)) %>%
    group_by(num_iter_z) %>%
    mutate(observed = n()) %>%
    distinct(num_iter_z, observed)

gft_z <- gft_z %>%
    mutate(ismerge = observed <= 5)

bool_vect <- gft_z[,3] %>% as.data.frame()
bool_vect <- bool_vect[1:22,1]
its_val <- gft_z[,2] %>% as.data.frame()
its_val <- its_val[1:22,1]