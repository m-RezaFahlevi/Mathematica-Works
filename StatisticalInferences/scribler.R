#%% Dem 10.40
library(dplyr)

#%% Prepare the data
nonsmokers <- c(
	0.97, 0.72, 1.00, 0.81, 0.62, 1.32, 1.24, 0.99, 0.90,
	0.74, 0.88, 0.94, 1.16, 0.86, 0.85, 0.58, 0.57, 0.64,
	0.98, 1.09, 0.92, 0.78, 1.24, 1.18
)
smokers <- c(0.48, 0.71, 0.98, 0.68, 1.18, 1.36, 0.78, 1.64)
summary(nonsmokers)
summary(smokers)

#%% second cell
nsample_nonsmokers <- length(nonsmokers)
nsample_smokers <- length(smokers)
print(nsample_nonsmokers)
print(nsample_smokers)

#%%
var_nonsmokers <- var(nonsmokers)
var_smokers <- var(smokers)

#%% Fisher's F-test
var.test(nonsmokers, smokers)

#%% Compute t'-statistic
t.test(nonsmokers, smokers, var.equal = FALSE)

#%% Compute the degrees of freedom
nominator <- (var_nonsmokers / nsample_nonsmokers) + (var_smokers / nsample_smokers)
first_term <- ((var_nonsmokers / nsample_nonsmokers) ** 2) / (nsample_nonsmokers - 1)
second_term <- ((var_smokers / nsample_smokers) ** 2) / (nsample_smokers - 1)
v_degrees_of_freedom <- nominator / (first_term + second_term)
print(v_degrees_of_freedom)

#%% Compute the t' statistics
tprime_nominator <- mean(nonsmokers) - mean(smokers)
tprime_denominator <- sqrt((var_nonsmokers / nsample_nonsmokers) + (var_smokers / nsample_smokers))
tprime_statistics <- tprime_nominator / tprime_denominator
print(tprime_statistics)

#%% Compute the P-Value
p_tprime <- pt(tprime_statistics, df = v_degrees_of_freedom)
p_value <- 2 * p_tprime
print(p_value)
