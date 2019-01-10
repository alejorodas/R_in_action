library(dplyr)
library(tidyverse)
load(file =file.path(getwd(),"DataSet","hurto_colombia_data_set_tbl.Rda"))

dias_transformar <- function(dia) {
  if(dia == "Mi\303\251rcoles") {
    return("Miercoles")
  }
  if(dia == "S\303\241bado") {
    return("Sabado")
  }
  return(as.character(dia))
}


hurto_colombia_data_set_tbl$dia_formato <- sapply(hurto_colombia_data_set_tbl$dia,dias_transformar)
hurto_colombia_data_set_tbl$dia_formato <- factor(hurto_colombia_data_set_tbl$dia_formato,
                                                  order=TRUE,levels = c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"))
hurto_colombia_data_set_tbl$hurto_interval <- factor(hurto_colombia_data_set_tbl$hurto_interval,
                                                order = TRUE,levels = c("00-06","06-12", "12-18", "18-00"))

save(hurto_colombia_data_set_tbl, ascii = TRUE,
     file = file.path(getwd(),"DataSet","hurto_colombia_data_set_tbl.Rda"))

# Create data set for only Pereira
hurto_pereira_data_set <- hurto_colombia_data_set_tbl %>%  select("dia_formato","marca","sexo","departamento","municipio","barrio","hora_hurto","hora_hurto_time","hurto_interval") %>%
  filter(municipio == "PEREIRA (CT)")


save(hurto_pereira_data_set, ascii = TRUE,
     file = file.path(getwd(),"DataSet","hurto_pereira_data_set_tbl.Rda"))