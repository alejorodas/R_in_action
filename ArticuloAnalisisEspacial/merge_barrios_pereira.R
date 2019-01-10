library(rgdal)
library(tmap)
library(sp)
library(dplyr)
library(RColorBrewer)
library(sf)
path <- file.path(getwd(),"DataSet",
                  "Barrios_del_municipio_de_Pereira",
                  "Barrios_del_municipio_de_Pereira.shp")

load(file =file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))
mapa_barrios_pereira <- readOGR(file.path(getwd(),"DataSet","Barrios_del_municipio_de_Pereira"),"Barrios_del_municipio_de_Pereira")
st_barrio <-st_read(path)

mapa_barrios_dp <- st_barrio %>% select(Shape_Area,Shape__Are,Shape__Len,NOMBRE,COMUNA) %>%
  mutate(COMUNA = paste("COMUNA",toupper(COMUNA))) %>% 
  mutate(NOMBRE = toupper(NOMBRE)) %>% 
  filter(COMUNA == "COMUNA UNIVERSIDAD"| COMUNA == "COMUNA BOSTON")


# tm_shape(mapa_barrios_dp) +
#   tm_borders(group = "COMUNA") +
#   tm_shape(mapa_barrios_dp) +
#   tm_borders() + 
#   tm_text(text="NOMBRE",size = 0.6) +
#   tm_layout(legend.title.size = 0.8)

# Mapas para Comuna Boston - Universidad
mapa_boston <- mapa_barrios_dp %>% select(Shape_Area,Shape__Are,Shape__Len,NOMBRE,COMUNA) %>%
  filter(COMUNA == "COMUNA BOSTON")

mapa_universidad <- mapa_barrios_dp %>% select(Shape_Area,Shape__Are,Shape__Len,NOMBRE,COMUNA) %>%
  filter(COMUNA == "COMUNA UNIVERSIDAD")


# Dibujar Mapas Comuna Boston - Universidad
tm_shape(mapa_barrios_dp) +
  tm_borders() +
   tm_add_legend(type = "line", col = c("orangered","darkturquoise"), 
                 labels = c("COMUNA BOSTON","COMUNA UNIVERSIDAD"), title = "Nombre Comuna") +
  
tm_shape(mapa_boston) +
  tm_fill(col = "orangered",alpha = 0.3) +
  tm_borders() +
  
tm_shape(mapa_universidad) +
  tm_fill(col = "darkturquoise",alpha = 0.4) +
  tm_borders()

# Data set dia Viernes Jornada 12-18 y 18-00 Comuna Boston - Universidad
universidad_boston_viernes <- hurto_pereira_barrio_comuna_data_set_tbl %>%
  filter( dia_formato=="Viernes", hurto_interval=="12-18" | hurto_interval=="18-00",
          nombre_comuna=="COMUNA UNIVERSIDAD"| nombre_comuna=="COMUNA BOSTON") %>%
  group_by(nombre_comuna,barrio) %>%
  select(barrio,nombre_comuna) %>%
  summarise(num_hurto=n()) %>%
  arrange(desc(num_hurto))

mapa_universidad_boston_viernes <- left_join(mapa_barrios_dp,universidad_boston_viernes, by=c("COMUNA"="nombre_comuna"))
#semi_joins

#anti_joins
data_set_mapa_barrio <- mapa_barrios_dp %>% select(NOMBRE,COMUNA)
data_set_universidad_boston_viernes <- universidad_boston_viernes %>% select(nombre_comuna,barrio)

#st_join(data_set_mapa_barrio,data_set_universidad_boston_viernes, suffix=c("COMUNA"="nombre_comuna"),left=TRUE)  

# Data set dia Sabado Jornada 12-18 y 18-00 Comuna Boston - Universidad
universidad_boston_sabado <- hurto_pereira_barrio_comuna_data_set_tbl %>%
  filter( dia_formato=="Sabado", hurto_interval=="12-18" | hurto_interval=="18-00",
          nombre_comuna=="COMUNA UNIVERSIDAD"| nombre_comuna=="COMUNA BOSTON") %>%
  group_by(nombre_comuna,barrio) %>%
  select(barrio,nombre_comuna,hora_hurto) %>%
  summarise(num_hurto=n()) %>%
  arrange(desc(num_hurto))
