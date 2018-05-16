#Histograms display the distribution of a continuous variable
#The option freq=FALSE creates a plot based on probability densities rather than frequencies.
#The breaks option controls the number of bins. 

par(mfrow=c(2,2))

# Simple histogram
hist(mtcars$mpg)

#With specified bins and color
hist(mtcars$mpg,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")

#With rug plot and frame
hist(mtcars$mpg,
     freq=FALSE,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Histogram, rug plot, density curve")

rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col="blue", lwd=2)