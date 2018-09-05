library(rgdal)
library(tmap)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")
Output.Areas <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/municipio/Municipios.shp")

# Aca se muestra el mapa del Departamento de Risaralda
risaralda_municipios <- Output.Areas$NOM_DEPART == "RISARALDA"
plot(Output.Areas[risaralda_municipios, ],  col = "lightgrey")

# risaralda_sta <- Output.Areas$NOM_MUNICI == "SANTA ROSA DE CABAL"
# plot(Output.Areas[risaralda_sta, ], col = "turquoise", add = TRUE)


data.set.risaralda <- data.set.hurto[data.set.hurto$Departamento == "RISARALDA",]
OA.Census <- merge(Output.Areas[risaralda_municipios, ], data.set.risaralda, by.x="NOM_MUNICI", by.y="Municipio",  duplicateGeoms=TRUE)


risaralda_sta_1 <- OA.Census$NOM_MUNICI == "SANTA ROSA DE CABAL"
#plot(OA.Census[which(risaralda_sta_1 ), ], col = "turquoise", add = TRUE)
qtm(OA.Census, fill = "Dia")