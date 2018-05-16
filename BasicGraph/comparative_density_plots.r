par(lwd=2)
library(sm)
attach(mtcars)

# Create grouping factor
cyl.f <- factor(cyl, levels= c(4,6,8),
              labels = c("4 cylinder", "6 cylinder",
                         "8 cylinder"))

# Plot densities
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

# Add legend via mouse click
colfill<-c(2:(1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)

detach(mtcars)