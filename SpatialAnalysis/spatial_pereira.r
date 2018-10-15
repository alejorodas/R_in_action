library(rgdal)
library(tmap)
library(leaflet)
library("sp")

load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")
load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/data_set_codigo_postal_pereira_barrios.Rda")
Output.Areas <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/comunas/Comunas_del_municipio_de_Pereira.shp")

data.set.pereira <- data.set.hurto[which(data.set.hurto$Municipio == "PEREIRA (CT)" ),]



# Aca se muestra el mapa del Departamento de Risaralda
pereira.comunas <- Output.Areas$nombre == "Comuna Boston"
# plot(Output.Areas,  col = "lightgrey")
# plot(Output.Areas[which(pereira.comunas), ], col = "turquoise", add = TRUE)

# barrios.pereira <- data.set.codigo.postal.pereira.barrios[3,][, c(4,5)]
# barrios.pereira$longitud_centroide
# barrios.pereira$latitud_centroide

# barrios.pereira$longitud_centroide <- as.numeric(barrios.pereira$longitud_centroide)
# barrios.pereira$latitud_centroide <- as.numeric(barrios.pereira$latitud_centroide)


tm_shape(Output.Areas[which(pereira.comunas), ]) + tm_borders(alpha=.4) +
  tm_fill("area", style = "quantile", n = 7, palette = "Reds")

tm_shape(Output.Areas)  + tm_borders(alpha=.4) +
  tm_shape(Output.Areas[which(pereira.comunas), ]) + 
  tm_fill("area", style = "quantile", n = 7, palette = "Reds")