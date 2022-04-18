# prepare the tools
library(ggplot2)

# prepare the datasets
solids_reduction <- c(
	3, 7, 11, 15, 18, 27, 29, 30, 30,
	31, 31, 32, 33, 33, 34, 36, 36, 36,
	37, 38, 39, 39, 39, 40, 41, 42, 42, 43, 
	44, 45, 46, 47, 50
)
chemical_oxygen_demand <- c(
	5, 11, 21, 16, 16, 28, 27, 25, 35, 30,
	40, 32, 34, 32, 34, 37, 38, 34, 36, 38, 37,
	36, 45, 39, 41, 40, 44, 37, 44, 46, 46, 49, 51
)
length(solids_reduction) == length(chemical_oxygen_demand)

# construct the data frames
df_xy <- data.frame("SolidsReduction" = solids_reduction, "ChemicalOxygenDemand" = chemical_oxygen_demand)
summary(df_xy)
write.csv(df_xy, file = "datasets/eg_10_1.csv")
# linear models
lm_df_xy <- lm(formula= "ChemicalOxygenDemand~SolidsReduction", data= df_xy)
lm_df_xy
confint(lm_df_xy)
anova(lm_df_xy)

predict(lm_df_xy)
lm.influence(lm_df_xy)

# plot the model
ggplot(df_xy, aes(SolidsReduction, ChemicalOxygenDemand)) + 
    geom_point(color = "darkblue") +
    geom_smooth(method = lm, formula = "y~x") +
    ggtitle("Scatter diagram with regression lines")
