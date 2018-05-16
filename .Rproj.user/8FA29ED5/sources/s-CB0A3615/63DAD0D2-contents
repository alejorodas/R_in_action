# Encontrar la relacion entre cantidad de cilindros (cyl) que posee un carro y su consumo
# de gasolina (mpg)


#Agrupar los registros por cyl
data <- mtcars[c("cyl", "mpg")]


# Calcular la media de mpg agrupada por cyl
aggdata <-aggregate(data, by=list(Group.cyl=data$cyl), FUN=median, na.rm=TRUE)
#------------------------------------------------------------------------------#
# Se agrega la columna num_cyl para que contenta variable cuantitativa
aggdata$num_cyl[aggdata$cyl == 4] <- "4 cylinder"
aggdata$num_cyl[aggdata$cyl == 6] <- "6 cylinder"
aggdata$num_cyl[aggdata$cyl == 8] <- "8 cylinder"

# Se ordena el arreglo por el campo aggdata$cyl
aggdata <- aggdata[order(aggdata$cyl),]
barplot(aggdata$mpg, names.arg=aggdata$num_cyl, xlab="Number of cylinders", ylab = "Miles/US Gallon")
#------------------------------------------------------------------------------#

# # Agrega el nombre a las filas del data set
# rownames(aggdata) <- c("4 cylinder", "6 cylinder","8 cylinder")
# 
# # Se cambian las filas por columnas. Se transpone el data frame
#  transpor.aggdata <- t(aggdata[c("mpg")])
# 
# barplot(transpor.aggdata,xlab="Number of cylinders", ylab = "Miles/US Gallon" )




