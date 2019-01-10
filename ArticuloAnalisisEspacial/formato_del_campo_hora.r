# In this file we format the hora field to an appropiate format
library(tidyverse)
library(dplyr)
library(chron)
# Read data set
load(file =file.path(getwd(),"DataSet","hurto_colombia_data_set.Rda"))

# Just simple do some format date field
hora_format <- as.POSIXct(hurto_colombia_data_set$hora, format="%m/%d/%Y %I:%M:%S %p")
hurto_colombia_data_set$hora_hurto <- format(hora_format, "%H:%M:%S")
# This column is created for store time fields for time series analysis
hurto_colombia_data_set$hora_hurto_time <- times(format(hora_format, "%H:%M:%S"))

# Create intervals
time.tag <- chron(times=c('00:00:00','06:00:00','12:00:00','18:00:00','23:59:00'))
hurto_colombia_data_set$hurto_interval <- cut(hurto_colombia_data_set$hora_hurto_time,breaks = time.tag, 
                                     labels = c("00-06","06-12", "12-18", "18-00"),
                                     include.lowest = TRUE)

hurto_colombia_data_set <- hurto_colombia_data_set %>% 
  select("dia","marca","sexo","departamento","municipio","barrio","hora_hurto","hora_hurto_time","hurto_interval")

hurto_colombia_data_set_tbl <- as_tibble(hurto_colombia_data_set)

save(hurto_colombia_data_set_tbl, ascii = TRUE,
     file = file.path(getwd(),"DataSet","hurto_colombia_data_set_tbl.Rda"))
