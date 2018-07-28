library(vcd)
par(mfrow=c(2,1))
counts <- table(Arthritis$Improved)

counts
#Bar plots display the distribution (frequencies) of a categorical variable through vertical or horizontal bars.
barplot(counts,
        main="Simple Bar Plot",
        xlab="Improvement", ylab="Frequency")

#If the categorical variable to be plotted is a factor or ordered factor, you can create a vertical bar plot quickly with the plot() function.
counts <- factor(Arthritis$Improved)
counts
plot(counts, main="Simple Bar Plot",
               xlab="Improved", ylab="Frequency")

