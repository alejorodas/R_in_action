mydata.tsv <- read.delim("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/Hurto_2.tsv"
                         ,col.names = c("Fecha", "Departamento",  "Municipio", "Dia", "Hora",  "Barrio",  "Zona",  "ClaseSitio",  "ArmaEmpleada",  "MovilAgresor" , "MovilVictima",  "Edad",  "Sexo",  "EstadoCivil", "PaisNacimiento",
                                         "ClaseEmpleado", "Profesion", "Escolaridad", "CodigoDANE",  "CLASE", "MARCA", "LINEA", "Cantidad")
                         ,encoding = "UTF-8"
                         ,stringsAsFactors = FALSE)



data.set.hurto <- mydata.tsv[c("Dia","Hora","MARCA","Sexo","Departamento")]

save(data.set.hurto,
     file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")

load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")