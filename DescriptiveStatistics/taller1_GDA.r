par(mfrow=c(2,2))

# Crear un Histograma de Densidad
# hist(Pima.tr$bmi, main = "Density Histogram of BMI", freq=FALSE)
# lines(density(Pima.tr$bmi), col="blue", lwd=2)


#Punto 1

hist(USArrests$Murder, main = "Density Histogram of Murder", freq=FALSE,
     xlab = "Murder")
abline(v=median(USArrests$Murder), col = "red", lty = 2)
abline(v=mean(USArrests$Murder), col = "blue")

hist(USArrests$Assault, main = "Density Histogram of Assault", freq=FALSE,
     xlab = "Assault")
abline(v=median(USArrests$Assault), col = "red", lty = 2)
abline(v=mean(USArrests$Assault), col = "blue")

hist(USArrests$Rape, main = "Density Histogram of Rape", freq=FALSE,
     xlab = "Rape")
abline(v=median(USArrests$Rape), col = "red", lty = 2)
abline(v=mean(USArrests$Rape), col = "blue")

plot.new()
legend("center", c("Mediana","Media"),
       lty=c(2, 1), col=c("red", "blue"))


#Punto 2

hist(USArrests$Murder, main = "Density Histogram of Murder", freq=FALSE,
     xlab = "Murder")
lines(density(USArrests$Murder), col="blue", lwd=2)

hist(USArrests$Assault, main = "Density Histogram of Assault", freq=FALSE,
     xlab = "Assault")
lines(density(USArrests$Assault), col="blue", lwd=2)

hist(USArrests$Rape, main = "Density Histogram of Rape", freq=FALSE,
     xlab = "Rape")
lines(density(USArrests$Rape), col="blue", lwd=2)