data.set.hombre <- subset(data.set.hurto, Sexo == "MASCULINO",
                          select = !myvars)

table.data.set.hombre <- xtabs(~ parte.dia+Dia, data=data.set.hombre)

barplot(table.data.set.hombre[,c("Lunes","Martes", "Miercoles", "Jueves", "Viernes","Sabado","Domingo")]
        ,beside = T
        ,main = "Cantidad Celulares Robabos a Hombres por Intervalo del Día Durante la Semana"
        ,legend = T
        ,ylab = "Total Celulares Robados"
        ,args.legend = list(x = "topright", bty = "n", inset=c(-0.23, 0.13))
)
table.data.set.hombre
box()

par(xpd = TRUE)
par(mfrow=c(1, 1), mar=c(5, 4, 4, 7))
table.jornada <- table.data.set.hombre[c("Mañana","Tarde"),c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")]
table.jornada



plot(table.jornada[c("Mañana"),], type = "b",xaxt = "n", 
     ylab = "Total Celulares Robados",
     xlab = "Días de la Semana",
     main = "Total Hurto de Celulares a Hombres en el Intervalo de la Mañana y Tarde",
     col="red",
     ylim = c(min(table.jornada),max(table.jornada)*1.0),
     pch=15, 
     lty=1)
par(xpd = TRUE)
lines(table.jornada[c("Tarde"),], type="b", pch=17, lty=2, col="blue")
legend("topright", 
       inset=c(-.26,0.1),
       title="Intervalo del Día", 
       c("Mañana","Tarde"),
       lty=c(1, 2), 
       pch=c(15, 17), 
       col=c("red", "blue"))
axis(1,at=1:7,labels = c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo"))