library(ggplot2)

load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")
temp <- aggregate(hurto.pereira$Dia, by = list(hurto.pereira$Dia, hurto.pereira$hurto.inverval), FUN = length)

names(temp) <- c("dia","intervalo","count")
temp$dia <- factor(temp$dia, order=TRUE,levels=c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"))


ggplot(temp, aes(x= temp$dia, y= factor(temp$intervalo))) + geom_tile(aes(fill =  count)) +
  scale_x_discrete("D??a de la Semana", expand = c(0,0)) +
  scale_y_discrete("Hora del Dia", expand = c(0,-2)) + 
  scale_fill_gradient("Cantidad de Hurtos", low = "#56B1F7", high = "#132B43", space = "Lab",
                      na.value = "grey50") +
  theme_bw() + ggtitle("Hurtos por D??a y Hora en la Semana") + theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_line(colour = NA), panel.grid.minor = element_line(colour = NA))

