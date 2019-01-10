library(ggplot2)
library(dplyr)

load(file =file.path(getwd(),"DataSet","hurto_pereira_data_set_tbl.Rda"))

heat_map <- hurto_pereira_data_set %>% group_by(dia_formato,hurto_interval) %>%
  summarise(count=n())

ggplot(heat_map,aes(x=dia_formato,y=hurto_interval)) +
  geom_tile(aes(fill =  count)) +
  scale_x_discrete("Dia de la Semana", expand = c(0,0)) +
  scale_y_discrete("Hora del Dia", expand = c(0,-2)) +
  scale_fill_gradient("Cantidad de Hurtos",space = "Lab",
          low = "#56B1F7", high = "#132B43",na.value = "grey50") +
  ggtitle("Hurtos por Dia y Hora en la Semana") +  
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_line(colour = NA), panel.grid.minor = element_line(colour = NA))