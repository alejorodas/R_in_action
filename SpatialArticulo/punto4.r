library(rgdal)
library(tmap)
library(leaflet)
library("sp")
load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.comuna.barrio.Rda")
OA.Shape.pereira.comuna.barrio.hurto <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/MapaPereiraComunaBarrioHurto/OA.Shape.pereira.comuna.barrio.hurto.shp")

qtm(OA.Shape.pereira.comuna.barrio.hurto , fill = "area")

pereira.comuna.boston <- OA.Shape.pereira.comuna.barrio.hurto$nombre == "Comuna Boston"

shape.pereira <- OA.Shape.pereira.comuna.barrio.hurto[which(pereira.comuna.boston), ]

tm_shape(OA.Shape.pereira.comuna.barrio.hurto)  + tm_borders(alpha=.4) +
  tm_shape(OA.Shape.pereira.comuna.barrio.hurto[which(pereira.comuna.boston), ]) + 
  tm_fill("area", style = "quantile", n = 7, palette = "Reds")

tm_shape(OA.Shape.pereira.comuna.barrio.hurto)  + tm_borders(alpha=.4) +
  tm_fill("area", style = "quantile", n = 7, palette = "Reds")