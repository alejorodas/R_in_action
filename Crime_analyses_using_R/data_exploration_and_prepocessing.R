library(tidyverse)

# url.data <- "https://data.cityofchicago.org/api/views/x2n5-8w5q/rows.csv?accessType=DOWNLOAD"
# crime.data_tbl_tbl_tbl <- read.csv(url.data, na.strings="")
# 
# crime.data_tbl <- as.tibble(crime.data_tbl_tbl_tbl)

# save(crime.data_tbl, ascii = TRUE,
#      file = file.path(getwd(),"DataSet","crime.data_tbl.Rda"))
# 
# load(file =file.path(getwd(),"DataSet","crime.data_tbl.Rda"))

crime.data_tbl <- subset(crime.data_tbl, !duplicated(crime.data_tbl$CASE.))
crime.data_tbl <- subset(crime.data_tbl, !is.na(crime.data_tbl$LATITUDE))
crime.data_tbl <- subset(crime.data_tbl, !is.na(crime.data_tbl$WARD))

# which(is.na(crime.data_tbl$LOCATION))
# crime.data_tbl <- crime.data_tbl[-which(is.na(crime.data_tbl$LOCATION)), ]

crime.data_tbl <- crime.data_tbl[crime.data_tbl$CASE. != "CASE#",]

head(crime.data_tbl$DATE..OF.OCCURRENCE,n=1)


crime.data_tbl$date <- as.POSIXlt(crime.data_tbl$DATE..OF.OCCURRENCE,
                              format= "%m/%d/%Y %I:%M:%S %p")

head(crime.data_tbl$date)

library(chron)
crime.data_tbl$time <- times(format(crime.data_tbl$date, "%H:%M:%S"))
head(crime.data_tbl$time)

time.tag <- chron(times= c("00:00:00", "06:00:00", "12:00:00", "18:00:00",
                            "23:59:00"))
crime.data_tbl$time.tag <- cut(crime.data_tbl$time, breaks=time.tag,
                           labels= c("00-06","06-12", "12-18", "18-00"), include.lowest=TRUE)

table(crime.data_tbl$time.tag)
crime.data_tbl$date <- as.POSIXlt(strptime(crime.data_tbl$date,
                                       format= "%Y-%m-%d"))
head(crime.data_tbl$date)

crime.data_tbl$day <- weekdays(crime.data_tbl$date, abbreviate= TRUE)
crime.data_tbl$month <- months(crime.data_tbl$date, abbreviate= TRUE)

table(crime.data_tbl$PRIMARY.DESCRIPTION)
length(unique(crime.data_tbl$PRIMARY.DESCRIPTION))

crime.data_tbl$crime <- as.character(crime.data_tbl$PRIMARY.DESCRIPTION)
crime.data_tbl$crime <- ifelse(crime.data_tbl$crime %in% c("CRIM SEXUAL ASSAULT",
                                "PROSTITUTION", "SEX OFFENSE"), "SEX", crime.data_tbl$crime)

crime.data_tbl$crime <- ifelse(crime.data_tbl$crime %in% c("MOTOR VEHICLE THEFT"),
                           "MVT", crime.data_tbl$crime)

crime.data_tbl$crime <- ifelse(crime.data_tbl$crime %in% c("GAMBLING", "INTERFERE WITH PUBLIC OFFICER", "INTERFERENCE WITH PUBLIC OFFICER", "INTIMIDATION",
                                    "LIQUOR LAW VIOLATION", "OBSCENITY", "NON-CRIMINAL", "PUBLIC PEACE VIOLATION",
                                    "PUBLIC INDECENCY", "STALKING", "NON-CRIMINAL (SUBJECT SPECIFIED)"),
                           "NONVIO", crime.data_tbl$crime)

crime.data_tbl_tbl_tbl$crime <- ifelse(crime.data_tbl_tbl_tbl$crime == "CRIMINAL DAMAGE", "DAMAGE",
                           crime.data_tbl_tbl_tbl$crime)

crime.data_tbl_tbl_tbl$crime <- ifelse(crime.data_tbl_tbl_tbl$crime == "CRIMINAL TRESPASS",
                           "TRESPASS", crime.data_tbl_tbl_tbl$crime)

crime.data_tbl_tbl_tbl$crime <- ifelse(crime.data_tbl_tbl_tbl$crime %in% c("NARCOTICS", "OTHER
                                                    NARCOTIC VIOLATION", "OTHER NARCOTIC VIOLATION"), "DRUG", crime.data_tbl_tbl_tbl$crime)

crime.data_tbl$crime <- ifelse(crime.data_tbl$crime == "DECEPTIVE PRACTICE",
                           "FRAUD", crime.data_tbl$crime)

crime.data_tbl$crime <- ifelse(crime.data_tbl$crime %in% c("OTHER OFFENSE", "OTHER
                                                    OFFENSE"), "OTHER", crime.data_tbl$crime)

crime.data_tbl$crime <- ifelse(crime.data_tbl$crime %in% c("KIDNAPPING", "WEAPONS
                                                    VIOLATION", "OFFENSE INVOLVING CHILDREN"), "VIO", crime.data_tbl$crime)

crime.data_tbl$ARREST <- ifelse(as.character(crime.data_tbl$ARREST) == "Y", 1, 0)
