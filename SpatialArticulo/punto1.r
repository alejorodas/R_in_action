library(ggplot2)

load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

qplot(hurto.pereira$hurto.inverval, xlab="Hora del D??a", main = "Hurtos por Hora del D??a") + 
  scale_y_continuous("Cantidad de Hurtos") + theme(plot.title = element_text(hjust = 0.5))

table(hurto.pereira$hurto.inverval)