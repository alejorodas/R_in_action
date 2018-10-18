load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.comuna.barrio.Rda")
myvars <- names(hurto.pereira.comuna.barrio) %in% c("Hora","MARCA","Departamento","Municipio","Sexo","hora.hurto", "Zona")

# SABADO JORNADA NOCHE 18-00
data.set.hurto.noche <- subset(hurto.pereira.comuna.barrio, hurto.inverval == "18-00" & Dia == "Sabado", select = !myvars)
numero.hurto.por.comuna <- with(data.set.hurto.noche, table(nombre_comuna))

mytable <- with(data.set.hurto.noche, table(tiempo.num))
plot(mytable, type = "b", las=2,
     ylab = "Total Celulares Robados",
     xlab = "",
     main = "Hurto de Celulares en Jornada Noche en el D??a S??bado",
     col="red",
     pch=15,
     lty=1)