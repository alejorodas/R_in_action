library(dplyr)
library(rgdal)
library(tmap)
library(sp)
library(RColorBrewer)

load(file =file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))
mapa_pereira_comuna_barrio <- readOGR(file.path(getwd(),"DataSet","MapaPereiraComunaBarrioHurto"),'mapa_pereira_comuna_barrio')

# Mapa Pereira con el nombre de las Comunas
# tm_shape(mapa_pereira_comuna_barrio) +
#   tm_fill("area",title = "Area",palette ="Blues") +
#   tm_shape(mapa_pereira_comuna_barrio) +
#   tm_borders() + 
#   tm_text(text="nmbr_cm",size = 0.6)

#CAMBIAR NOMBRE DEL REGISTRO
# hurto_pereira_barrio_comuna_data_set_tbl <- hurto_pereira_barrio_comuna_data_set_tbl %>%
#   mutate(nombre_comuna=replace(nombre_comuna,nombre_comuna=="COMUNA JARDIN","COMUNA EL JARDIN"))
# 
# save(hurto_pereira_barrio_comuna_data_set_tbl, ascii = TRUE,
#      file = file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))

hurto_sabado_tarde <- hurto_pereira_barrio_comuna_data_set_tbl %>%
  select(dia_formato,nombre_comuna,barrio,hurto_interval,hora_format_POSIXct) %>%
  filter(dia_formato=="Sabado", hurto_interval=="12-18") %>%
  group_by(nombre_comuna) %>%
  summarise(num_hurto=n()) %>%
  arrange(desc(num_hurto))

mapa_pereira_comuna_barrio$nombre <- toupper(mapa_pereira_comuna_barrio$nombre)

mapa_hurto_pereira_comuna_barrio <- merge(mapa_pereira_comuna_barrio,hurto_sabado_tarde,by.x="nombre", by.y="nombre_comuna",  duplicateGeoms=TRUE)

tm_shape(mapa_hurto_pereira_comuna_barrio) +
  tm_fill("num_hurto",title = "Cantidad Hurtos",palette ="Blues",
          textNA = "No Reportado",style = "pretty",n=6) +
  tm_shape(mapa_hurto_pereira_comuna_barrio) +
  tm_borders() + 
  tm_text(text="nmbr_cm",size = 0.6) +
  tm_layout(legend.title.size = 0.8)
