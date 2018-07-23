load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/data.Rda")

# f<-format(data.set.hurto$Hora[3], format = "%m-%d-%Y %I:%M:%S %p")
# dy <- as.POSIXct(f, format = "%m/%d/%Y %I:%M:%S %p")
# strsplit(as.character(d), " ")[[1]][2]

format.Hora <- function(dataset) {
  Hora <- format(dataset$Hora, format = "%m-%d-%Y %I:%M:%S %p")
  d <- as.POSIXct(Hora, format = "%m/%d/%Y %I:%M:%S %p")
  dataset$hora.hurto <- substr(d, 12, 19)
  #dataset$hora.hurto <- format(d, "%I:%M:%S")
  return(dataset)
}

dataset <- format.Hora(data.set.hurto)
time.tag <- chron(times=c('00:00:00','06:00:00','12:00:00','18:00:00','23:59:00'))
hurto.inverval <- cut(dataset$hora.hurto,breaks = time.tag, labels = c("Night","Morning","Afernoon","Evening"),include.lowest = TRUE)