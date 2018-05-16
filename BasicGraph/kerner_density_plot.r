# kernel density estimation is a nonparametric method for estimating the probability density 
# function of a random variable. Although the mathematics are beyond the scope of this text, 
# in general kernel density plots can be an effective way to view the distribution of a 
# continuous variable.

par(mfrow=c(2,1))
d <- density(mtcars$mpg)
plot(d)

d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
rug(mtcars$mpg, col="brown")