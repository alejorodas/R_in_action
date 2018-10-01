library(ggplot2)

load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

hurto.pereira$Dia <- factor(hurto.pereira$Dia, levels= c("Lunes", "Martes", "Miercoles",
                                                    "Jueves", "Viernes", "Sabado", "Domingo"))

qplot(hurto.pereira$Dia, xlab =  "D??a de la Semana", main = "Hurtos por D??a de la Semana") +
  scale_y_continuous("Cantidad de Hurtos") + theme(plot.title = element_text(hjust = 0.5))

table(hurto.pereira$Dia)