library(rgdal)
library(tmap)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")
load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

barrios.comunas <- read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/comunas_barrios_pereira.csv",
                   header = T, sep= ";",
                   encoding = "UTF-8",
                   fill = TRUE)

Output.Pereira <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/comunas/Comunas_del_municipio_de_Pereira.shp")
Mapa.pereira <- Output.Pereira[,c("nombre","area","Shape__Are","Shape__Len")]

Mapa.pereira$nombre <-  toupper(Mapa.pereira$nombre)

# Convina el ShapeFile de las Comunas en Pereira con la lista de Barrios/Comunas
Mapa.pereira.comuna.barrio <- merge(Mapa.pereira, barrios.comunas, by.x="nombre", by.y="nombre_comuna",  duplicateGeoms=TRUE)

# Convina Barrios/Comunas con los Hurtos en Pereira
hurto.pereira.comuna.barrio <- merge(hurto.pereira, barrios.comunas, by.x="Barrio", by.y="barrio",  duplicateGeoms=TRUE)
# Guarda Data Set de los Hurtos en Pereira asociado con las Comunas
# save(hurto.pereira.comuna.barrio, ascii = TRUE,
#      file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.comuna.barrio.Rda")


# Convina Hurtos en Pereira con el Mapa de las Comunas
OA.Shape.pereira.comuna.barrio.hurto <- merge(Mapa.pereira.comuna.barrio, hurto.pereira.comuna.barrio, by="nombre", by.y="nombre_comuna",  duplicateGeoms=TRUE)
# Guarda shape file Mapa de Comunas de Pereira asociado con los hurtos
# writeOGR(OA.Shape.pereira.comuna.barrio.hurto, 
#          "/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/MapaPereiraComunaBarrioHurto",
#          'OA.Shape.pereira.comuna.barrio.hurto', 
#         "ESRI Shapefile")


data <- as.data.frame(OA.Shape.pereira.comuna.barrio.hurto)
# # 
# # 
# qtm(OA.Shape.pereira.comuna.barrio.hurto , fill = "area")


