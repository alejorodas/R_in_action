library(rgdal)
library(tmap)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")
load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

barrios.comunas <- read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/comunas_barrios_pereira.csv",
                   header = T, sep= ";",
                   encoding = "UTF-8",
                   fill = TRUE)

Output.Pereira <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/comunas/Comunas_del_municipio_de_Pereira.shp")

OA.Shape.comuna.barrio <- merge(Output.Pereira, barrios.comunas, by.x="nombre", by.y="nombre_comuna",  duplicateGeoms=TRUE)
OA.Shape.pereira.comuna.barrio.hurto <- merge(OA.Shape.comuna.barrio, hurto.pereira, by="barrio", by.y="Barrio",  duplicateGeoms=TRUE)


qtm(OA.Shape.pereira.comuna.barrio.hurto , fill = "barrio")


