# In this files we read our data set and set the column names to an acorrding format 

library(dplyr)

path<-file.path(getwd(),"DataSet","Hurto.tsv")
column_names <- c("fecha","departamento","municipio","dia","hora","barrio","zona",
                  "claseDeSitio","armaEmpleada","movilAgresor","movilVictima","edad","sexo","estadoCivil",
                  "paisNacimiento","claseEmpleo","profesion","escolaridad","codigoDANE","clase","marca","linea","cantidad")

hurto.tsv <- read.delim(path, col.names = column_names,stringsAsFactors = TRUE)

hurto_colombia_data_set <- hurto.tsv %>% select("dia","hora","marca","sexo","departamento","municipio","barrio") %>%
    filter(municipio == "PEREIRA (CT)")

hurto_colombia_data_set_tbl_2 <- as_tibble(hurto_colombia_data_set)

# Create data set for only Pereira
save(hurto_colombia_data_set_tbl_2, ascii = TRUE,
     file = file.path(getwd(),"DataSet","hurto_pereira_barrio_data_set_tbl.Rda"))