library(VIM)
 # mydata <- read.table("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/Hurto_2.csv", 
 #                      header = T, sep= ";",
 #                     encoding = "UTF-8",
 #                     fill = TRUE)



# Seleccionar las variables que seran objeto de estudio
# Departamento donde ocurrio el hurto
# Sexo de la victima
# Marca del celular hurtado
# Dia del hurto
# Hora del hurto

#mydata.tsv <- read.delim("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/Hurto.tsv")
#hurto.set <- mydata.tsv[c("Día","Hora","MARCA","Sexo","Departamento")]

# Se escribe en el archivo hurtoset.tsv el conjunto de datos seleccionado 
#write_delim(hurto.set, path = "/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurtoset.tsv",
#           delim="\t", col_names = TRUE)
 
# Se abre el nuevo archivo hurtoset.tsv
data.set.hurto <- read.delim("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurtoset.tsv")

# Limpiar el campo Hora. 
# Se crean las columnas hora y parte. En la columna Parte se almacena si es AM/PM.
# En la columna hora se almacena la hora.
fix.Hour <- function(dataset) {
  for (row in 1:nrow(dataset)) {
    hora = strsplit(as.character(dataset$Hora[row]), " ")
    dataset$hora[row] <- hora[[1]][2]
    dataset$parte[row] <- hora[[1]][3]
  }
  return(dataset)
}

# Crear la exploración gráfica de variables perdidas y la summary
# summary(data.set.hurto)
# aggr(data.set.hurto, prop=FALSE, numbers=TRUE)

# Limpieza de datos
#data.set.hurto <- fix.Hour(data.set.hurto)
#save(data.set.hurto, file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/data.Rda")
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/data.Rda")
data.set.hurto