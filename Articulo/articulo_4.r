library(chron)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")


data.set.hurto$parte.dia[(data.set.hurto$hora.hurto >= '00:00:00') & (data.set.hurto$hora.hurto <= '06:00:00')] <- "Madrugada"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '06:00:00') & (data.set.hurto$hora.hurto <= '12:00:00')] <- "Manana"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '12:00:00') & (data.set.hurto$hora.hurto <= '18:00:00')] <- "Tarde"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '18:00:00') & (data.set.hurto$hora.hurto <= '23:59:00')] <- "Noche"

data.set <- xtabs(~ parte.dia+Dia, data=data.set.hurto)
data.set <- data.set[,c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")]

data.set
par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))
barplot(data.set 
        ,beside = T
        ,main = "Cantidad Celulares Robabos Segun Día de la Semana y Parte del Día"
        ,legend = T
        ,ylab = "Total Celulares Robados"
        ,args.legend = list(x = "topright", bty = "n", inset=c(-0.28, 0.20))
        )
box()