library(chron)

load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

hurto.pereira$tiempo.num <- substr(hurto.pereira$hora.hurto, 12, 19)
myvars <- names(hurto.pereira) %in% c("Hora","MARCA","Departamento","Municipio","Sexo","hora.hurto")

# SABADO JORNADA NOCHE 18-00
data.set.hurto.noche <- subset(hurto.pereira, hurto.inverval == "18-00" & Dia == "Sabado", select = !myvars)
table.set.hurto.noche <- xtabs(~ Dia+tiempo.num, data=data.set.hurto.noche)
mytable <- with(data.set.hurto.noche, table(time))

plot(mytable, type = "b", las=2,
     ylab = "Total Celulares Robados",
     xlab = "",
     main = "Hurto de Celulares en Jornadas Tarde y Noche en el D??a S??bado",
     col="red",
     pch=15,
     lty=1)
par(xpd = TRUE)

# SABADO JORNADA TARDE 12-18
data.set.hurto.tarde <- subset(hurto.pereira, hurto.inverval == "12-18" & Dia == "Sabado", select = !myvars)
table.set.hurto.tarde <- xtabs(~ Dia+tiempo.num, data=data.set.hurto.tarde)
mytable <- with(data.set.hurto.tarde, table(time))

lines(mytable, type="b", pch=17, lty=2, col="blue")

legend("topleft", 
       inset=c(.24,0.1),
       title="Jornada", 
       c("Noche","Tarde"),
       lty=c(1, 2), 
       pch=c(15, 17), 
       col=c("red", "blue"))