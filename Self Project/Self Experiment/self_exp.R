library(tidyverse)
df <- read_csv("project_sheet.csv")
df <- na.omit(df)

cor1 <- cor(df$q11_mot, df$q14_concen)
print(cor1)

lm(df$q11_mot ~ df$q14_concen, data = df) %>% summary()

plot(df$q11_mot, df$q14_concen, xlab = "Motivation", ylab = "Concentration", main = "Motivation vs Concentration", col = "blue")
abline(lm(df$q11_mot ~ df$q14_concen, data = df), col = "red")

# Order the data by session to ensure sessions are sequential
df <- df[order(df$session), ]

# Plot Motivation (q11_mot) across sessions
plot(df$session, df$q11_mot, type = "b", pch = 19, col = "blue",
     xlab = "Session", ylab = "Score",
     main = "Motivation and Concentration Over Sessions",
     ylim = range(c(df$q11_mot, df$q14_concen)))

# Add Concentration (q14_concen) to the same plot
lines(df$session, df$q14_concen, type = "b", pch = 17, col = "red")

# Add a legend
legend("topright", legend = c("Motivation", "Concentration"),
       col = c("blue", "red"), pch = c(19, 17), lty = 1)
