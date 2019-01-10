library(dplyr)
library(readr)

load(file =file.path(getwd(),"DataSet","hurto_pereira_data_set_tbl.Rda"))

barrios.comunas <- read_csv2(file.path(getwd(),"DataSet","comunas_barrios_pereira.csv"),
                             col_types = cols(
                               nombre_comuna = col_character(),
                               barrio = col_character()
                             ))

hurto_pereira_data_set$barrio <- as.character(hurto_pereira_data_set$barrio)

# Convina Barrios/Comunas con los Hurtos en Pereira
anti_hurto <-  anti_join(hurto_pereira_data_set, barrios.comunas,by="barrio")
hurto_pereira_barrio_comuna_data_set_tbl <- inner_join(hurto_pereira_data_set, barrios.comunas,by="barrio")

save(hurto_pereira_barrio_comuna_data_set_tbl, ascii = TRUE,
     file = file.path(getwd(),"DataSet","hurto_pereira_barrio_comuna_data_set_tbl.Rda"))