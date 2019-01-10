# SABADO JORNADA TARDE 12-18
library(chron)

load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

hurto.pereira$tiempo.num <- substr(hurto.pereira$hora.hurto, 12, 19)
myvars <- names(hurto.pereira) %in% c("Hora","MARCA","Departamento","Municipio","Sexo","hora.hurto")

data.set.hurto.tarde <- subset(hurto.pereira, hurto.inverval == "12-18" & Dia == "Sabado", select = !myvars)
table.set.hurto.tarde <- xtabs(~ Dia+tiempo.num, data=data.set.hurto.tarde)
mytable <- with(data.set.hurto.tarde, table(time))

plot(mytable, type = "b", las=2,
     ylab = "Total Celulares Robados",
     xlab = "",
     main = "Hurto de Celulares en la Tarde en el D??a S??bado",
     col="red",
     pch=15,
     lty=1)
