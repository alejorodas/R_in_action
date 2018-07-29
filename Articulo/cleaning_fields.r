load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")

# Transforma la hora. Elimina la secci??n correspondiente a la fecha y
# convierte la hora a formato 24-horas
format.Hora <- function(dataset) {
  Hora <- format(dataset$Hora, format = "%m-%d-%Y %I:%M:%S %p")
  d <- as.POSIXct(Hora, format = "%m/%d/%Y %I:%M:%S %p")
  dataset$hora.hurto <- times(substr(d, 12, 19))
  return(dataset)
}

# Elimina los carateres no imprimibles de la varible departamento
data.set.hurto$Departamento <- sapply(data.set.hurto$Departamento,
                        function(departamento){gsub(pattern = "[^[:print:]]",
                                         replacement = "", departamento)})
data.set.hurto <- format.Hora(data.set.hurto)

save(data.set.hurto, ascii = TRUE,
     file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")
