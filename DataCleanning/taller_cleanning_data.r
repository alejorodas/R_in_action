library(VIM)
data(sleep, package = "VIM")
par(mfrow=c(2,1))

fix.missing <- function(custdata) {
  for (row in 1:nrow(custdata)) {
    
    #Sleep = Dream + NonD
 
    if(is.na(custdata$Dream[row]) && !is.na(custdata$NonD.fix[row]) &&  !is.na(custdata$Sleep[row])){
      custdata$Dream[row] <- custdata$Sleep[row] - custdata$NonD.fix[row]
    }

    if(is.na(custdata$Sleep[row]) && !is.na(custdata$NonD.fix[row]) &&  !is.na(custdata$Dream[row])){
      custdata$Sleep[row] <- custdata$Dream[row] + custdata$NonD.fix[row]
    }
    
  }
  return(custdata)
}

# Exploring missing data visually
aggr(sleep, prop=FALSE, numbers=TRUE)

# WHEN VALUES ARE MISSING RANDOMLY
meanNonD <- mean(sleep$NonD, na.rm = T)
sleep$NonD.fix <- ifelse(is.na(sleep$NonD), meanNonD, sleep$NonD)
sleep.fix <- fix.missing(sleep)

# Exploring missing data visually with new variable NonD.fix
aggr(sleep.fix[c("BodyWgt","BrainWgt","NonD.fix","Dream","Sleep","Span", "Gest","Pred", "Exp","Danger")], prop=FALSE, numbers=TRUE)





