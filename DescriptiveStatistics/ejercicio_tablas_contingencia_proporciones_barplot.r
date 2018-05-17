library(vcd)
head(Arthritis)

options(digits=2)
par(mfrow=c(2,2))

# Improved vs Treatment
# xtabs() function allows you to create a contingency table using formula style input
# mytable <- xtabs(~ A + B, data=mydata). where A is the row variable, and B is the column variable
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable

barplot(mytable, beside = T, main = "Tipo de Tratamiento vs Tipo de Mejoramiento",
        legend = T)

proporciones <- prop.table(mytable)

barplot(proporciones * 100, beside = T, main = "Tipo de Tratamiento vs Tipo de Mejoramiento",
        legend = T)

# Treatment vs Improved
mytable2 <- xtabs(~ Improved+Treatment, data=Arthritis)
mytable2
barplot(prop.table(mytable2)*100, beside = T, main = "Tipo de Mejoramiento vs Tipo de Tratamiento",
        legend = T)

# La probabilidad de cada fila tener cada columna prop.table(mytable, 1). Es decir,
# cual es la probabilidad de que un tratamiento con Placebo tenga un mejoramiento de
# Ninguno (None), Alguno (Some) y Marcado (Marked) 

prop.table(mytable, 1)

# La probabilidad de cada columna tenga cada fila prop.table(mytable, 2). Es decir,
# cual es la probabilidad relacionada Mejoramiento y la
# raz??n sea un Tratamiento con Placebo y Treated
prop.improved.treatment <- prop.table(mytable, 2)*100
prop.improved.treatment
barplot(prop.improved.treatment, ylab = "Porcentaje", xlab = "Mejoramiento",
        legend = T,beside = T)

