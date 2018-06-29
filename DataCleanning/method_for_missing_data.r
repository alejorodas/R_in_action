library(VIM)
#library(mice)
data(sleep, package = "VIM")

#mydata <- read.table("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/DataCleanning/sleepdata.csv", header=TRUE, sep=";")

# Complete-case analysis (listwise deletion)

# In complete-case analysis, only observations containing valid data values on 
# every variable are retained for further analysis. Practically, this involves 
# deleting any row containing one or more missing values, and is also known as listwise, or case-wise, deletion.


# The function complete.cases() can be used to save the cases (rows) of a matrix
# or data frame without missing data:

newdata <- sleep[complete.cases(sleep),]