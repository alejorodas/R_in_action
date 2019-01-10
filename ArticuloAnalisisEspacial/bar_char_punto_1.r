library(ggplot2)
library(dplyr)

load(file =file.path(getwd(),"DataSet","hurto_pereira_data_set_tbl.Rda"))

heat_map <- hurto_pereira_data_set %>% select(dia_formato,hurto_interval)

intervalo_hurto <- hurto_pereira_data_set %>% group_by(hurto_interval)

ggplot(heat_map,aes(x=dia_formato)) +
  geom_bar() +
  xlab("Dia de la Semana") +
  ylab("Cantidad de Hurtos") +
  ggtitle("Cantidad de Hurtos por Dia de la Semana") +
  theme(plot.title = element_text(hjust = 0.5))
  

ggplot(intervalo_hurto,aes(x=hurto_interval)) +
  geom_bar() +
  xlab("Jornada del dia") +
  ylab("Cantidad de Hurtos") +
  ggtitle("Hurtos por Jornada del Dia") +
  theme(plot.title = element_text(hjust = 0.5))