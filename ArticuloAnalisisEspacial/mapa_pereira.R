library(rgdal)
library(tmap)
library(sp)
library(RColorBrewer)

load(file =file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))
barrios.comunas <- read_csv2(file.path(getwd(),"DataSet","comunas_barrios_pereira.csv"),
                             col_types = cols(
                               nombre_comuna = col_character(),
                               barrio = col_character()
                             ))

Output.Pereira <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/comunas/Comunas_del_municipio_de_Pereira.shp")

Mapa.pereira <- Output.Pereira[,c("nombre","area","Shape__Are","Shape__Len")]

barrios.comunas$nombre_comuna <- as.factor(barrios.comunas$nombre_comuna)

# Combina el ShapeFile de las Comunas en Pereira con la lista de Barrios/Comunas
mapa_pereira_comuna_barrio <- merge(Mapa.pereira, barrios.comunas, by.x="nombre", by.y="nombre_comuna",  duplicateGeoms=TRUE)

mapa_pereira_comuna_barrio$nombre_comuna <- gsub("Comuna","",mapa_pereira_comuna_barrio$nombre)

# Mapa Pereira con el nombre de las Comunas
tm_shape(mapa_pereira_comuna_barrio) +
  tm_fill("area",title = "Area",palette ="Blues") +
  tm_shape(mapa_pereira_comuna_barrio) +
  tm_borders() + 
  tm_text(text="nombre_comuna",size = 0.6)

# Guarda shape file Mapa de Comunas de Pereira asociado con los hurtos
writeOGR(mapa_pereira_comuna_barrio,
         file.path(getwd(),"DataSet","MapaPereiraComunaBarrioHurto"),
         'mapa_pereira_comuna_barrio',
        "ESRI Shapefile")