# In this section, we’ll look at frequency and contingency tables from categorical variables
library(vcd)
head(Arthritis)

options(digits=2)

# ONE-WAY TABLES
# You can generate simple frequency counts using the table()
mytable <- with(Arthritis, table(Improved))
mytable

# You can turn these frequencies into proportions 
prop.table(mytable)

# Into percentages
slices <- prop.table(mytable)*100
slices

# Pie graph
lbls <- factor(Arthritis$Improved, order = TRUE)
pie(slices, labels = levels.default(lbls), main="Simple Pie Chart")


# TWO-WAY TABLES

mytable1 <- table(Arthritis$Treatment, Arthritis$Improved)
mytable1

# xtabs() function allows you to create a contingency table using formula style input
# mytable <- xtabs(~ A + B, data=mydata). where A is the row variable, and B is the column variable

# Treatment and Improved are categorical variables
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable

# You can generate marginal frequencies
margin.table(mytable, 1)

# You can generate marginal proportions (tables of proportions )
prop.table(mytable, 1)

# For column sums and column proportions, you have
margin.table(mytable, 2)
prop.table(mytable, 2)

# Cell proportions are obtained with this statement
prop.table(mytable)

# You can use the addmargins() function to add marginal sums to these tables
addmargins(mytable)
addmargins(prop.table(mytable))

# When using addmargins(), the default is to create sum margins for all variables in a table. 
# In contrast: adds a sum column alone
addmargins(prop.table(mytable, 1), 2)
addmargins(prop.table(mytable, 2), 1)