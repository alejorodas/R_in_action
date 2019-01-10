# Generate a time series line geometry diagram to show the Afertoon and Night

library(ggplot2)
library(dplyr)

load(file =file.path(getwd(),"DataSet","hurto_pereira_data_set_tbl.Rda"))

# new_data_set <- hurto_pereira_data_set %>%
#   select(dia_formato,hora_hurto,hora_hurto_time,hurto_interval)
# 
# new_data_set$hora_format_POSIXct <- as.POSIXct(new_data_set$hora_hurto, format="%H:%M:%S")

# Numbers of thefts on Friday Evening
hurtos_tarde_sabado <- hurto_pereira_data_set %>% 
  select(dia_formato,hora_hurto,hurto_interval,hora_format_POSIXct) %>%
  filter(dia_formato=="Sabado", hurto_interval=="12-18"| hurto_interval=="18-00") %>%
  group_by(hora_format_POSIXct,hurto_interval) %>%
  summarise(num_hurtos=n()) %>%
  arrange(hora_format_POSIXct)

ggplot(hurtos_tarde_sabado,aes(hora_format_POSIXct,num_hurtos)) +
  geom_line(aes(color=hurto_interval)) +
  xlab("Hora del Dia")+
  #labs(x="Hora del Dia",y="Cantidad de Hurtos") +
  scale_y_continuous("Cantidad de Hurtos",breaks = c(3,6,9,13)) +
  scale_color_discrete("Jornada",labels=c("Tarde","Noche")) +
  ggtitle("Hurtos Dia Sabado Jornada Tarde (12-18) Noche (18-00)") +
  theme(plot.title = element_text(hjust = 0.5))