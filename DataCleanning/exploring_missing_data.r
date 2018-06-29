library(VIM)
#library(mice)
data(sleep, package = "VIM")

# Tabulating missing values
md.pattern(sleep)

# Exploring missing data visually
aggr(sleep, prop=FALSE, numbers=TRUE)

# Using correlations to explore missing values
x <- as.data.frame(abs(is.na(sleep))) # Create data frame indicating missingness by 1
head(sleep, n=5)
head(x, n=5)

y <- x[,sapply(x, sd) > 0] # Select columns with some (but not all) missing values
cor(y) # Create a correlation matrix: Variables missing together have high correlation