load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/data.Rda")

format.Hora <- function(dataset) {
  Hora <- format(dataset$Hora, format = "%m-%d-%Y %I:%M:%S %p")
  d <- as.POSIXct(Hora, format = "%m/%d/%Y %I:%M:%S %p")
  dataset$hora.hurto <- times(substr(d, 12, 19))
  return(dataset)
}

dataset <- format.Hora(data.set.hurto)

#Binding numerical - categorical
time.tag <- chron(times=c('00:00:00','06:00:00','12:00:00','18:00:00','23:59:00'))
hurto.inverval <- cut(dataset$hora.hurto,breaks = time.tag, labels = c("Madrugada","Mañana","Tarde","Noche"),include.lowest = TRUE)

count <- table(hurto.inverval)
count
barplot(count,ylim = c(0,max(count)*1.1), main = "Cantidad de Celulares Robados por División del Día",
        ylab = "Total Celulares Robados")
box()

