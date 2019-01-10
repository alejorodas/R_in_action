load(file =file.path(getwd(),"DataSet","crime.agg.Rda"))

beats <- sort(unique(crime.agg$BEAT))
dates <- sort(as.character(unique(crime.agg$date)))
temp <- expand.grid(beats, dates)
names(temp) <- c("BEAT", "date")

temp <- temp[order(temp$BEAT),]

model.data <- aggregate(crime.agg[, c("count", "ARREST")], 
                        by =list(crime.agg$BEAT, as.character(crime.agg$date)), FUN = sum)

names(model.data) <- c("BEAT", "date", "count", "ARREST")

model.data <- merge(temp, model.data, by= c("BEAT", "date"), all.x= TRUE)

model.data$count[is.na(model.data$count)] <- 0
model.data$ARREST[is.na(model.data$ARREST)] <- 0

model.data$day <- weekdays(as.Date(model.data$date), abbreviate= TRUE)
model.data$month <- months(as.Date(model.data$date), abbreviate= TRUE)

pastDays <- function(x) {
  c(0, rep(1, x))
}

filter(3, pastDays(1), sides= 1)

model.data$past.crime.1 <- ave(model.data$count, model.data$BEAT,
                               FUN= function(x) filter(x, pastDays(1), sides= 1))

model.data$past.crime.7 <- ave(model.data$count, model.data$BEAT,
                               FUN= function(x) filter(x, pastDays(7), sides= 1))

model.data$past.crime.30 <- ave(model.data$count, model.data$BEAT,
                                FUN= function(x) filter(x, pastDays(30), sides= 1))

meanNA <- function(x){
  mean(x, na.rm= TRUE)
}


model.data$past.crime.1 <- ifelse(is.na(model.data$past.crime.1),
                                  meanNA(model.data$past.crime.1), model.data$past.crime.1)

model.data$past.crime.7 <- ifelse(is.na(model.data$past.crime.7),
                                  meanNA(model.data$past.crime.7), model.data$past.crime.7)

model.data$past.crime.30 <- ifelse(is.na(model.data$past.crime.30),
                                   meanNA(model.data$past.crime.30), model.data$past.crime.30)

model.data$past.arrest.30 <- ave(model.data$ARREST, model.data$BEAT,
                                 FUN= function(x) filter(x, pastDays(30), sides= 1))

model.data$past.arrest.30 <- ifelse(is.na(model.data$past.arrest.30),
                                    meanNA(model.data$past.arrest.30), model.data$past.arrest.30)

cor(model.data$past.crime.30, model.data$past.arrest.30)