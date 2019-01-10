library(chron)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")


data.set.hurto$hora.hurto <- as.POSIXlt(data.set.hurto$Hora, format="%m/%d/%Y %I:%M:%S %p")
data.set.hurto$time <- times(format(data.set.hurto$hora.hurto, "%H:%M:%S"))

time.tag <- chron(times=c('00:00:00','06:00:00','12:00:00','18:00:00','23:59:00'))
data.set.hurto$hurto.inverval <- cut(data.set.hurto$time,breaks = time.tag, 
                                     labels = c("00-06","06-12", "12-18", "18-00"),
                                     include.lowest = TRUE)
                             
save(data.set.hurto, ascii = TRUE,
     file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.Rda")

#risaralda_municipio <- data.set.hurto$Municipio[data.set.hurto$Departamento == 'RISARALDA',]
