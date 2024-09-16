library(tidyverse)
library(psych)
quarto.install(tinytex)

df <- read.csv("ex2.csv")
getwd()
setwd("/Users/ianhabit/Documents/GitHub/psyc530/exercise_2_report")

# Create a line plot of the groups, "More" and "Less" and their d' values
# across the 3 series. The variables are "s1_prime", "s2_prime", and "s3_prime"

df_long <- df %>%
  pivot_longer(cols = c("s1_dprime", "s2_dprime", "s3_dprime"),
               names_to = "series", values_to = "dprime")

df_long$series <- factor(df_long$series, 
                        levels = c("s1_dprime", "s2_dprime", "s3_dprime"),
                        labels = c("Series 1", "Series 2", "Series 3"))

ggplot(df_long, aes(x = series, y = dprime, group = group, color = group)) +
  geom_line() +         # Add lines connecting points
  geom_point(size = 3) + # Add points for each data point
  labs(title = "d' Values Across Series for More and Less Groups",
       x = "Series",
       y = "d' Value") +
  theme_minimal() +      # Clean plot theme
  scale_color_manual(values = c("more" = "blue", "less" = "red"))


df_long <- df %>%
  pivot_longer(cols = c("s1_crit", "s2_crit", "s3_crit"),
               names_to = "series", values_to = "crit")

df_long$series <- factor(df_long$series, 
                         levels = c("s1_crit", "s2_crit", "s3_crit"),
                         labels = c("Series 1", "Series 2", "Series 3"))

ggplot(df_long, aes(x = series, y = crit, group = group, color = group)) +
  geom_line() +         # Add lines connecting points
  geom_point(size = 3) + # Add points for each data point
  labs(title = "c Values Across Series for More and Less Groups",
       x = "Series",
       y = "c Value") +
  theme_minimal() +      # Clean plot theme
  scale_color_manual(values = c("more" = "blue", "less" = "red"))
