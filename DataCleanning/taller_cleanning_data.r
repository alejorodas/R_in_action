custdata <- sleep[!complete.cases(sleep),]
head(custdata, n = 5)

fix.missing <- function(custdata) {
  if(is.na(custdata$NonD) & !is.na(custdata$Dream) &  !is.na(custdata$ Sleep)){
    custdata$NonD.fix <- custdata$Sleep - custdata$Dream
  }
  
  if(is.na(custdata$NonD) & !is.na(custdata$Dream) &  !is.na(custdata$ Sleep)){
    custdata$NonD.fix <- custdata$Sleep - custdata$Dream
  }
  
  if(is.na(custdata$Dream) & !is.na(custdata$NonD) &  !is.na(custdata$Sleep)){
    custdata$Dream.fix <- custdata$Sleep - custdata$NonD
  }
}

# custdata$NonD.fix <- ifelse(is.na(custdata$NonD) & !is.na(custdata$Dream) &  !is.na(custdata$ Sleep),
#                                    custdata$NonD.fix <- custdata$Sleep - custdata$Dream, "missing")
x <- sapply(custdata, fix.missing(custdata) )
head(custdata, n = 5)

