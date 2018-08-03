par(mfrow=c(2, 1))
library(chron)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")


data.set.hurto$parte.dia[(data.set.hurto$hora.hurto >= '00:00:00') & (data.set.hurto$hora.hurto <= '06:00:00')] <- "Madrugada"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '06:00:00') & (data.set.hurto$hora.hurto <= '12:00:00')] <- "Manana"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '12:00:00') & (data.set.hurto$hora.hurto <= '18:00:00')] <- "Tarde"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '18:00:00') & (data.set.hurto$hora.hurto <= '23:59:00')] <- "Noche"

data.set <- xtabs(~ parte.dia+Dia, data=data.set.hurto)

# Selecting (keeping) variables
data.set <- data.set[,c("Viernes","Sabado","Domingo")]

data.set
par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))
barplot(data.set 
        ,beside = T
        ,main = "Cantidad Celulares Robabos Segun Dia de la Semana y Parte del Dia"
        ,legend = T
        ,ylab = "Total Celulares Robados"
        ,args.legend = list(x = "topright", bty = "n", inset=c(-0.32, 0.13))
)
box()

# Excluding (dropping) variables
myvars <- names(data.set.hurto) %in% c("Hora","MARCA","Departamento")
newdata <- data.set.hurto[!myvars]

newdata2 <- subset(data.set.hurto, Sexo == "FEMENINO",select = !myvars)
data.set2 <- xtabs(~ parte.dia+Dia, data=newdata2)

data.set.mujeres <- subset(data.set.hurto, Sexo == "FEMENINO" & 
                     (Dia == "Viernes" | Dia == "Sabado" | Dia == "Domingo" ),
                   select = !myvars)

table.data.set.mujeres <- xtabs(~ parte.dia+Dia, data=data.set.mujeres)

par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))
barplot(table.data.set.mujeres[,c("Viernes","Sabado","Domingo")]
        ,beside = T
        ,main = "Cantidad Celulares Robabos a Mujeres por Intervalo del D??a"
        ,legend = T
        ,ylab = "Total Celulares Robados"
        ,args.legend = list(x = "topright", bty = "n", inset=c(-0.32, 0.13))
)
table.data.set.mujeres
box()


data.set.hombre <- subset(data.set.hurto, Sexo == "MASCULINO" & 
                             (Dia == "Viernes" | Dia == "Sabado" | Dia == "Domingo" ),
                           select = !myvars)

table.data.set.hombre <- xtabs(~ parte.dia+Dia, data=data.set.hombre)

barplot(table.data.set.hombre[,c("Viernes","Sabado","Domingo")]
        ,beside = T
        ,main = "Cantidad Celulares Robabos a Hombres por Intervalo del D??a"
        ,legend = T
        ,ylab = "Total Celulares Robados"
        ,args.legend = list(x = "topright", bty = "n", inset=c(-0.32, 0.13))
)
table.data.set.hombre
box()
