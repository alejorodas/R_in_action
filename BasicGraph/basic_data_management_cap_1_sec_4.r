manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)

leadership <- data.frame(manager, date, country, gender, age,q1, q2, q3, q4, q5, stringsAsFactors=FALSE)

mydata<-data.frame(x1 = c(2, 2, 6, 4),
                   x2 = c(3, 4, 2, 8))

mydata
#------------------------------------------------------------------
# Creating new variables

# mydata$sumx  <-  mydata$x1 + mydata$x2
# mydata$meanx <- (mydata$x1 + mydata$x2)/2

mydata <- transform(mydata,
                    sumx  =  x1 + x2,
                    meanx = (x1 + x2)/2)

mydata
#------------------------------------------------------------------

# Recoding variables

# Recoding involves creating new values of a variable conditional on the existing values 
# of the same and/or other variables. For example, you may want to

# - Change a continuous variable into a set of categories
# - Replace miscoded values with correct values
# - Create a pass/fail variable based on a set of cutoff scores

leadership

leadership <- within(leadership,{
                     agecat <- NA
                     agecat[age > 75]              <- "Elder"
                     agecat[age >= 55 & age <= 75] <- "Middle Aged"
                     agecat[age < 55]              <- "Young" })

leadership
#------------------------------------------------------------------

# Excluding missing values from analyses

# You can remove any observation with missing data by using the na.omit() 
# function. na.omit() deletes any rows with missing data.
leadership <- na.omit(leadership)
leadership


leadership$date <- as.Date(leadership$date, "%m/%d/%Y")
leadership
