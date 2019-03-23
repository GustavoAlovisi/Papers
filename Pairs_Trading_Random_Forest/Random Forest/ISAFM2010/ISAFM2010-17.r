# script for asset selection (De Luca, Rivieccio, Zuccolotto, Intell.Sys.Acc.Fin Mgmt. 17,91-109 2010)
# the script is not tested and functioning is not guaranteed

# data in input must be standardized residuals from univariate Student-t AR-GARCH models (p assets) - e.g. "MSCI_d.txt"
# and corresponding estimated degrees of freedom - e.g "gdl.txt"



rm(list=ls())
#memory.size(max=TRUE)


library(foreign)
library(randomForest)
library(concord)

#################################
################ SET PARAMETERS #
#################################

setwd("d:\\paola") 	# set your own working directory

datafile <- "MSCI_d.txt"	#name of file containing standardized residuals from univariate Student-t AR-GARCH models
doffile <- "gdl.txt"		#name of file containing estimated degrees of freedom for the univariate Student-t AR-GARCH models

t.std <- "Yes"		# did you use standardized Student's t when filtering returns ? "Yes", "No"
qq <- "Yes"			# do you want to plot qqplots in order to verify distributional fit of standardized residuals? "Yes", "No"

tail <- "lower"		# "lower" or "upper"
quant <- 10  		# L_t (when working in the lower tail - recommended: 10) or U_t (when working in the upper tail - recommended: 90)

sel.kset <- c("Italy")		# main reference stock
col <- 12			# column of the dataset with data of main reference stock
kset <- 5			# number of assets you want to select


nt <- 3000			# number of trees for Random Forest
typeVIM <- 2		# type of variable importance measure in Random Forest (recommended: 2 - do not set values >2)
				# (1=mean decrease in accuracy, 2=mean decrease in node impurity, ... )



###############################
# load data 
###############################

dati <- read.table(datafile, header=TRUE)
gdl <- read.table(doffile)


if(qq=="Yes"){
# qqplot in order to verify distributional fit of standardized residuals

dimdati <- dim(dati)
print(dimdati)
vars <- names(dati)

for(i in 1:dimdati[2]){

nome.grafico <- paste("qqplot_", vars[i],".ps", sep="")
randt <- rt(10000,gdl[i,])

if(t.std=="Yes") randt <- randt*(sqrt((gdl[i,1]-2)/gdl[i,1]))

postscript(file=nome.grafico,horizontal=TRUE,paper="A4",width=5,height=5)
par(cex=0.7)
qqplot(randt, dati[,i], type='p', main=vars[i], xlab="Theoretical quantiles", ylab="Empirical quantiles", xlim=c(-6,6),ylim=c(-6,6))
lines(c(-6,6), c(-6,6))
dev.off()

}
}


#################################################################
#################################################################

meanM.sum <- matrix(0,1,dim(dati)[2])
meanM.sum <- data.frame(meanM.sum)
names(meanM.sum) <- names(dati)
meanM.sum <- as.matrix(meanM.sum)
meanM.sum <- t(meanM.sum)


for(s in 1:(kset-1)){

dimdati <- dim(dati)
print(dimdati)


# predictors
varind <- names(dati)[-col]
ind <- as.matrix(varind)
nindrc <- dim(ind)
nind <- nindrc[1]



if(tail == "lower"){
	
	q <- as.matrix(1:quant)
	q <- q/100
	dimq <- dim(q)
	q <- rev(q)


	impmat <- matrix(0,nind,dimq[1])
	oobmat <- matrix(0,dimq[1],1)


	i <- 0
	for(u in q){

	i <- i+1

	dati.bin <- matrix(1,dimdati[1],dimdati[2])

		for(j in 1:dimdati[2]){
		
		# variabili t-Student
		qtS <- qt(u,gdl[j,1])
		
		if(t.std=="Yes") qtS <- qtS*(sqrt((gdl[j,1]-2)/gdl[j,1]))

		
		sel <- which(dati[,j]>qtS)
		dati.bin[sel,j] <- 0

		}
		
	y=factor(dati.bin[,col])
	x=dati.bin[,-col]

	rf.estimate <- randomForest(x, y, importance=TRUE, proximity=FALSE, 
	ntree=nt, keep.forest=TRUE)

	print(rf.estimate)
	
	miserr <- 1-((rf.estimate$conf[1,1]+rf.estimate$conf[2,2])/dimdati[1])
	miserr -> oobmat[i]

	
	if(typeVIM<3)
	imp <- importance(rf.estimate, type=typeVIM) 

	imp <- (imp-mean(imp))/mean(imp)
	imp <- round(imp, 2)	
	imp[,1] -> impmat[,i]

	}

}


if(tail == "upper"){

	q <- as.matrix(quant:99)
	q <- q/100
	dimq <- dim(q)

	impmat <- matrix(0,nind,dimq[1])
	oobmat <- matrix(0,dimq[1],1)


	i <- 0
	for(u in q){

	i <- i+1

	dati.bin <- matrix(1,dimdati[1],dimdati[2])

		for(j in 1:dimdati[2]){
		
		# variabili t-Student
		qtS <- qt(u,gdl[j,1])
		if(t.std=="Yes") qtS <- qtS*(sqrt((gdl[j,1]-2)/gdl[j,1]))


		sel <- which(dati[,j]<qtS)
		dati.bin[sel,j] <- 0

		}

	y=factor(dati.bin[,col])
	x=dati.bin[,-col]

	rf.estimate <- randomForest(x, y, importance=TRUE, proximity=FALSE, 
	ntree=nt, keep.forest=TRUE)

	print(rf.estimate)
	
	miserr <- 1-((rf.estimate$conf[1,1]+rf.estimate$conf[2,2])/dimdati[1])
	miserr -> oobmat[i]

	if(typeVIM<3)
	imp <- importance(rf.estimate, type=typeVIM) 

	imp <- (imp-mean(imp))/mean(imp)
	imp <- round(imp, 2)	
	imp[,1] -> impmat[,i]

	}

}


impmat <- t(impmat)
impmat <- data.frame(impmat)

names(impmat) <- varind

nome.impmat <- paste("M_",tail, s,".txt", sep="")
nome.oobmat <- paste("oobmat_",tail, s,".txt", sep="")
nome.media <- paste("mediaM_",tail, s,".txt", sep="")
nome.media.somma <- paste("somma_mediaM_",tail, s,".txt", sep="")
nome.grafico <- paste("M_",tail, s,".ps", sep="")


write.table(impmat, file = nome.impmat, row.names = FALSE, col.names = TRUE)
write.table(oobmat, file = nome.oobmat, row.names = FALSE, col.names = TRUE)

impmat <- read.table(nome.impmat, header=TRUE)

meanM <- sapply(impmat, mean)
#meanM.st <- (meanM-mean(meanM))/sd(meanM)
meanM.st <- meanM

meanM.sum <- meanM.sum[-col,]
meanM.sum <- meanM.sum + meanM.st


write.table(meanM, file = nome.media, row.names = TRUE, col.names = FALSE)
write.table(meanM.sum, file = nome.media.somma, row.names = TRUE, col.names = FALSE)

################### GRAFICI

idx <- order(-meanM)
meanM.ord  <- meanM[idx]

postscript(file=nome.grafico,horizontal=FALSE,paper="A4",width=7.5,height=5)
par(las=2, cex.axis=0.7)
barplot(meanM.ord)
dev.off()

#####################

dati <- dati[,-col]
gdl <- gdl[-col,]
gdl <- data.frame(gdl)

if (tail=="lower") col <- which.min(meanM.sum)
if (tail=="upper") col <- which.max(meanM.sum)
if (tail=="lower") sel.kset <- c(sel.kset, names(which.min(meanM.sum)))
if (tail=="upper") sel.kset <- c(sel.kset, names(which.max(meanM.sum)))
meanM.sum <- as.matrix(meanM.sum)

}


nome.sel <- paste("selection_",tail,".txt", sep="")
write.table(sel.kset, file = nome.sel, row.names = TRUE, col.names = FALSE)

