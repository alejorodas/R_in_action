library(vcd)
counts <- table(Arthritis$Improved)

counts
#Bar plots display the distribution (frequencies) of a categorical variable through vertical or horizontal bars.
barplot(counts,
        main="Simple Bar Plot",
        xlab="Improvement", ylab="Frequency")

#If the categorical variable to be plotted is a factor or ordered factor, you can create a vertical bar plot quickly with the plot() function.
counts <- factor(Arthritis$Improved)
plot(counts, main="Simple Bar Plot",
               xlab="Improved", ylab="Frequency")
