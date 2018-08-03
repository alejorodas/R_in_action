load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")

dias <- factor(data.set.hurto$Dia, order=TRUE,
               levels= c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"))

d <- data.frame(data.set.hurto$Dia,dias)
count <- table(data.set.hurto$Dia)[c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")]

# barplot(count,ylim = c(0,max(count)*1.1), main = "Celulares Robados por Día de la Semana",
#         ylab = "Total Celulares Robados", 
#         las = 2,
#         cex.names = 0.6,
#         names.arg = c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"))
# 

plot(count,type = "b",ylim = c(0,max(count)*1.2),
     ylab = "Total Celulares Robados")

title(main = "Celulares Robados por Día de la Semana")
box()
count

