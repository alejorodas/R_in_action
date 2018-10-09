library(rgdal)
library(tmap)
load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.comuna.barrio.Rda")
OA.Shape.pereira.comuna.barrio.hurto <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/MapaPereiraComunaBarrioHurto/OA.Shape.pereira.comuna.barrio.hurto.shp")

qtm(OA.Shape.pereira.comuna.barrio.hurto , fill = "area")
