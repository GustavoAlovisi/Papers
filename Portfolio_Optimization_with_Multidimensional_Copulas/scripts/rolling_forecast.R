# Clear all
rm(list=ls())
# memory.limit(size=200000)

# Set working directory
setwd("C:/Users/fsabino/Desktop/Codes/papers/Portfolio_Optimization_with_Multidimensional_Copulas/scripts")

# Install packages
# install.packages(c("data.table", "fGarch", "fPortfolio", "copula", "QRM", "R.matlab", "psych", 
#                    "readr", "rugarch", "imputeTS", "quantmod", "readxl", "dplyr"))

# Load packages
require(data.table)
require(fGarch)
require(fPortfolio)
require(copula)
require(QRM)
require(R.matlab)
require(psych)
require(readr)
require(rugarch)
require(imputeTS)
require(quantmod)
require(readxl)
require(dplyr)

# Load datasets
# filename1 <- "Rt.csv"
# filename2 <- "Rm.csv"
# filename3 <- "Pt.csv"
# filename4 <- "Periods_48.csv"
# filename5 <- "div50_1706.csv"
# filename6 <- "per48.csv"
# filename7 <- "Rf.csv" 
# 
# Rt <- fread(filename1)
# Rm <- fread(filename2)
# Pt <- fread(filename3)
# Periods <- fread(filename4)
# div50 <- fread(filename5)
# per48 <- fread(filename6)
# Rf <- fread(filename7)
# SP500 <- Rm - Rf

Rt<- read.csv(file="Rt.csv", header = F)
Rm<- read.csv(file="Rm.csv", header = F)
Periods<- read.csv(file="Periods_48.csv", header = F)
div50<- read.csv(file="div50_1706.csv", header = F)
per48<- read.csv(file="per48.csv", header = T)
Rf<- read.csv(file="Rf.csv", header = F)
SP500 <- Rm - Rf

# Data Exploration
head(Rt) # View the first rows 
str(Rt) # View a condensed summary of the data
class(Rt) # Check the class 
dim(Rt) # Check the dimensions
glimpse(Rt) # Check the structure
View(div50)
View(per48)

# # Create a data frame tbl
# Rt <- tbl_df(Rt)
# SP500ret <- tbl_df(SP500)

per48$X <- NULL # delete the first column

window_inf = matrix(0,43,1)
window_sup = matrix(0,44,1)

for (i in 1:43) 
  {window_inf[i]= 1 + sum(per48$V1[9:(8+i)])}


for (i in 1:44) 
  {window_sup[i]= sum(per48$V1[1:(7+i)])}

window_inf = rbind(1,window_inf);

#aux = c(1,2,4,5)
#aux2 = c(1,2,5,6,7)
aux3 = c(1,2,5,6,7)
aux4 = c(2,7,5,6)
aux5 = c(5,6,7)

comp = length(aux4)

# Empirical cumulative distribution function used to obtain uniformly distributed margins
empDist <- function(data)
{
  n <- length(data)
  cumdist <- seq(1/(n+1), n/(n+1), 1/(n+1))
  unif <- cumdist[rank(data)]
  unif
}

m = nrow(Rt);  n = ncol(div50); 
L = m; # m obs

#gfit_SP500 <- vector('list',window_inf[44]); 
gfit_1N <- vector('list',window_inf[44]); 

#coef
#coef_SP500 <- matrix(0,(window_inf[44]),7)
coef_1N <- matrix(0,(window_inf[44]),7)

#pval
#pval_SP500 <- matrix(0,(window_inf[44]),4)
pval_1N <- matrix(0,(window_inf[44]),4)

#residuals
#res_SP500 <- matrix(0,(window_inf[44]),1)
res_1N <- matrix(0,(window_inf[44]),1)

#sigma
#sig_SP500 <- matrix(0,(window_inf[44]),1)
sig_1N <- matrix(0,(window_inf[44]),1)

cl = makePSOCKcluster(2)

model=ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1), variance.targeting = TRUE),
                 mean.model = list(armaOrder = c(1, 0), include.mean=F), distribution.model = "sstd")

model1=ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1), variance.targeting = TRUE),
                  mean.model = list(armaOrder = c(1, 0), include.mean=T), distribution.model = "sstd")

model2=ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1), variance.targeting = TRUE),
                  mean.model = list(armaOrder = c(0, 0),include.mean = F), distribution.model = "sstd")

model3=ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(0, 0), variance.targeting = TRUE),
                  mean.model = list(armaOrder = c(1, 0), include.mean = T), distribution.model = "sstd")

model4=ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(0, 0)),
                  mean.model = list(armaOrder = c(1, 0), include.mean = F), distribution.model = "sstd")

model5=ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(0, 0), variance.targeting = TRUE),
                  mean.model = list(armaOrder = c(0, 0), include.mean = F), distribution.model = "sstd")


for (j in 1:43) {
  
  for (i in (window_inf[j]):(window_inf[j+1]-1)){
    
    cat("loop_i", i, "\n")
    
    gfit_1N[[i]]=ugarchfit(spec = model1, data = Rt[i:(per48$V4[j]+i-1),t(div50[i,])],solver="hybrid",cluster = cl)
    #gfit_SP500[[i]]=ugarchfit(spec = model1, data = SP500[i:(per48$V4[j]+i-1),],solver="hybrid",cluster = cl)
                                                }
  
                }


for (k in 1:43) {
  
  for (i in (window_inf[k]):(window_inf[k+1]-1)){
    
    cat("loop_i", i, "\n")
    
    
    for (l in 1:comp) {
      
      pval_1N[i,l]=gfit_1N[[i]]@fit$matcoef[l,4];
      #pval_SP500[i,l]=gfit_SP500[[i]]@fit$matcoef[l,4];
      
      
    }}}


for (k in 1:43) {
  
  for (i in (window_inf[k]):(window_inf[k+1]-1)){
    
    cat("loop_i", i, "\n")
    
    if (pval_1N[i,1]>0.01 && (pval_1N[i,2]<0.10) && (pval_1N[i,3]<0.10 || pval_1N[i,4]<0.10)) 
      
    {gfit_1N[[i]]=ugarchfit(spec = model, data = Rt[i:(per48$V4[k]+i-1),t(div50[i,])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      coef_1N[i,1] = 0; coef_1N[i,j] = gfit_1N[[i]]@fit$coef[j-1]; }}
    
    else if (pval_1N[i,1] < 0.01 && (pval_1N[i,2] < 0.10) && (pval_1N[i,2] < 0.10 || pval_1N[i,3] < 0.10))
    {gfit_1N[[i]] = gfit_1N[[i]]
    
    for (j in 1:7) { 
      
      coef_1N[i,j] = gfit_1N[[i]]@fit$coef[j]; }}
    
    else if (pval_1N[i,2] > 0.10 && (pval_1N[i,3] < 0.10 || pval_1N[i,4] < 0.10))
      
    {gfit_1N[[i]] = ugarchfit(spec = model2,data = Rt[i:(per48$V4[k]+i-1),t(div50[i,])],solver="hybrid",cluster = cl)
  
    for (j in 3:7) { 
      
      coef_1N[i,1] = coef_1N[i,2] = 0; coef_1N[i,j] = gfit_1N[[i]]@fit$coef[j-2]; }}
    
    
    else if (pval_1N[i,1] < 0.01 && (pval_1N[i,2] < 0.10) && (pval_1N[i,3] > 0.10 && pval_1N[i,4] > 0.10)) 
      
    {gfit_1N[[i]]=ugarchfit(spec = model3, data = Rt[i:(per48$V4[k]+i-1),t(div50[i,])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      coef_1N[i,3] = coef_1N[i,4] = 0; coef_1N[i,aux3[j]] = gfit_1N[[i]]@fit$coef[j]; }}
    
    
    else if (pval_1N[i,1] > 0.01 && (pval_1N[i,2] < 0.10) && (pval_1N[i,3] > 0.10 && pval_1N[i,4] > 0.10)) 
      
    {gfit_1N[[i]]=ugarchfit(spec = model4, data = Rt[i:(per48$V4[k]+i-1),t(div50[i,])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      coef_1N[i,1] = coef_1N[i,3] = coef_1N[i,4] = 0; coef_1N[i,aux4[j]] = gfit_1N[[i]]@fit$coef[j]; }}
    
    
    else {gfit_1N[[i]]=ugarchfit(spec = model5,data = Rt[i:(per48$V4[k]+i-1),t(div50[i,])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      coef_1N[i,1] = coef_1N[i,2] = coef_1N[i,3] = coef_1N[i,4] = 0; coef_1N[i,aux5[j]] = gfit_1N[[i]]@fit$coef[j]; }}
    
    for (j in 1:43) {
      
      # cat("loop_j", j, "\n")
      
      for (i in (window_inf[j]):(window_inf[j+1]-1)){
        
        cat("loop_j", j, "\n")
        
        res_1N[i] = tail(gfit_1N[[i]]@fit$residuals,1);}}
    
  } # end line 171
} # end line 169