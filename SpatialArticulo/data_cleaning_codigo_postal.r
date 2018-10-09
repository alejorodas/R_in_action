mydata <- read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/C_digos_Postales_Colombia.csv",
                     header = T, sep= ";",
                    encoding = "UTF-8",
                    fill = TRUE)


codigo_postales <- mydata[c("nombre_departamento","nombre_municipio","codigo_postal","longitud_centroide","latitud_centroide","barrios_contenidos_en_el_codigo_postal")]
codigo_postales_pereira <- codigo_postales[which(codigo_postales$nombre_municipio == "PEREIRA"),]


fix.codigo.postal <- function(codigo_postales_pereira) {
  # Inicializar data frame vacio
  df <- data.frame(nombre_departamento = character(), nombre_municipio = character(),
                   codigo_postal = numeric(), longitud_centroide = character(), latitud_centroide = character(),
                   barrios_codigo = character(),  stringsAsFactors=FALSE)
  
  for (row in 1:nrow(codigo_postales_pereira)  ) {
     barrios_codigo_postal <- strsplit(toString(codigo_postales_pereira$barrios_contenidos_en_el_codigo_postal[row]), "-")
    for (barrio in 1:length(barrios_codigo_postal[[1]]) ) {
      
      nombre_departamento <- toString(codigo_postales_pereira$nombre_departamento[row])
      nombre_municipio <- toString(codigo_postales_pereira$nombre_municipio[row])
      codigo_postal <-  as.numeric(gsub(",","",toString(codigo_postales_pereira$codigo_postal[row])))
      longitud_centroide <- toString(codigo_postales_pereira$longitud_centroide[row])
      latitud_centroide <- toString(codigo_postales_pereira$latitud_centroide[row])
      barrios_codigo <- barrios_codigo_postal[[1]][barrio]

      fila <- list(nombre_departamento,nombre_municipio,strtoi(codigo_postal),longitud_centroide,latitud_centroide,barrios_codigo)
      df[nrow(df) + 1,] = fila
      
    }

   }
   return(df)
}



data.set.codigo.postal.pereira.barrios <- fix.codigo.postal(codigo_postales_pereira)
save(data.set.codigo.postal.pereira.barrios, ascii = TRUE,
     file="/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialArticulo/data_set_codigo_postal_pereira_barrios.Rda")
