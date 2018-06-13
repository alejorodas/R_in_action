library(modeest)
par(mfrow=c(2,1))

#Calcular moda
moda=mlv(USArrests$Assault, method = "mfv")[1]

hist(USArrests$Assault, main = "Density Histogram of Assault", freq=FALSE,
     xlab = "Assault")
lines(density(USArrests$Assault), col="blue", lwd=2)
abline(v=moda, col = "red", lty = 2)


hist(USArrests$Assault, main = "Density Histogram of Assault", freq=FALSE,
     xlab = "Assault", breaks = 12)
lines(density(USArrests$Assault), col="blue", lwd=2)
abline(v=moda, col = "red", lty = 2, cex = 3)

