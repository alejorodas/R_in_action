par(mfrow=c(2, 1))
library(chron)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")


data.set.hurto$parte.dia[(data.set.hurto$hora.hurto >= '00:00:00') & (data.set.hurto$hora.hurto <= '06:00:00')] <- "Madrugada"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '06:00:00') & (data.set.hurto$hora.hurto <= '12:00:00')] <- "Mañana"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '12:00:00') & (data.set.hurto$hora.hurto <= '18:00:00')] <- "Tarde"
data.set.hurto$parte.dia[(data.set.hurto$hora.hurto > '18:00:00') & (data.set.hurto$hora.hurto <= '23:59:00')] <- "Noche"

myvars <- names(data.set.hurto) %in% c("Hora","MARCA","Departamento")

data.set.mujeres <- subset(data.set.hurto, Sexo == "FEMENINO" ,
                           select = !myvars)
table.data.set.mujeres <- xtabs(~ parte.dia+Dia, data=data.set.mujeres)

par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))
barplot(table.data.set.mujeres[,c("Lunes","Martes", "Miercoles", "Jueves", "Viernes","Sabado","Domingo")]
        ,beside = T
        ,main = "Cantidad Celulares Robabos a Mujeres por Intervalo del Día Durante la Semana"
        ,legend = T
        ,ylab = "Total Celulares Robados"
        ,args.legend = list(x = "topright", bty = "n", inset=c(-0.22, 0.13))
)
table.data.set.mujeres
box()

par(xpd = TRUE)
par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))
table.jornada <- table.data.set.mujeres[c("Mañana","Tarde"),c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")]
table.jornada

par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))

plot(table.jornada[c("Mañana"),], type = "b",xaxt = "n", 
     ylab = "Total Celulares Robados",
     xlab = "Días de la Semana",
     main = "Total Hurto de Celulares a Mujeres en el Intervalo de la Mañana y Tarde",
     col="red",
     pch=15, 
     lty=1)
par(xpd = TRUE)
lines(table.jornada[c("Tarde"),], type="b", pch=17, lty=2, col="blue")
legend("topright", 
       inset=c(-.26,0.1),
       title="Intervalo del Día", 
       c("Mañana","Tarde"),
       lty=c(1, 2), 
       pch=c(15, 17), 
       col=c("red", "blue"))



axis(1,at=1:7,labels = c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"))


# data.set.hombre <- subset(data.set.hurto, Sexo == "MASCULINO",
#                           select = !myvars)
# 
# table.data.set.hombre <- xtabs(~ parte.dia+Dia, data=data.set.hombre)
# 
# barplot(table.data.set.hombre[,c("Lunes","Martes", "Miercoles", "Jueves", "Viernes","Sabado","Domingo")]
#         ,beside = T
#         ,main = "Cantidad Celulares Robabos a Hombres por Intervalo del Día"
#         ,legend = T
#         ,ylab = "Total Celulares Robados"
#         ,args.legend = list(x = "topright", bty = "n", inset=c(-0.22, 0.13))
# )
# table.data.set.hombre
# box()