graphics.off() # clear all previous plots
rm(list=ls()) # clear the environment from previous codes
cat("\014") # clear the console 
setwd("C:/Users/User/Desktop/Voting_Project_Stats")# set working directory
library(readxl)
df <- read_excel("consolidated_data.xlsx") #read from excel file
View(df)
head(df)

# change a column name

colnames(df)[3] <- "different"

#Total Trump Votes
sum(df$vote=="Donald Trump")


#total voters
nrow(df)

# number of males
df_males <- df[df$gender==1,]


# proportion of Donald Trump voters amongst male students
Trump_Male_Voters <- sum(df_males$vote == "Donald Trump") / nrow(df_males)
print(Trump_Male_Voters)
Actual_Trump_Voters <- .49


# Significance level
alpha <- 0.05

# Hypothesized proportion (p0)
p0 <- Actual_Trump_Voters  

# Sample size for males
n_males <- as.numeric(nrow(df_males))

# Proportion of male Trump voters observed
p_hat <- Trump_Male_Voters

# Standard error of the proportion
se <- sqrt(p0 * (1 - p0) / n_males)

# Critical z-value for two-tailed test
z_critical <- qnorm(1 - alpha / 2)



# Compute the test statistic (z-score)
TS <- (p_hat - p0) / se

# Compute the p-value (two-tailed test)
p_value <- 2 * (1 - pnorm(abs(TS)))

infinity <- "\u221e"

# Rejection region
cat("Rejection Region: (-", infinity, ",", -z_critical,"]U[", z_critical,",",infinity, ")", "\n")


# Rejection decision
reject_null <- abs(TS) > z_critical

#Print decision
cat("Reject Null Hypothesis: ", reject_null, "\n")
