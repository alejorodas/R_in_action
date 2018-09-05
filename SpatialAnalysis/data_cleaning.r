library(VIM)
# Llamar los hurtosa celulares en Risaralda para que pueda ser mapeado
mydata.tsv <- read.delim("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/Hurto_2.tsv"
                         ,col.names = c("Fecha", "Departamento",  "Municipio", "Dia", "Hora",  "Barrio",  "Zona",  "ClaseSitio",  "ArmaEmpleada",  "MovilAgresor" , "MovilVictima",  "Edad",  "Sexo",  "EstadoCivil", "PaisNacimiento",
                                        "ClaseEmpleado", "Profesion", "Escolaridad", "CodigoDANE",  "CLASE", "MARCA", "LINEA", "Cantidad")
                         ,encoding = "UTF-8"
                         ,stringsAsFactors = TRUE)
hurto.set <- mydata.tsv[c("Dia","Hora","MARCA","Sexo","Departamento","Municipio")]

# Se escribe en el archivo hurtoset.tsv el conjunto de datos seleccionado 
write_delim(hurto.set, path = "/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurtoset.tsv",
            delim="\t", col_names = TRUE)

# Se abre el nuevo archivo hurtoset.tsv
data.set.hurto <- read.delim("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurtoset.tsv")

save(data.set.hurto, ascii = TRUE,
     file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")

# Elimina los carateres no imprimibles de la varible departamento
data.set.hurto$Departamento <- sapply(data.set.hurto$Departamento,
                                      function(departamento){gsub(pattern = "[^[:print:]]",
                                                                  replacement = "", departamento)})