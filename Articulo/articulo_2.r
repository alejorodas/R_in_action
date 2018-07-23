load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/data.Rda")

# f<-format(data.set.hurto$Hora[3], format = "%m-%d-%Y %I:%M:%S %p")
# dy <- as.POSIXct(f, format = "%m/%d/%Y %I:%M:%S %p")
# strsplit(as.character(d), " ")[[1]][2]

format.Hora <- function(dataset) {
  Hora <- format(dataset$Hora, format = "%m-%d-%Y %I:%M:%S %p")
  dataset$hora.hurto <- as.POSIXct(Hora, format = "%m/%d/%Y %I:%M:%S %p")
  return(dataset)
}

dataset <- format.Hora(data.set.hurto)