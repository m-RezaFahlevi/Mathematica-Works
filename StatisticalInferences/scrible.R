library(dplyr)
library(ggplot2)

# take a glimpse at the data
no_and_with_nitrogen %>% summary()

no_nitrogen_df <- no_and_with_nitrogen %>%
    mutate(categorized = "no_nitrogen_") %>%
    select(no_nitrogen, categorized)
colnames(no_nitrogen_df)[1] <- "quantity"

nitrogen_df <- no_and_with_nitrogen %>%
    mutate(categorized = "nitrogen_") %>%
    select(nitrogen, categorized)
colnames(nitrogen_df)[1] <- "quantity"

no_and_with_nitrogen <- no_nitrogen_df %>%
    rbind(nitrogen_df)

# plot using box_whisker
no_and_with_nitrogen %>%
    ggplot(aes(as.factor(categorized), quantity, fill = categorized)) +
    geom_boxplot() +
    ylab("weight")

no_and_with_nitrogen <- no_and_with_nitrogen %>% mutate(categorized = as.factor(categorized))

t.test(
    Pair(no_nitro, nitro) ~ 1,
    data = df_
)
help("t.test")

summary(no_and_with_nitrogen_splitted)
