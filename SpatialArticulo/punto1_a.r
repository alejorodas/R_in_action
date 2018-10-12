table.arthritis <- Arthritis[order(Arthritis$Age),]
load(file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")

hurto.pereira$color[hurto.pereira$hurto.inverval == "00-06"] <- "red"
hurto.pereira$color[hurto.pereira$hurto.inverval == "06-12"] <- "blue"
hurto.pereira$color[hurto.pereira$hurto.inverval == "12-18"] <- "darkgreen"
hurto.pereira$color[hurto.pereira$hurto.inverval == "18-00"] <- "brown"


dotchart(hurto.pereira$time,
         cex=.7,
         pch=19,
         groups =  hurto.pereira$hurto.inverval,
         gcolor = "black",
         color = hurto.pereira$color,
         ylab="Jornada",
         xlab = "Hora del Día",
         main = "Hora del Día vs Jornada")

legend(x=23,y=80,legend=c("None", "Marked", "Some"), col = c("red","blue","darkgreen"), pch = 20)