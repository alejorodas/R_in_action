library(vcd)
head(Arthritis)
options(digits=2)
#par(mfrow=c(2,2))

# VAMOS A CREAR DIAGRAMAS DE BARRAS

# Utilizando el paquete Arthritis realizar un analisis que permita:
# Comparar Sexo vs Tipo de tratamiento (variables categoricas)
# 
mytable <- xtabs(~ Sex+Treatment, data=Arthritis)
mytable
barplot(mytable, beside = T, main = "Tipo de tratamiento vs sexo",
        legend = T, xlab = "Tratamiento", ylab = "Sexo")

# Comparar el Mejoramiento (Improved) que hay entre hombres y mujeres
tabla.sex.improved <- xtabs(~ Sex+Improved, data=Arthritis)
tabla.sex.improved
barplot(tabla.sex.improved, beside = T, main = "Tipo de tratamiento vs sexo",
        legend = T, xlab = "Tratamiento", ylab = "Sexo")


# VAMOS A GENERAR TABLAS DE CONTINGENCIA UTILIZANDO prop.table(mytable)
# PARA SABER LAS PROPOCIONES QUE EXISTEN CON LA PROPORCION DE LA POBLACION QUE
# A MEJORADO A LOS TRATAMIENTOS

# Probablidad de la poblacion (hombres y mujeres) que han presentado alguna mejora
proporciones <- prop.table(tabla.sex.improved)
proporciones
proporciones.tabla.sex.improved <- prop.table(tabla.sex.improved, 2)
proporciones.tabla.sex.improved
barplot(proporciones.tabla.sex.improved * 100, ylab = "Porcentaje", xlab = "Mejoramiento",
        legend = T,beside = T)

# Saber la distribucion del tratamiento aplicado segun las edades
table.arthritis <- Arthritis[order(Arthritis$Age),]
table.arthritis
table.arthritis$color[table.arthritis$Improved=="None"] <- "red"
table.arthritis$color[table.arthritis$Improved=="Marked"] <- "blue"
table.arthritis$color[table.arthritis$Improved=="Some"] <- "darkgreen"
dotchart(table.arthritis$Age,
         cex=.7,
         pch=19,
         groups =  table.arthritis$Treatment,
         gcolor = "black",
         color = table.arthritis$color,
         ylab="Tratamiento",
         xlab = "Edad",
         main = "Edades de Pacientes vs Tipo de Tratamiento")

mytable <- xtabs(~ Improved+Treatment, data=Arthritis)
mytable


