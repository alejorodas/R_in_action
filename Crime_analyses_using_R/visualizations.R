library(ggplot2)
load(file =file.path(getwd(),"DataSet","crime.data_tbl.Rda"))

qplot(crime.data_tbl$crime, xlab = "Crime", main = "Crimes in Chicago") +
  scale_y_continuous("Number of crimes")

library(maptools)
beat.shp <- readShapePoly(file.path(getwd(),"DataSet", "PoliceBeats","PoliceBeat.shp"))
plot(beat.shp)

library(plyr)
library(sp)

crime.data_tbl$date <- as.POSIXct(crime.data_tbl$date)
crime.agg <- ddply(crime.data_tbl, .(crime, ARREST, BEAT, date, X.COORDINATE,
                      Y.COORDINATE, time.tag, day, month), summarise, count = length(date),
                   .progress= "text")

save(crime.agg, ascii = TRUE,
    file = file.path(getwd(),"DataSet","crime.agg.Rda"))


