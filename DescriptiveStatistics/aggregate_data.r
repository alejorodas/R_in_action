#In these results, Group.1 represents the number of cylinders (4, 6, or 8) and Group.2 
#represents the number of gears (3, 4, or 5). For example, cars with 4 cylinders and 3 
#gears have a mean of 21.5 miles per gallon (mpg).

options(digits=3)
attach(mtcars)
#aggdata <-aggregate(mtcars, by=list(cyl,gear), FUN=mean, na.rm=TRUE)
aggdata <-aggregate(mtcars, by=list(cyl), FUN=mean, na.rm=TRUE)