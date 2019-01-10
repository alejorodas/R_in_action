load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.comuna.barrio.Rda")
myvars <- names(hurto.pereira.comuna.barrio) %in% c("Hora","MARCA","Departamento","Municipio","Sexo","hora.hurto", "Zona", "time", "Barrio")

data.set.hurto.noche <- subset(hurto.pereira.comuna.barrio, (hurto.inverval == "06-12" | hurto.inverval == "18-00") & 
                                 (nombre_comuna=="COMUNA UNIVERSIDAD" | nombre_comuna == "COMUNA BOSTON") &
                                 (Dia == "Martes" | Dia == "Viernes" | Dia == "Sabado"),
                               select = !myvars)

table.set.hurto.noche <- xtabs(~ nombre_comuna+hurto.inverval, data=data.set.hurto.noche)
data.frame.hurto.noche <- as.data.frame(table.set.hurto.noche)
data.set.hurto.noche <- subset(data.frame.hurto.noche, 
                                 (nombre_comuna=="COMUNA UNIVERSIDAD" | nombre_comuna == "COMUNA BOSTON") )

colnames(data.set.hurto.noche)[3] <- "cantidad.hurto"
data.set.hurto.noche <- data.set.hurto.noche[data.set.hurto.noche$cantidad.hurto >= 1,]

x <- data.set.hurto.noche[order(data.set.hurto.noche$cantidad.hurto),]
x$color[x$nombre_comuna=="COMUNA UNIVERSIDAD"] <- "red"
x$color[x$nombre_comuna == "COMUNA BOSTON"] <- "blue"

dotchart(x$cantidad.hurto,
         cex=.7,
         groups = x$hurto.inverval,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Hurtos por Comuna",
         ylab="Comuna",
         xlab = "Cantidad Hurto")

