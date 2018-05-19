# Violent Crime Rates by US State
attach(USArrests)
par(mfrow=c(2,2))

plot(UrbanPop,Rape,main="Urban Population vs Rape",las=1, xlim = c(30,80),pch=20,col="red")
abline(lm(Rape~UrbanPop),col=4)

plot(Assault,Murder,main="Assault vs Murder",las=1,pch=20,col="red")
abline(lm(Murder~Assault),col=4)
population.median <- median(USArrests$UrbanPop)
points(USArrests$Assault[USArrests$UrbanPop >= population.median], 
       USArrests$Murder[USArrests$UrbanPop >= population.median],col="green",pch=20 )

legend(x=50,y=15,legend=c("Population Over 66 "), col = c("green"), pch = 20)

cities <- USArrests[c(USArrests$UrbanPop >= population.median),]
cities <- cities[c("UrbanPop")]

