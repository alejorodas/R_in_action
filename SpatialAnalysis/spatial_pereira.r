library(rgdal)
library(tmap)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")
Output.Areas <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/comunas/Comunas_del_municipio_de_Pereira.shp")

#data.set.pereira <- data.set.hurto[which(data.set.hurto$Municipio == "PEREIRA (CT)" & data.set.hurto$hurto.inverval == "Tarde"),]
# Aca se muestra el mapa del Departamento de Risaralda
pereira.comunas <- Output.Areas$nombre == "Comuna Boston"
plot(Output.Areas,  col = "lightgrey")
plot(Output.Areas[which(pereira.comunas), ], col = "turquoise", add = TRUE)

