library(rgdal)
library(tmap)
library(leaflet)
library("sp")

load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.comuna.barrio.Rda")
OA.Shape.pereira.comuna.barrio <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/MapaPereiraComunaBarrio/OA.Shape.Mapa.pereira.comuna.barrio.shp")
myvars <- names(hurto.pereira.comuna.barrio) %in% c("Hora","MARCA","Departamento","Municipio","Sexo","hora.hurto", "Zona")

# SABADO JORNADA NOCHE 18-00
data.set.hurto.noche <- subset(hurto.pereira.comuna.barrio, hurto.inverval == "18-00" & Dia == "Sabado", select = !myvars)
table.set.hurto.noche <- xtabs(~ nombre_comuna+tiempo.num, data=data.set.hurto.noche)
numero.hurto.por.comuna <- with(data.set.hurto.noche, table(nombre_comuna))

# SABADO JORNADA TARDE 12-18
data.set.hurto.tarde <- subset(hurto.pereira.comuna.barrio, hurto.inverval == "12-18" & Dia == "Sabado", select = !myvars)
table.set.hurto.tarde <- xtabs(~ nombre_comuna+tiempo.num, data=data.set.hurto.tarde)
numero.hurto.por.comuna <- with(data.set.hurto.tarde, table(nombre_comuna))

data.frame.numero.hurto.por.comuna <- as.data.frame(numero.hurto.por.comuna)
# Renombrar columnas
colnames(data.frame.numero.hurto.por.comuna)[2] <- "cantidad.hurto"

OA.Shape.pereira.comuna.barrio.hurto <- merge(OA.Shape.pereira.comuna.barrio, data.frame.numero.hurto.por.comuna, by="nombre", by.y="nombre_comuna")

tm_shape(OA.Shape.pereira.comuna.barrio.hurto)  + 
  tm_fill("cantidad.hurto", style = "pretty", palette = "Reds", textNA = "Sin Hurto") +
  tm_borders(alpha=.4)

data.frame.numero.hurto.por.comuna[order(data.frame.numero.hurto.por.comuna$ cantidad.hurto),]
