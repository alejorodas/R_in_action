par(mfrow=c(2,1))
custdata <- read.table('/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/PracticalDataScience/custdata.tsv',header=T,sep='\t')
summary(custdata$age)

hist(custdata$age, main = "Density Histogram of Age", freq=FALSE,
     xlab = "Age")
lines(density(custdata$age), col="blue", lwd=2)
abline(v=moda, col = "red", lty = 2)

d <- density(custdata$age)
plot(d)

summary(Age)