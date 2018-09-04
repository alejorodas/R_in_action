library(rgdal)
lnd <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/mpio/mpio.shp")

# Aca se muestra el mapa de toda Colombia
#plot(lnd)
# head(lnd@data,n=2)

# Aca se muestra el mapa del Departamento de Risaralda
risaralda_datos <- lnd@data[lnd$NOMBRE_DPT == "RISARALDA",]
risaralda_municipios <- lnd$NOMBRE_DPT == "RISARALDA"
plot(lnd[risaralda_municipios,],  col = "lightgrey")