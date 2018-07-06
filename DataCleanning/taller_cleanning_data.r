library(VIM)
data(sleep, package = "VIM")

# Exploring missing data visually
aggr(sleep, prop=FALSE, numbers=TRUE)

fix.missing <- function(custdata) {
  for (row in 1:nrow(custdata)) {
    NonD <- custdata[row, "NonD"]
    Dream <- custdata[row, "Dream"]
    Sleep <- custdata[row, "Sleep"]
    
    #Sleep = Dream + NonD
    
    if(is.na(custdata$NonD[row]) && !is.na(custdata$Dream[row]) &&  !is.na(custdata$Sleep[row])){
      custdata$NonD[row] <- Sleep - Dream
      print("custdata$NonD.fix")
    }

    if(is.na(custdata$Dream[row]) && !is.na(custdata$NonD[row]) &&  !is.na(custdata$Sleep[row])){
      custdata$Dream[row] <- Sleep - NonD
      print("custdata$Dream.fix")
    }

    if(is.na(custdata$Sleep[row]) && !is.na(custdata$NonD[row]) &&  !is.na(custdata$Dream[row])){
      custdata$Sleep[row] <- Dream + NonD
      print("custdata$Sleep.fix")
    }
    
  }
  return(custdata)
}

print("Data set casos completos")
nrow(sleep[complete.cases(sleep),])

custdata <- sleep[!complete.cases(sleep),]
print("Data set casos incompletos")
nrow(custdata)

custdata.fix <- fix.missing(custdata)

print("Data set casos completos")
nrow(custdata.fix[!complete.cases(custdata.fix),])
is.data.frame(custdata.fix)






