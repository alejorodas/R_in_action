library(lattice)
attach(mtcars)

# Create factors with value labels
gear <- factor(gear, levels=c(3, 4, 5),labels=c("3 gears", "4 gears", "5 gears"))
cyl <- factor(cyl, levels=c(4, 6, 8),labels=c("4 cylinders", "6 cylinders", "8 cylinders"))

densityplot(~mpg,
            main="Density Plot",
            xlab="Miles per Gallon")

densityplot(~mpg | mtcars$cyl,
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

xyplot(mpg ~ wt | mtcars$cyl * mtcars$gear,
       main="Scatter Plots by Cylinders and Gears",
       xlab="Car Weight", ylab="Miles per Gallon")

cloud(mpg ~ wt * qsec | mtcars$cyl,
      main="3D Scatter Plots by Cylinders")

dotplot(cyl ~ mpg | mtcars$gear,
        main="Dot Plots by Number of Gears and Cylinders",
        xlab="Miles Per Gallon")

splom(mtcars[c(1, 3, 4, 5, 6)],
      main="Scatter Plot Matrix for mtcars Data")