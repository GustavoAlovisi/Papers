rm(list=ls())

setwd("d:\\paola")

#library(foreign)

############################
################ parametri #
############################


tail <- "lower"		
kset <- 5		
rg <- 2		
cg <- 2		


###############################

sel <- read.table("selection_lower.txt", header=FALSE)


postscript(file="VIM.ps",horizontal=FALSE,paper="A4",width=7,height=7)
par(cex.axis=0.65, cex.main=0.9, las=2)
par(mfrow=c(rg,cg))

for(s in 1:(kset-1)){

nomefile <- paste("mediaM_",tail,s,".txt", sep="")
titolo <- paste("Iteration ",s, ": ", sel[s,2], " vs. remaining indexes", sep="")
meanM <- read.table(nomefile, header=FALSE)

idx <- order(-meanM[,2])
meanM.ord  <- meanM[idx,]

barplot(meanM.ord[,2], names.arg=meanM.ord[,1], ylim=c(-3,3), main=titolo, ylab="Average relative importances")


}

dev.off()



postscript(file="sommaVIM.ps",horizontal=FALSE,paper="A4",width=7,height=7)
par(cex.axis=0.65, cex.main=0.9, cex.lab=0.8, las=2)
par(mfrow=c(rg,cg))

titolo <- paste(sel[1,2], sep="")
assey <- paste("Sum of average relative importances - Iteration ", 1, sep="")

for(s in 1:(kset-1)){

nomefile <- paste("somma_mediaM_",tail,s,".txt", sep="")

	if(s>1){
	titolo <- paste(titolo,", ", sel[s,2], sep="")
	assey <- paste(assey,"+ ", s, sep="")
	}

meanM <- read.table(nomefile, header=FALSE)

idx <- order(-meanM[,2])
meanM.ord  <- meanM[idx,]

barplot(meanM.ord[,2], names.arg=meanM.ord[,1], ylim=c(-3,3), main=titolo, ylab=assey)


}

dev.off()



