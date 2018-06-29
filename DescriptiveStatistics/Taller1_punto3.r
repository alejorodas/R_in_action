attach(USArrests)

library(modeest)
par(mfrow=c(3,1))

#Calcular moda
moda=mlv(Assault, method = "mfv")[1]
moda

hist(Assault, main = "Density Histogram of Assault", freq=FALSE,
     xlab = "Assault", breaks = 12)
lines(density(Assault), col="blue", lwd=2)
abline(v=moda, col = "red", lty = 2)


# Plot
plot(UrbanPop,Assault,main="UrbanPop vs Assault")
population.median <- median(UrbanPop)

abline(lm(Assault~UrbanPop),col=4)
lines(lowess(UrbanPop,Assault),col="red",lwd=2,lty=2)

points(UrbanPop[UrbanPop >= population.median],
       Assault[UrbanPop >= population.median],col="green",pch=20 )
plot.new()
legend("top", paste(c("Media poblacional igual o superior a "),population.median),
       pch=c(16, 16), col=c("green", "red"))