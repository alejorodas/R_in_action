library(chron)
load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/hurto.Rda")

#Binding numerical - categorical
time.tag <- chron(times=c('00:00:00','06:00:00','12:00:00','18:00:00','23:59:00'))
hurto.inverval <- cut(data.set.hurto$hora.hurto,breaks = time.tag, labels = c("Madrugada","Mañana","Tarde","Noche"),include.lowest = TRUE)

count <- table(hurto.inverval)
count
barplot(count,ylim = c(0,max(count)*1.1), main = "Total Celulares Robados por División del Día",
        ylab = "Total Celulares Robados")
box()