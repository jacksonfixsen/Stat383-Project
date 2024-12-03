graphics.off() # clear all previous plots
rm(list=ls()) # clear the environment from previous codes
cat("\014") # clear the console 


library(readxl)
df <- read_excel("consolidated_data.xlsx") 
View(df)
head(df)

# change a column name

colnames(df)[3] <- "different"
sum(df$vote=="Donald Trump")
sum(df$vote=="Kamala Harris")
sum(df$vote=="Other")
nrow(df)

# proportion of Donald Trump voters
print(sum(df$vote=="Donald Trump")/nrow(df))

# proportion of Kamala Harris voters
print(sum(df$vote=="Kamala Harris")/nrow(df))

# proportion of Other voters
print(sum(df$vote=="Other")/nrow(df))

# Subsetting a dataset
# 
df_males <- df[df$gender==1,]

df_females <- df[df$gender==0,]

# proportion of Donald Trump voters amongst male students
print(sum(df_males$vote=="Donald Trump")/nrow(df_males))

# proportion of Donald Trump voters amongst female students
print(sum(df_females$vote=="Donald Trump")/nrow(df_females))
