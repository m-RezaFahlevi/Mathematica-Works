# prepare the data
xray_analysis <- c(2.0, 2.0, 2.3, 2.1, 2.4)
chemical_analysis <- c(2.2, 1.9, 2.5, 2.3, 2.4)
diff_analysis <- chemical_analysis - xray_analysis
summary(diff_analysis)
sqrt(var(diff_analysis))

# compute paired t-test
t.test(chemical_analysis, xray_analysis, paired=TRUE)
