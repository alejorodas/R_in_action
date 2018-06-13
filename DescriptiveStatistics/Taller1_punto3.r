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
abline(lm(Assault~UrbanPop),col=4)
points(UrbanPop[Assault >= 100 & Assault <= 150], 
       Assault[Assault >= 100 & Assault <= 150],col="green",pch=20 )
points(UrbanPop[Assault >= 225 & Assault <= 275], 
       Assault[Assault >= 225 & Assault <= 275],col="red",pch=20 )

plot.new()
legend("top", c("Asaltos entre 100 y 150","Asaltos entre 225 y 275"),
       pch=c(16, 16), col=c("green", "red"))