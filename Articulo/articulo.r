mydata <- read.table("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/Hurto_2.csv", 
                      header = T, sep= ";",
                     encoding = "UTF-8", 
                     fill = TRUE)

mydata.tsv <- read.delim("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/Articulo/Hurto.tsv",
                         )

# Seleccionar las variables que seran objeto de estudio
# Crear la exploración gráfica de variables perdidas y la summary
