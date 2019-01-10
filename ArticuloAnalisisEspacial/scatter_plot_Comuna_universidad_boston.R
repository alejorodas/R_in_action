library(ggplot2)
library(dplyr)
library(scales)
load(file =file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))


universidad_boston_viernes <- hurto_pereira_barrio_comuna_data_set_tbl %>%
  filter( dia_formato=="Viernes", hurto_interval=="12-18" | hurto_interval=="18-00",
         nombre_comuna=="COMUNA UNIVERSIDAD"| nombre_comuna=="COMUNA BOSTON") %>%
  group_by(hora_format_POSIXct,nombre_comuna) %>%
  select(hora_format_POSIXct,barrio,nombre_comuna,hora_hurto) %>%
  arrange(hora_format_POSIXct)


ggplot(universidad_boston_viernes) +
  geom_point(aes(hora_format_POSIXct,barrio,color=nombre_comuna)) +
  scale_color_discrete("Nombre Comuna") +
  ylab("Barrio") +
  scale_x_datetime("Hora Hurto") +
  ggtitle("Hurtos Dia Viernes Jornada Tarde - Noche Comunas Universidad-Boston") +
  theme(plot.title = element_text(hjust = 0.5))





universidad_boston_sabado <- hurto_pereira_barrio_comuna_data_set_tbl %>%
  filter( dia_formato=="Sabado", hurto_interval=="12-18" | hurto_interval=="18-00",
          nombre_comuna=="COMUNA UNIVERSIDAD"| nombre_comuna=="COMUNA BOSTON") %>%
  group_by(hora_format_POSIXct,nombre_comuna) %>%
  select(hora_format_POSIXct,barrio,nombre_comuna,hora_hurto) %>%
  arrange(hora_format_POSIXct)

ggplot(universidad_boston_sabado) +
  geom_point(aes(hora_format_POSIXct,barrio,color=nombre_comuna)) +
  scale_color_discrete("Nombre Comuna") +
  ylab("Barrio") +
  scale_x_datetime("Hora Hurto") +
  ggtitle("Hurtos Dia Sabado Jornada Tarde - Noche Comunas Universidad-Boston") +
  theme(plot.title = element_text(hjust = 0.5))


# universidad <- hurto_pereira_barrio_comuna_data_set_tbl %>%
#   filter(dia_formato=="Sabado" | dia_formato=="Viernes", hurto_interval=="12-18" | hurto_interval=="18-00",
#          nombre_comuna=="COMUNA UNIVERSIDAD") %>%
#   group_by(hora_format_POSIXct,nombre_comuna) %>%
#   summarise(num_hurto=n()) %>%
#   select(hora_format_POSIXct,nombre_comuna,num_hurto)
# 

  

