par(mfrow=c(2,2))

# Crear un Histograma de Densidad
hist(Pima.tr$bmi, main = "Density Histogram of BMI", freq=FALSE, breaks = 12)
lines(density(Pima.tr$bmi), col="blue", lwd=2)

# Crear un Histograma de Frecuencias
hist(Pima.tr$bmi, main = "Frecuency Histogram of BMI")

# Indentificar medidas de tendencia central (Media, mediana)
hist(Pima.tr$bmi, freq=FALSE)
abline(v=median(Pima.tr$bmi), col = "red", lty = 2)
abline(v=mean(Pima.tr$bmi), col = "red")
media = mean(Pima.tr$bmi)

paste("Media: ", mean(Pima.tr$bmi))
paste("Mediana: ", median(Pima.tr$bmi))

# Aca se usa el data set birthwt

hist(birthwt$lwt, freq=FALSE)
abline(v=median(birthwt$lwt), col = "red", lty = 2)
abline(v=mean(birthwt$lwt), col = "red")



