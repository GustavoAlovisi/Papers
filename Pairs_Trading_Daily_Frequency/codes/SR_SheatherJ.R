library(MASS)
library(KernSmooth)
#install.packages("sBF",dep=T)
library(sBF)
#install.packages("nleqslv",dep=T)
library(nleqslv)
#install.packages("R.matlab",dep=T)
library(R.matlab)

data<-readMat("C:\\Users\\fsabino\\Desktop\\Fernando\\SR_SheatherJ.mat")

attach(data)

mix5cc <- sq.mix.d0p5c1.020cc.SR
mix5fi <- sq.mix.d0p5c1.020fi.SR
mix20cc <- sq.mix.d0p20c1.020cc.SR
mix20fi <- sq.mix.d0p20c1.020fi.SR
mix35cc <- sq.mix.d0p35c1.020cc.SR
mix35fi <- sq.mix.d0p35c1.020fi.SR
dist5cc <- d0p5c1.sq20cc.SR
dist5fi <- d0p5c1.sq20fi.SR
dist20cc <- d0p20c1.sq20cc.SR
dist20fi <- d0p20c1.sq20fi.SR
dist35cc <- d0p35c1.sq20cc.SR
dist35fi <- d0p35c1.sq20fi.SR

hm5cc <- bw.SJ(mix5cc)
hm5fi <- bw.SJ(mix5fi)
hm20cc <- bw.SJ(mix20cc)
hm20fi <- bw.SJ(mix20fi)
hm35cc <- bw.SJ(mix35cc)
hm35fi <- bw.SJ(mix35fi)
hd5cc <- bw.SJ(dist5cc)
hd5fi <- bw.SJ(dist5fi)
hd20cc <- bw.SJ(dist20cc)
hd20fi <- bw.SJ(dist20fi)
hd35cc <- bw.SJ(dist35cc)
hd35fi <- bw.SJ(dist35fi)

cairo_ps("image.eps")

m <- matrix(c(1,2,3,4,5,6,7,7),nrow = 4,ncol = 2,byrow = TRUE)

layout(mat = m,heights = c(0.4,0.4,0.4,0.45))

par(mar = c(4,4,2,2))

plot(density(dist5cc,bw=hd5cc),type="l", lty = 1, col="green", main="(a) Top 5 pairs, Committed Capital, after costs", 
     xlab="Sharpe Ratio", ylab="Density", xlim=c(-0.25,1.5),panel.first=grid())
lines(density(mix5cc,bw=hm5cc), type="l", lty = 2, col="blue")
plot(density(dist5fi,bw=hd5fi),type="l", lty = 1, col="green", main="(b) Top 5 pairs, Fully Invested, after costs", 
     xlab="Sharpe Ratio", ylab="Density", xlim=c(-0.25,1.75), ylim=c(0,2.25),panel.first=grid())
lines(density(mix5fi,bw=hm5fi), type="l", lty = 2, col="blue")
plot(density(dist20cc,bw=hd20cc), type="l", lty = 1, col="green", main="(c) Top 20 pairs, Committed Capital, after costs", 
     xlab="Sharpe Ratio", ylab="Density", xlim=c(-0.25,1.75),panel.first=grid())
lines(density(mix20cc,bw=hm20cc), type="l", lty = 2, col="blue")
plot(density(dist20fi,bw=hd20fi),type="l", lty = 1, col="green", main="(d) Top 20 pairs, Fully Invested, after costs", 
     xlab="Sharpe Ratio", ylab="Density", xlim=c(-0.25,2.25), ylim=c(0,1.6),panel.first=grid())
lines(density(mix20fi,bw=hm20fi), type="l", lty = 2, col="blue")
plot(density(dist35cc,bw=hd35cc),type="l", lty = 1, col="green", main="(e) Top 35 pairs, Committed Capital, after costs", 
     xlab="Sharpe Ratio", ylab="Density", xlim=c(-0.25,2.25),ylim=c(0,1.4),panel.first=grid())
lines(density(mix35cc,bw=hm35cc), type="l", lty = 2, col="blue")
plot(density(dist35fi,bw=hd35fi), type="l", lty = 1, col="green", main="(f) Top 35 pairs, Fully Invested, after costs", 
     xlab="Sharpe Ratio", ylab="Density", xlim=c(-0.25,2.25), ylim=c(0,1.6),panel.first=grid())
lines(density(mix35fi,bw=hm35fi), type="l", lty = 2, col="blue")

# lty = 1 (solid), 2 = dashed


# plot(dist5cc <- sq_mix_d0p5c1_020cc_SR,
#      mix5fi <- sq_mix_d0p5c1_020fi_SR,
#      mix20cc <- sq_mix_d0p20c1_020cc_SR,
#      mix20fi <- sq_mix_d0p20c1_020fi_SR,
#      mix35cc <- sq_mix_d0p35c1_020cc_SR,
#      mix35fi <- sq_mix_d0p35c1_020fi_SR,
#      dist5cc <- d0p5c1_sq20cc_SR,
#      dist5fi <- d0p5c1_sq20fi_SR,
#      dist20cc <- d0p20c1_sq20cc_SR,
#      dist20fi <- d0p20c1_sq20fi_SR,
#      dist35cc <- d0p35c1_sq20cc_SR,
#      dist35fi <- d0p35c1_sq20fi_SR, type = "l", axes=F)
plot_colors <- c("blue","green")
# setup for no margins on the legend
par(mar=c(0, 0, 0, 0))
# c(bottom, left, top, right)

plot.new()
legend(x = "center", "groups", inset = 0,
       legend = c("Mixed Copula", "Distance"), lty = c(2,1),
       col=plot_colors, lwd=0.5, cex=1.08, bty="n",horiz = TRUE)


# setEPS()
# postscript("Figure5.eps", horizontal = FALSE, onefile = FALSE, paper = "special")
dev.off()





