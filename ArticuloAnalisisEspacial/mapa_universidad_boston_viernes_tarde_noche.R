library(rgdal)
library(tmap)
library(sp)
library(dplyr)

load(file =file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))
mapa_barrios_pereira <- readOGR(file.path(getwd(),"DataSet","Barrios_del_municipio_de_Pereira"),"Barrios_del_municipio_de_Pereira")


mapa_barrios_pereira@data$COMUNA <- toupper(mapa_barrios_pereira@data$COMUNA)
mapa_barrios_pereira@data$NOMBRE <- toupper(mapa_barrios_pereira@data$NOMBRE)
mapa_barrios_pereira@data$COMUNA <- paste("COMUNA",mapa_barrios_pereira@data$COMUNA)

mapa_barrios_dp <- subset(mapa_barrios_pereira,COMUNA == "COMUNA UNIVERSIDAD"| COMUNA == "COMUNA BOSTON")
  
# tm_shape(mapa_barrios_dp) +
#   tm_borders()

# Data set dia Viernes Jornada 12-18 y 18-00 Comuna Boston - Universidad
universidad_boston_viernes <- hurto_pereira_barrio_comuna_data_set_tbl %>%
  filter( dia_formato=="Viernes", hurto_interval=="12-18" | hurto_interval=="18-00",
          nombre_comuna=="COMUNA UNIVERSIDAD"| nombre_comuna=="COMUNA BOSTON") %>%
  group_by(nombre_comuna,barrio) %>%
  select(barrio,nombre_comuna) %>%
  summarise(num_hurto=n()) %>%
  arrange(desc(num_hurto))


mapa_barrios_dp@data[which(mapa_barrios_dp$NOMBRE=="TULCAN II"),]$NOMBRE <- "EL TULCAN II"
mapa_barrios_dp@data[which(mapa_barrios_dp$NOMBRE=="LOS ALAMOS"),]$NOMBRE <- "ALAMOS"

 mapa_barrios_data <- mapa_barrios_dp@data
# 
# comunas <- universidad_boston_viernes %>% select(nombre_comuna,barrio)
# mapa_barrios_data <- mapa_barrios_data %>% select(COMUNA,NOMBRE)
# 
# anti_data <- anti_join(mapa_barrios_data,comunas,by=c("NOMBRE"="barrio","COMUNA"="nombre_comuna"))

#left_joins

mapa_barrios_dp@data<-left_join(mapa_barrios_dp@data,universidad_boston_viernes,by=c("COMUNA"="nombre_comuna","NOMBRE"="barrio"))

mapa_barrios_hurto <- subset(mapa_barrios_dp,num_hurto >= 1)

tm_shape(mapa_barrios_dp) +
  tm_borders() +
  tm_bubbles(size="num_hurto",col = "COMUNA",
             title.col="Nombre Comuna",
             legend.size.show = FALSE) +
  tm_shape(mapa_barrios_hurto) +  
  tm_text(text="NOMBRE",size = 0.5)

# tm_shape(mapa_barrios_dp) +
#   tm_borders() +
#    tm_bubbles(size="num_hurto",col = "COMUNA",title.col="Nombre Comuna",
#               title.size="Cantidad Hurtos") +
# tm_shape(mapa_barrios_hurto) +  
#   tm_text(text="NOMBRE",size = 0.5)

