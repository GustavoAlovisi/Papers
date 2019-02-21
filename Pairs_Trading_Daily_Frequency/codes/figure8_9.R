# Set working directory using setwd() function
setwd('C:/Users/fsabino/Documents/Papers/Pairs_Trading_Daily_Frequency/data')

# my.d <- dirname(rstudioapi::getActiveDocumentContext()$path)

# Clear all variables in R's memory
rm(list=ls())    # Standard code to clear R's memory

# library('ggplot2')            # Load the 'ggplot2' package

optcop <- read.table('opt_cop.CSV', header=F, sep=',')   # Load Optimal Copula data set

x <- apply(optcop,2,factor) # Redefine the numbers in optcop as factors.

# Set colors
color <- c("red", "brown", "coral", "yellow", "orange", "green", "blue") 
bw.color <- c("white", "gray10", "gray30", "gray50", "gray70", "gray90", "black") # black and white

# plotting settings -------------------------------------------------------
angle1 <- rep(c(45,45,135), length.out=7)
angle2 <- rep(c(45,135,135), length.out=7)
density1 <- density2 <- seq(5,35,length.out=7)
col <- 1 # rainbow(7)

# One figure in row 1 and two figures in row 2
# layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))

# 3 figures arranged in 3 rows and 1 column
par(mfrow=c(3,1))

# barplot for Top 5 pairs using pre defined above
bp1_5 <- barplot(100*table(x[,1:5])/245, angle=angle1, axes=T, 
        beside=T, col=color, cex.lab = 1.6, cex.main = 1.6,
        main="Copula Distribuitions", density = density1,
        names=c("Gaussian", "Clayton", "Frank", "Gumbel",
                "Student-t", "Mixture CFG", "Mixture CtG"), 
        xlab="Top 1-5", ylab="Frequency (%)", ylim=c(0,80))

labels <-c("2.9%", "0.4%", "0.8%", "1.6%", "2.0%", "24.1%", "68.2%")
text(bp1_5, 100*table(x[,1:5])/245+3, labels, cex=1.2, pos=3)

# barplot for Top 6-20 pairs using pre defined above
bp6_20 <- barplot(100*table(x[,6:20])/735, angle=angle1, axes=T, 
              beside=T, col=color, cex.lab = 1.6, 
              cex.main = 1.6, main="", density = density1,
              names=c("Gaussian", "Clayton", "Frank", "Gumbel",
                      "Student-t", "Mixture CFG", "Mixture CtG"), 
              xlab="Top 6-20", ylab="Frequency (%)", ylim=c(0,80))

labels <-c("2.3%", "0.8%", "1.4%", "1.4%", "2.4%", "25.6%", "66.1%")
text(bp6_20, 100*table(x[,6:20])/735+3, labels, cex=1.2, pos=3)

# barplot for Top 21-35 pairs using pre defined above
bp21_35 <- barplot(100*table(x[,21:35])/735, angle=angle1, axes=T, 
                  beside=T, col=color, cex.lab = 1.6, 
                  cex.main = 1.6, main="", density = density1,
                  names=c("Gaussian", "Clayton", "Frank", "Gumbel",
                          "Student-t", "Mixture CFG", "Mixture CtG"), 
                  xlab="Top 21-35", ylab="Frequency (%)", ylim=c(0,80))

labels <-c("4.1%", "0.7%", "1.2%", "1.9%", "2.9%", "25.6%", "63.7%")
text(bp21_35, 100*table(x[,6:20])/735+3, labels, cex=1.2, pos=3)
#legend("topright", legend=c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"),
#       bty="n")) # Legend is not necessary here

# Create a pie chart for Top 5 pairs with
# defined heading and custom colors and labels

pie(100*table(x[,1:5])/245, main="Copula Distribuitions",
    col=color, angle=angle2, density=density1,
    labels=c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"))
# Too many labels

my.sub_labels <- round(100*table(x[,1:5])/245, 1)

# Concatenate a '%' char after each value
my.sub_labels <- paste(my.sub_labels, "%", sep="")

# Create a pie chart with defined heading and custom colors
# and labels
x11()
pie(100*table(x[,1:5])/245, main="Copula Distribution", col=color, labels=my.sub_labels,
    cex=0.6, angle=angle2, density=density1)

l <- locator(1)

# Create a legend at the right   
legend(l$x, l$y, c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"), cex=0.8, 
       fill=color, angle=angle2, density=density1)


# barplot for Top 20 pairs
x11() # Open a new window
barplot(100*table(x[,1:20])/980, angle=angle1, axes=T, 
        beside=T, col=col, cex.lab = 1.3, cex.main = 1.3,
        main="Copula Distribuitions", density = density1,
        names=c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"), 
        xlab="", ylab="Frequency (%)", ylim=c(0,70))

# barplot for Top 35 pairs
barplot(100*table(x[,1:35])/1715, angle=angle2, axes=T, 
        beside=T, col=col, cex.lab = 1.3, cex.main = 1.3,
        main="Copula Distribuitions", density = density1,
        names=c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"), 
        xlab="", ylab="Frequency (%)", ylim=c(0,70))

# Superiods

# bpsub1 <- barplot(100*table(x[1:9,1:5])/45, axes=TRUE, main="Copula Distribuitions", xlab="", 
#                   names=c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"), 
#                   ylab="Frequency (%)", ylim=c(0,75), col=col)

# Some Copula Distributions are not chosen. The commands above tell us
# there an incorrect number of names.

# Set subperiods with zero frequency
# Top 1-5 pairs
First_1 = 100*c(3,0,0,1,0,16,25)/45
Second_1 = 100*c(4,0,1,1,1,10,33)/50
Third_1 = 100*c(0,0,0,1,1,11,37)/50
Fourth_1 = 100*c(0,0,0,0,1,14,35)/50
Fifth_1 = 100*c(0,1,1,1,2,8,37)/50

# Top 6-20 pairs
First_2 = 100*c(7,4,2,3,5,34,80)/135
Second_2 = 100*c(3,1,2,2,5,37,99)/150
Third_2 = 100*c(4,1,1,3,1,36,104)/150
Fourth_2 = 100*c(2,0,1,2,3,46,96)/150
Fifth_2 = 100*c(1,0,4,0,3,35,107)/150

# Top 21-35 pairs
First_3 = 100*c(13,2,1,5,3,35,76)/135
Second_3 = 100*c(6,1,1,3,2,42,95)/150
Third_3 = 100*c(5,0,1,3,4,40,97)/150
Fourth_3 = 100*c(2,0,5,3,2,37,101)/150
Fifth_3 = 100*c(4,2,1,0,10,34,99)/150

my.sub.1 <- matrix(c(First_1,Second_1,Third_1,Fourth_1,Fifth_1),7,5)
my.sub.2 <- matrix(c(First_2,Second_2,Third_2,Fourth_2,Fifth_2),7,5)
my.sub.3 <- matrix(c(First_3,Second_3,Third_3,Fourth_3,Fifth_3),7,5)
rownames(my.sub.1) <- rownames(my.sub.2) <- rownames(my.sub.3) <- 1:7
colnames(my.sub.1) <- colnames(my.sub.2) <- colnames(my.sub.3) <- 
  c("91-95","96-00","01-05","06-10","11-15")

# Not stacked
barplot(my.sub.1, angle=angle1, axes=T, beside=T, 
        col=col, cex.lab = 1.3, cex.main = 1.3,
        main="Copula Distribuitions", density = density1,
        names.arg=c("91-95","96-00","01-05","06-10","11-15"), 
        xlab="Subperiods", ylab="Frequency (%)", ylim=c(0,85))

legend("top", legend=c("Gaussian", "Clayton", "Frank", "Gumbel",
                       "Student-t", "Mixture CFG", "Mixture CtG"), 
       cex=0.6, ncol=7, fill=TRUE, col=col, angle=angle1, density=density1)

# Stacked
dev.off() # to reset the graphics pars to defaults

par(mfrow=c(2,2))
# Set xpd to allow legend placement outside
# plot region. See ?par
# Expand right side of clipping rect to make room for the legend
# i.e., adjust the plot margins to make room for the 
# legend on the right side.
# par(xpd=T, mar=par()$mar+c(0,0,0,5))

# Graph my.sub using terrain colors,  
# put 10% of the space between each bar, and make labels  
# smaller with horizontal y-axis labels
barplot(my.sub.1, main="Top 1-5 pairs", ylab="Frequency (%)",
        col=color, space=0.1, cex.axis=1, 
        las=1, names.arg=c("91-95","96-00","01-05","06-10","11-15"), 
        xlab="Subperiods", ylim=c(0,100), angle=angle1, density=density1)

barplot(my.sub.2, main="Top 6-20 pairs", ylab="Frequency (%)",
        col=color, space=0.1, cex.axis=1, 
        las=1, names.arg=c("91-95","96-00","01-05","06-10","11-15"), 
        xlab="Subperiods", ylim=c(0,100), angle=angle1, density=density1)

barplot(my.sub.3, main="Top 21-35 pairs", ylab="Frequency (%)",
        col=color, space=0.1, cex.axis=1, 
        las=1, names.arg=c("91-95","96-00","01-05","06-10","11-15"), 
        xlab="Subperiods", ylim=c(0,100), angle=angle1, density=density1)

# I want to add a legend in the last plot
plot.new() # Start a New Plot Frame


# Left click on the right side of the window where you want
# the legend. See ?locator
l <- locator(1)

# Now put the legend where you clicked
# See ?legend
legend(l$x, l$y, legend = c("Gaussian", "Clayton", "Frank", "Gumbel","Student-t", "Mixture CFG", "Mixture CtG"),
      cex=0.8, fill=color, angle=angle1, density=density1)

# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)


# Save a single object to a file
saveRDS(optcop, "optcop.rds")
# Restore it under a different name
optcop <- readRDS("optcop.rds")




