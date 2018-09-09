load(file ="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/hurto.Rda")

hurto.pereira <- data.set.hurto[which(data.set.hurto$Municipio == "PEREIRA (CT)"),]

save(hurto.pereira, ascii = TRUE,
     file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/hurto.pereira.Rda")