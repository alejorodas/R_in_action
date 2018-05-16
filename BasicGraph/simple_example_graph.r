dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

opar <- par(no.readonly=TRUE)
# pin = Plot dimensions (width, height) in inches.
par(pin=c(2, 3))
par(lwd=2, cex=1.5)
par(cex.axis=.75, font.axis=3)
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)

#------------------------------------------------------------------
#Adding text, customized axes, and legends

#For example, the following adds a title (main), subtitle (sub), 
#axis labels (xlab, ylab), and axis ranges (xlim,ylim)

plot(dose, drugA, type="b",
col="red", lty=2, pch=2, lwd=2,
main="Clinical Trials for Drug A",
sub="This is hypothetical data",
xlab="Dosage", ylab="Drug Response",
xlim=c(0, 60), ylim=c(0, 70))

#------------------------------------------------------------------

# Legend

opar <- par(no.readonly=TRUE)

par(lwd=2, cex=1.5, font.lab=2)

plot(dose, drugA, type="b",
  pch=15, lty=1, col="red", ylim=c(0, 60),
  main="Drug A vs. Drug B",
  xlab="Drug Dosage", ylab="Drug Response")

lines(dose, drugB, type="b", pch=17, lty=2, col="blue")

# This function adds one or more straight lines through the current plot.
abline(h=c(30), lwd=1.5, lty=2, col="gray")

legend("topleft", inset=.05, title="Drug Type", c("A","B"),
  lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))

par(opar)

#------------------------------------------------------------------

#Combining graphs

attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
par(opar)
detach(mtcars)