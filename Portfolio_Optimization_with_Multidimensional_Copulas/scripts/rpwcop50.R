rm(list=ls())
# memory.limit(size=200000)

# load dataset and packages

library(fGarch)
library(fPortfolio)
library(copula)
library(QRM)
library(R.matlab)
library(psych)
library(readr)
library(rugarch)
library(imputeTS)
library(quantmod)
library(readxl)

Rt <- read.csv("D:\\Rt.csv", header = FALSE)
Rm <- read.csv("C:\\Users\\Fernando\\Desktop\\paper3\\revisao\\Rm.csv", header = FALSE)
Pt <- read.csv("C:\\Users\\Fernando\\Desktop\\paper3\\revisao\\Pt.csv", header = FALSE)

div50 <- read.csv("C:\\Users\\Fernando\\Desktop\\paper3\\div50_1706.csv", header = FALSE)
per48 <- read.csv("C:\\Users\\Fernando\\Desktop\\paper3\\Periods_48.csv", header = FALSE)

window = matrix(0,43,1)

for (i in 1:43) {window[i]= sum(per48[9:(8+i),1])}
int_w = rbind(0,window);

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

# bad programming, but I wanted to check one by one

gfit1 = vector('list',int_w[44]); gfit2 = vector('list',int_w[44]); gfit3 = vector('list',int_w[44]); 
gfit4 = vector('list',int_w[44]); gfit5 = vector('list',int_w[44]); gfit6 = vector('list',int_w[44]); 
gfit7 = vector('list',int_w[44]); gfit8 = vector('list',int_w[44]); gfit9 = vector('list',int_w[44]); 
gfit10 = vector('list',int_w[44]); gfit11 = vector('list',int_w[44]); gfit12 = vector('list',int_w[44]); 
gfit13 = vector('list',int_w[44]); gfit14 = vector('list',int_w[44]); gfit15 = vector('list',int_w[44]); 
gfit16 = vector('list',int_w[44]); gfit17 = vector('list',int_w[44]); gfit18 = vector('list',int_w[44]); 
gfit19 = vector('list',int_w[44]); gfit20 = vector('list',int_w[44]); gfit21 = vector('list',int_w[44]); 
gfit22 = vector('list',int_w[44]); gfit23 = vector('list',int_w[44]); gfit24 = vector('list',int_w[44]); 
gfit25 = vector('list',int_w[44]); gfit26 = vector('list',int_w[44]); gfit27 = vector('list',int_w[44]); 
gfit28 = vector('list',int_w[44]); gfit29 = vector('list',int_w[44]); gfit30 = vector('list',int_w[44]); 
gfit31 = vector('list',int_w[44]); gfit32 = vector('list',int_w[44]); gfit33 = vector('list',int_w[44]); 
gfit34 = vector('list',int_w[44]); gfit35 = vector('list',int_w[44]); gfit36 = vector('list',int_w[44]); 
gfit37 = vector('list',int_w[44]); gfit38 = vector('list',int_w[44]); gfit39 = vector('list',int_w[44]); 
gfit40 = vector('list',int_w[44]); gfit41 = vector('list',int_w[44]); gfit42 = vector('list',int_w[44]); 
gfit43 = vector('list',int_w[44]); gfit44 = vector('list',int_w[44]); gfit45 = vector('list',int_w[44]); 
gfit46 = vector('list',int_w[44]); gfit47 = vector('list',int_w[44]); gfit48 = vector('list',int_w[44]); 
gfit49 = vector('list',int_w[44]); gfit50 = vector('list',int_w[44]); 

#coef
c1<-c2<-c3<-c4<-c5<-c6<-c7<-c8<-c9<-c10<-matrix(0,(int_w[44]),7) 
c11<-c12<-c13<-c14<-c15<-c16<-c17<-c18<-c19<-c20<-matrix(0,(int_w[44]),7) 
c21<-c22<-c23<-c24<-c25<-c26<-c27<-c28<-c29<-c30<-matrix(0,(int_w[44]),7) 
c31<-c32<-c33<-c34<-c35<-c36<-c37<-c38<-c39<-c40<-matrix(0,(int_w[44]),7) 
c41<-c42<-c43<-c44<-c45<-c46<-c47<-c48<-c49<-c50<-matrix(0,(int_w[44]),7) 

#pval
p1<-p2<-p3<-p4<-p5<-p6<-p7<-p8<-p9<-p10<-matrix(0,(int_w[44]),4) 
p11<-p12<-p13<-p14<-p15<-p16<-p17<-p18<-p19<-p20<-matrix(0,(int_w[44]),4) 
p21<-p22<-p23<-p24<-p25<-p26<-p27<-p28<-p29<-p30<-matrix(0,(int_w[44]),4) 
p31<-p32<-p33<-p34<-p35<-p36<-p37<-p38<-p39<-p40<-matrix(0,(int_w[44]),4) 
p41<-p42<-p43<-p44<-p45<-p46<-p47<-p48<-p49<-p50<-matrix(0,(int_w[44]),4) 

#residuals
res1<-res2<-res3<-res4<-res5<-res6<-res7<-res8<-res9<-res10<-matrix(0,(int_w[44]),1) 
res11<-res12<-res13<-res14<-res15<-res16<-res17<-res18<-res19<-res20<-matrix(0,(int_w[44]),1) 
res21<-res22<-res23<-res24<-res25<-res26<-res27<-res28<-res29<-res30<-matrix(0,(int_w[44]),1) 
res31<-res32<-res33<-res34<-res35<-res36<-res37<-res38<-res39<-res40<-matrix(0,(int_w[44]),1) 
res41<-res42<-res43<-res44<-res45<-res46<-res47<-res48<-res49<-res50<-matrix(0,(int_w[44]),1) 


#sigma
sig1<-sig2<-sig3<-sig4<-sig5<-sig6<-sig7<-sig8<-sig9<-sig10<-matrix(0,(int_w[44]),1) 
sig11<-sig12<-sig13<-sig14<-sig15<-sig16<-sig17<-sig18<-sig19<-sig20<-matrix(0,(int_w[44]),1) 
sig21<-sig22<-sig23<-sig24<-sig25<-sig26<-sig27<-sig28<-sig29<-sig30<-matrix(0,(int_w[44]),1) 
sig31<-sig32<-sig33<-sig34<-sig35<-sig36<-sig37<-sig38<-sig39<-sig40<-matrix(0,(int_w[44]),1) 
sig41<-sig42<-sig43<-sig44<-sig45<-sig46<-sig47<-sig48<-sig49<-sig50<-matrix(0,(int_w[44]),1) 

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
  
  for (i in (int_w[j]+1):(int_w[j+1])){
    
    cat("loop_i", i, "\n")

    
    gfit1[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,1])],solver="hybrid",cluster = cl)
    gfit2[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,2])],solver="hybrid",cluster = cl)
    gfit3[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,3])],solver="hybrid",cluster = cl)
    gfit4[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,4])],solver="hybrid",cluster = cl)
    gfit5[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,5])],solver="hybrid",cluster = cl)
    gfit6[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,6])],solver="hybrid",cluster = cl)
    gfit7[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,7])],solver="hybrid",cluster = cl)
    gfit8[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,8])],solver="hybrid",cluster = cl)
    gfit9[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,9])],solver="hybrid",cluster = cl)
    gfit10[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,10])],solver="hybrid",cluster = cl)
    gfit11[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,11])],solver="hybrid",cluster = cl)
    gfit12[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,12])],solver="hybrid",cluster = cl)
    gfit13[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,13])],solver="hybrid",cluster = cl)
    gfit14[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,14])],solver="hybrid",cluster = cl)
    gfit15[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,15])],solver="hybrid",cluster = cl)
    gfit16[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,16])],solver="hybrid",cluster = cl)
    gfit17[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,17])],solver="hybrid",cluster = cl)
    gfit18[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,18])],solver="hybrid",cluster = cl)
    gfit19[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,19])],solver="hybrid",cluster = cl)
    gfit20[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,20])],solver="hybrid",cluster = cl)
    gfit21[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,21])],solver="hybrid",cluster = cl)
    gfit22[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,22])],solver="hybrid",cluster = cl)
    gfit23[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,23])],solver="hybrid",cluster = cl)
    gfit24[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,24])],solver="hybrid",cluster = cl)
    gfit25[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,25])],solver="hybrid",cluster = cl)
    gfit26[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,26])],solver="hybrid",cluster = cl)
    gfit27[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,27])],solver="hybrid",cluster = cl)
    gfit28[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,28])],solver="hybrid",cluster = cl)
    gfit29[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,29])],solver="hybrid",cluster = cl)
    gfit30[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,30])],solver="hybrid",cluster = cl)
    gfit31[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,31])],solver="hybrid",cluster = cl)
    gfit32[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,32])],solver="hybrid",cluster = cl)
    gfit33[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,33])],solver="hybrid",cluster = cl)
    gfit34[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,34])],solver="hybrid",cluster = cl)
    gfit35[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,35])],solver="hybrid",cluster = cl)
    gfit36[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,36])],solver="hybrid",cluster = cl)
    gfit37[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,37])],solver="hybrid",cluster = cl)
    gfit38[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,38])],solver="hybrid",cluster = cl)
    gfit39[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,39])],solver="hybrid",cluster = cl)
    gfit40[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,40])],solver="hybrid",cluster = cl)
    gfit41[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,41])],solver="hybrid",cluster = cl)
    gfit42[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,42])],solver="hybrid",cluster = cl)
    gfit43[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,43])],solver="hybrid",cluster = cl)
    gfit44[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,44])],solver="hybrid",cluster = cl)
    gfit45[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,45])],solver="hybrid",cluster = cl)
    gfit46[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,46])],solver="hybrid",cluster = cl)
    gfit47[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,47])],solver="hybrid",cluster = cl)
    gfit48[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,48])],solver="hybrid",cluster = cl)
    gfit49[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,49])],solver="hybrid",cluster = cl)
    gfit50[[i]]=ugarchfit(spec=model1,data=Rt[i:(per48[j,4]+i-1),t(div50[i,50])],solver="hybrid",cluster = cl)
    
    
  }
  
}


for (k in 1:43) {
  
  for (i in (int_w[k]+1):(int_w[k+1])){
    
    cat("loop_i", i, "\n")
    
    
    for (l in 1:comp) {
      
      p1[i,l]=gfit1[[i]]@fit$matcoef[l,4]; p2[i,l]=gfit2[[i]]@fit$matcoef[l,4]
      p3[i,l]=gfit3[[i]]@fit$matcoef[l,4]; p4[i,l]=gfit4[[i]]@fit$matcoef[l,4]
      p5[i,l]=gfit5[[i]]@fit$matcoef[l,4]; p6[i,l]=gfit6[[i]]@fit$matcoef[l,4]
      p7[i,l]=gfit7[[i]]@fit$matcoef[l,4]; p8[i,l]=gfit8[[i]]@fit$matcoef[l,4]
      p9[i,l]=gfit9[[i]]@fit$matcoef[l,4]; p10[i,l]=gfit10[[i]]@fit$matcoef[l,4]
      p11[i,l]=gfit11[[i]]@fit$matcoef[l,4]; p12[i,l]=gfit12[[i]]@fit$matcoef[l,4]
      p13[i,l]=gfit13[[i]]@fit$matcoef[l,4]; p14[i,l]=gfit14[[i]]@fit$matcoef[l,4]
      p15[i,l]=gfit15[[i]]@fit$matcoef[l,4]; p16[i,l]=gfit16[[i]]@fit$matcoef[l,4]
      p17[i,l]=gfit17[[i]]@fit$matcoef[l,4]; p18[i,l]=gfit18[[i]]@fit$matcoef[l,4]
      p19[i,l]=gfit19[[i]]@fit$matcoef[l,4]; p20[i,l]=gfit20[[i]]@fit$matcoef[l,4]
      p21[i,l]=gfit21[[i]]@fit$matcoef[l,4]; p22[i,l]=gfit22[[i]]@fit$matcoef[l,4]
      p23[i,l]=gfit23[[i]]@fit$matcoef[l,4]; p24[i,l]=gfit24[[i]]@fit$matcoef[l,4]
      p25[i,l]=gfit25[[i]]@fit$matcoef[l,4]; p26[i,l]=gfit26[[i]]@fit$matcoef[l,4]
      p27[i,l]=gfit27[[i]]@fit$matcoef[l,4]; p28[i,l]=gfit28[[i]]@fit$matcoef[l,4]
      p29[i,l]=gfit29[[i]]@fit$matcoef[l,4]; p30[i,l]=gfit30[[i]]@fit$matcoef[l,4]
      p31[i,l]=gfit31[[i]]@fit$matcoef[l,4]; p32[i,l]=gfit32[[i]]@fit$matcoef[l,4]
      p33[i,l]=gfit33[[i]]@fit$matcoef[l,4]; p34[i,l]=gfit34[[i]]@fit$matcoef[l,4]
      p35[i,l]=gfit35[[i]]@fit$matcoef[l,4]; p36[i,l]=gfit36[[i]]@fit$matcoef[l,4]
      p37[i,l]=gfit37[[i]]@fit$matcoef[l,4]; p38[i,l]=gfit38[[i]]@fit$matcoef[l,4]
      p39[i,l]=gfit39[[i]]@fit$matcoef[l,4]; p40[i,l]=gfit40[[i]]@fit$matcoef[l,4]
      p41[i,l]=gfit41[[i]]@fit$matcoef[l,4]; p42[i,l]=gfit42[[i]]@fit$matcoef[l,4]
      p43[i,l]=gfit43[[i]]@fit$matcoef[l,4]; p44[i,l]=gfit44[[i]]@fit$matcoef[l,4]
      p45[i,l]=gfit45[[i]]@fit$matcoef[l,4]; p46[i,l]=gfit46[[i]]@fit$matcoef[l,4]
      p47[i,l]=gfit47[[i]]@fit$matcoef[l,4]; p48[i,l]=gfit48[[i]]@fit$matcoef[l,4]
      p49[i,l]=gfit49[[i]]@fit$matcoef[l,4]; p50[i,l]=gfit50[[i]]@fit$matcoef[l,4]
      
    }}}


for (k in 1:43) {
  
  for (i in (int_w[k]+1):(int_w[k+1])){
    
    cat("loop_i", i, "\n")
    
    if (p1[i,1]>0.01 && (p1[i,2]<0.10) && (p1[i,3]<0.10 || p1[i,4]<0.10)) 
      
    {gfit1[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,1])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c1[i,1]=0; c1[i,j]=gfit1[[i]]@fit$coef[j-1]; }}
    
    else if (p1[i,1]<0.01 && (p1[i,2]<0.10) && (p1[i,2]<0.10 || p1[i,3]<0.10))
    {gfit1[[i]]=gfit1[[i]]
    
    for (j in 1:7) { 
      
      c1[i,j]=gfit1[[i]]@fit$coef[j]; }}
    
    else if (p1[i,2]>0.10 && (p1[i,3]<0.10 || p1[i,4]<0.10))
      
    {gfit1[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,1])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c1[i,1]=c1[i,2]=0;c1[i,j]=gfit1[[i]]@fit$coef[j-2]; }}
    
    
    else if (p1[i,1]<0.01 && (p1[i,2]<0.10) && (p1[i,3]>0.10 && p1[i,4]>0.10)) 
      
    {gfit1[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,1])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c1[i,3]=c1[i,4]=0; c1[i,aux3[j]]=gfit1[[i]]@fit$coef[j]; }}
    
    
    else if (p1[i,1]>0.01 && (p1[i,2]<0.10) && (p1[i,3]>0.10 && p1[i,4]>0.10)) 
      
    {gfit1[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,1])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c1[i,1]=c1[i,3]=c1[i,4]=0; c1[i,aux4[j]]=gfit1[[i]]@fit$coef[j]; }}
    
    
    else {gfit1[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,1])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c1[i,1]=c1[i,2]= c1[i,3]= c1[i,4]=0; c1[i,aux5[j]]=gfit1[[i]]@fit$coef[j]; }}
    
    
    
    
    if (p2[i,1]>0.01 && (p2[i,2]<0.10) && (p2[i,3]<0.10 || p2[i,4]<0.10)) 
      
    {gfit2[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,2])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c2[i,1]=0; c2[i,j]=gfit2[[i]]@fit$coef[j-1]; }}
    
    else if (p2[i,1]<0.01 && (p2[i,2]<0.10) && (p2[i,2]<0.10 || p2[i,3]<0.10))
    {gfit2[[i]]=gfit2[[i]]
    
    for (j in 1:7) { 
      
      c2[i,j]=gfit2[[i]]@fit$coef[j]; }}
    
    else if (p2[i,2]>0.10 && (p2[i,3]<0.10 || p2[i,4]<0.10))
      
    {gfit2[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,2])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c2[i,1]=c2[i,2]=0;c2[i,j]=gfit2[[i]]@fit$coef[j-2]; }}
    
    
    else if (p2[i,1]<0.01 && (p2[i,2]<0.10) && (p2[i,3]>0.10 && p2[i,4]>0.10)) 
      
    {gfit2[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,2])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c2[i,3]=c2[i,4]=0; c2[i,aux3[j]]=gfit2[[i]]@fit$coef[j]; }}
    
    
    else if (p2[i,1]>0.01 && (p2[i,2]<0.10) && (p2[i,3]>0.10 && p2[i,4]>0.10)) 
      
    {gfit2[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,2])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c2[i,1]=c2[i,3]=c2[i,4]=0; c2[i,aux4[j]]=gfit2[[i]]@fit$coef[j]; }}
    
    
    else {gfit2[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,2])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c2[i,1]=c2[i,2]= c2[i,3]= c2[i,4]=0; c2[i,aux5[j]]=gfit2[[i]]@fit$coef[j]; }}
    
    
    if (p3[i,1]>0.01 && (p3[i,2]<0.10) && (p3[i,3]<0.10 || p3[i,4]<0.10)) 
      
    {gfit3[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,3])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c3[i,1]=0; c3[i,j]=gfit3[[i]]@fit$coef[j-1]; }}
    
    else if (p3[i,1]<0.01 && (p3[i,2]<0.10) && (p3[i,2]<0.10 || p3[i,3]<0.10))
    {gfit3[[i]]=gfit3[[i]]
    
    for (j in 1:7) { 
      
      c3[i,j]=gfit3[[i]]@fit$coef[j]; }}
    
    else if (p3[i,2]>0.10 && (p3[i,3]<0.10 || p3[i,4]<0.10))
      
    {gfit3[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,3])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c3[i,1]=c3[i,2]=0;c3[i,j]=gfit3[[i]]@fit$coef[j-2]; }}
    
    
    else if (p3[i,1]<0.01 && (p3[i,2]<0.10) && (p3[i,3]>0.10 && p3[i,4]>0.10)) 
      
    {gfit3[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,3])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c3[i,3]=c3[i,4]=0; c3[i,aux3[j]]=gfit3[[i]]@fit$coef[j]; }}
    
    
    else if (p3[i,1]>0.01 && (p3[i,2]<0.10) && (p3[i,3]>0.10 && p3[i,4]>0.10)) 
      
    {gfit3[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,3])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c3[i,1]=c3[i,3]=c3[i,4]=0; c3[i,aux4[j]]=gfit3[[i]]@fit$coef[j]; }}
    
    
    else {gfit3[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,3])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c3[i,1]=c3[i,2]= c3[i,3]= c3[i,4]=0; c3[i,aux5[j]]=gfit3[[i]]@fit$coef[j]; }}
    
    if (p4[i,1]>0.01 && (p4[i,2]<0.10) && (p4[i,3]<0.10 || p4[i,4]<0.10)) 
      
    {gfit4[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,4])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c4[i,1]=0; c4[i,j]=gfit4[[i]]@fit$coef[j-1]; }}
    
    else if (p4[i,1]<0.01 && (p4[i,2]<0.10) && (p4[i,2]<0.10 || p4[i,3]<0.10))
    {gfit4[[i]]=gfit4[[i]]
    
    for (j in 1:7) { 
      
      c4[i,j]=gfit4[[i]]@fit$coef[j]; }}
    
    else if (p4[i,2]>0.10 && (p4[i,3]<0.10 || p4[i,4]<0.10))
      
    {gfit4[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,4])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c4[i,1]=c4[i,2]=0;c4[i,j]=gfit4[[i]]@fit$coef[j-2]; }}
    
    
    else if (p4[i,1]<0.01 && (p4[i,2]<0.10) && (p4[i,3]>0.10 && p4[i,4]>0.10)) 
      
    {gfit4[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,4])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c4[i,3]=c4[i,4]=0; c4[i,aux3[j]]=gfit4[[i]]@fit$coef[j]; }}
    
    
    else if (p4[i,1]>0.01 && (p4[i,2]<0.10) && (p4[i,3]>0.10 && p4[i,4]>0.10)) 
      
    {gfit4[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,4])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c4[i,1]=c4[i,3]=c4[i,4]=0; c4[i,aux4[j]]=gfit4[[i]]@fit$coef[j]; }}
    
    
    else {gfit4[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,4])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c4[i,1]=c4[i,2]= c4[i,3]= c4[i,4]=0; c4[i,aux5[j]]=gfit4[[i]]@fit$coef[j]; }}
    
    
    
    if (p5[i,1]>0.01 && (p5[i,2]<0.10) && (p5[i,3]<0.10 || p5[i,4]<0.10)) 
      
    {gfit5[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,5])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c5[i,1]=0; c5[i,j]=gfit5[[i]]@fit$coef[j-1]; }}
    
    else if (p5[i,1]<0.01 && (p5[i,2]<0.10) && (p5[i,2]<0.10 || p5[i,3]<0.10))
    {gfit5[[i]]=gfit5[[i]]
    
    for (j in 1:7) { 
      
      c5[i,j]=gfit5[[i]]@fit$coef[j]; }}
    
    else if (p5[i,2]>0.10 && (p5[i,3]<0.10 || p5[i,4]<0.10))
      
    {gfit5[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,5])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c5[i,1]=c5[i,2]=0;c5[i,j]=gfit5[[i]]@fit$coef[j-2]; }}
    
    
    else if (p5[i,1]<0.01 && (p5[i,2]<0.10) && (p5[i,3]>0.10 && p5[i,4]>0.10)) 
      
    {gfit5[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,5])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c5[i,3]=c5[i,4]=0; c5[i,aux3[j]]=gfit5[[i]]@fit$coef[j]; }}
    
    
    else if (p5[i,1]>0.01 && (p5[i,2]<0.10) && (p5[i,3]>0.10 && p5[i,4]>0.10)) 
      
    {gfit5[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,5])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c5[i,1]=c5[i,3]=c5[i,4]=0; c5[i,aux4[j]]=gfit5[[i]]@fit$coef[j]; }}
    
    
    else {gfit5[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,5])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c5[i,1]=c5[i,2]= c5[i,3]= c5[i,4]=0; c5[i,aux5[j]]=gfit5[[i]]@fit$coef[j]; }}
    
    
    if (p6[i,1]>0.01 && (p6[i,2]<0.10) && (p6[i,3]<0.10 || p6[i,4]<0.10)) 
      
    {gfit6[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,6])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c6[i,1]=0; c6[i,j]=gfit6[[i]]@fit$coef[j-1]; }}
    
    else if (p6[i,1]<0.01 && (p6[i,2]<0.10) && (p6[i,2]<0.10 || p6[i,3]<0.10))
    {gfit6[[i]]=gfit6[[i]]
    
    for (j in 1:7) { 
      
      c6[i,j]=gfit6[[i]]@fit$coef[j]; }}
    
    else if (p6[i,2]>0.10 && (p6[i,3]<0.10 || p6[i,4]<0.10))
      
    {gfit6[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,6])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c6[i,1]=c6[i,2]=0;c6[i,j]=gfit6[[i]]@fit$coef[j-2]; }}
    
    
    else if (p6[i,1]<0.01 && (p6[i,2]<0.10) && (p6[i,3]>0.10 && p6[i,4]>0.10)) 
      
    {gfit6[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,6])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c6[i,3]=c6[i,4]=0; c6[i,aux3[j]]=gfit6[[i]]@fit$coef[j]; }}
    
    
    else if (p6[i,1]>0.01 && (p6[i,2]<0.10) && (p6[i,3]>0.10 && p6[i,4]>0.10)) 
      
    {gfit6[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,6])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c6[i,1]=c6[i,3]=c6[i,4]=0; c6[i,aux4[j]]=gfit6[[i]]@fit$coef[j]; }}
    
    
    else {gfit6[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,6])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c6[i,1]=c6[i,2]= c6[i,3]= c6[i,4]=0; c6[i,aux5[j]]=gfit6[[i]]@fit$coef[j]; }}
    
    if (p7[i,1]>0.01 && (p7[i,2]<0.10) && (p7[i,3]<0.10 || p7[i,4]<0.10)) 
      
    {gfit7[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,7])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c7[i,1]=0; c7[i,j]=gfit7[[i]]@fit$coef[j-1]; }}
    
    else if (p7[i,1]<0.01 && (p7[i,2]<0.10) && (p7[i,2]<0.10 || p7[i,3]<0.10))
    {gfit7[[i]]=gfit7[[i]]
    
    for (j in 1:7) { 
      
      c7[i,j]=gfit7[[i]]@fit$coef[j]; }}
    
    else if (p7[i,2]>0.10 && (p7[i,3]<0.10 || p7[i,4]<0.10))
      
    {gfit7[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,7])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c7[i,1]=c7[i,2]=0;c7[i,j]=gfit7[[i]]@fit$coef[j-2]; }}
    
    
    else if (p7[i,1]<0.01 && (p7[i,2]<0.10) && (p7[i,3]>0.10 && p7[i,4]>0.10)) 
      
    {gfit7[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,7])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c7[i,3]=c7[i,4]=0; c7[i,aux3[j]]=gfit7[[i]]@fit$coef[j]; }}
    
    
    else if (p7[i,1]>0.01 && (p7[i,2]<0.10) && (p7[i,3]>0.10 && p7[i,4]>0.10)) 
      
    {gfit7[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,7])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c7[i,1]=c7[i,3]=c7[i,4]=0; c7[i,aux4[j]]=gfit7[[i]]@fit$coef[j]; }}
    
    
    else {gfit7[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,7])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c7[i,1]=c7[i,2]= c7[i,3]= c7[i,4]=0; c7[i,aux5[j]]=gfit7[[i]]@fit$coef[j]; }}
    
    
    
    if (p8[i,1]>0.01 && (p8[i,2]<0.10) && (p8[i,3]<0.10 || p8[i,4]<0.10)) 
      
    {gfit8[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,8])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c8[i,1]=0; c8[i,j]=gfit8[[i]]@fit$coef[j-1]; }}
    
    else if (p8[i,1]<0.01 && (p8[i,2]<0.10) && (p8[i,2]<0.10 || p8[i,3]<0.10))
    {gfit8[[i]]=gfit8[[i]]
    
    for (j in 1:7) { 
      
      c8[i,j]=gfit8[[i]]@fit$coef[j]; }}
    
    else if (p8[i,2]>0.10 && (p8[i,3]<0.10 || p8[i,4]<0.10))
      
    {gfit8[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,8])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c8[i,1]=c8[i,2]=0;c8[i,j]=gfit8[[i]]@fit$coef[j-2]; }}
    
    
    else if (p8[i,1]<0.01 && (p8[i,2]<0.10) && (p8[i,3]>0.10 && p8[i,4]>0.10)) 
      
    {gfit8[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,8])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c8[i,3]=c8[i,4]=0; c8[i,aux3[j]]=gfit8[[i]]@fit$coef[j]; }}
    
    
    else if (p8[i,1]>0.01 && (p8[i,2]<0.10) && (p8[i,3]>0.10 && p8[i,4]>0.10)) 
      
    {gfit8[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,8])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c8[i,1]=c8[i,3]=c8[i,4]=0; c8[i,aux4[j]]=gfit8[[i]]@fit$coef[j]; }}
    
    
    else {gfit8[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,8])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c8[i,1]=c8[i,2]= c8[i,3]= c8[i,4]=0; c8[i,aux5[j]]=gfit8[[i]]@fit$coef[j]; }}
    
    
    if (p9[i,1]>0.01 && (p9[i,2]<0.10) && (p9[i,3]<0.10 || p9[i,4]<0.10)) 
      
    {gfit9[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,9])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c9[i,1]=0; c9[i,j]=gfit9[[i]]@fit$coef[j-1]; }}
    
    else if (p9[i,1]<0.01 && (p9[i,2]<0.10) && (p9[i,2]<0.10 || p9[i,3]<0.10))
    {gfit9[[i]]=gfit9[[i]]
    
    for (j in 1:7) { 
      
      c9[i,j]=gfit9[[i]]@fit$coef[j]; }}
    
    else if (p9[i,2]>0.10 && (p9[i,3]<0.10 || p9[i,4]<0.10))
      
    {gfit9[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,9])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c9[i,1]=c9[i,2]=0;c9[i,j]=gfit9[[i]]@fit$coef[j-2]; }}
    
    
    else if (p9[i,1]<0.01 && (p9[i,2]<0.10) && (p9[i,3]>0.10 && p9[i,4]>0.10)) 
      
    {gfit9[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,9])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c9[i,3]=c9[i,4]=0; c9[i,aux3[j]]=gfit9[[i]]@fit$coef[j]; }}
    
    
    else if (p9[i,1]>0.01 && (p9[i,2]<0.10) && (p9[i,3]>0.10 && p9[i,4]>0.10)) 
      
    {gfit9[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,9])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c9[i,1]=c9[i,3]=c9[i,4]=0; c9[i,aux4[j]]=gfit9[[i]]@fit$coef[j]; }}
    
    
    else {gfit9[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,9])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c9[i,1]=c9[i,2]= c9[i,3]= c9[i,4]=0; c9[i,aux5[j]]=gfit9[[i]]@fit$coef[j]; }}
    
    if (p10[i,1]>0.01 && (p10[i,2]<0.10) && (p10[i,3]<0.10 || p10[i,4]<0.10)) 
      
    {gfit10[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,10])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c10[i,1]=0; c10[i,j]=gfit10[[i]]@fit$coef[j-1]; }}
    
    else if (p10[i,1]<0.01 && (p10[i,2]<0.10) && (p10[i,2]<0.10 || p10[i,3]<0.10))
    {gfit10[[i]]=gfit10[[i]]
    
    for (j in 1:7) { 
      
      c10[i,j]=gfit10[[i]]@fit$coef[j]; }}
    
    else if (p10[i,2]>0.10 && (p10[i,3]<0.10 || p10[i,4]<0.10))
      
    {gfit10[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,10])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c10[i,1]=c10[i,2]=0;c10[i,j]=gfit10[[i]]@fit$coef[j-2]; }}
    
    
    else if (p10[i,1]<0.01 && (p10[i,2]<0.10) && (p10[i,3]>0.10 && p10[i,4]>0.10)) 
      
    {gfit10[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,10])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c10[i,3]=c10[i,4]=0; c10[i,aux3[j]]=gfit10[[i]]@fit$coef[j]; }}
    
    
    else if (p10[i,1]>0.01 && (p10[i,2]<0.10) && (p10[i,3]>0.10 && p10[i,4]>0.10)) 
      
    {gfit10[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,10])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c10[i,1]=c10[i,3]=c10[i,4]=0; c10[i,aux4[j]]=gfit10[[i]]@fit$coef[j]; }}
    
    
    else {gfit10[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,10])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c10[i,1]=c10[i,2]= c10[i,3]= c10[i,4]=0; c10[i,aux5[j]]=gfit10[[i]]@fit$coef[j]; }}
    
    
    
    if (p11[i,1]>0.01 && (p11[i,2]<0.10) && (p11[i,3]<0.10 || p11[i,4]<0.10)) 
      
    {gfit11[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,11])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c11[i,1]=0; c11[i,j]=gfit11[[i]]@fit$coef[j-1]; }}
    
    else if (p11[i,1]<0.01 && (p11[i,2]<0.10) && (p11[i,2]<0.10 || p11[i,3]<0.10))
    {gfit11[[i]]=gfit11[[i]]
    
    for (j in 1:7) { 
      
      c11[i,j]=gfit11[[i]]@fit$coef[j]; }}
    
    else if (p11[i,2]>0.10 && (p11[i,3]<0.10 || p11[i,4]<0.10))
      
    {gfit11[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,11])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c11[i,1]=c11[i,2]=0;c11[i,j]=gfit11[[i]]@fit$coef[j-2]; }}
    
    
    else if (p11[i,1]<0.01 && (p11[i,2]<0.10) && (p11[i,3]>0.10 && p11[i,4]>0.10)) 
      
    {gfit11[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,11])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c11[i,3]=c11[i,4]=0; c11[i,aux3[j]]=gfit11[[i]]@fit$coef[j]; }}
    
    
    else if (p11[i,1]>0.01 && (p11[i,2]<0.10) && (p11[i,3]>0.10 && p11[i,4]>0.10)) 
      
    {gfit11[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,11])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c11[i,1]=c11[i,3]=c11[i,4]=0; c11[i,aux4[j]]=gfit11[[i]]@fit$coef[j]; }}
    
    
    else {gfit11[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,11])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c11[i,1]=c11[i,2]= c11[i,3]= c11[i,4]=0; c11[i,aux5[j]]=gfit11[[i]]@fit$coef[j]; }}
    
    
    if (p12[i,1]>0.01 && (p12[i,2]<0.10) && (p12[i,3]<0.10 || p12[i,4]<0.10)) 
      
    {gfit12[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,12])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c12[i,1]=0; c12[i,j]=gfit12[[i]]@fit$coef[j-1]; }}
    
    else if (p12[i,1]<0.01 && (p12[i,2]<0.10) && (p12[i,2]<0.10 || p12[i,3]<0.10))
    {gfit12[[i]]=gfit12[[i]]
    
    for (j in 1:7) { 
      
      c12[i,j]=gfit12[[i]]@fit$coef[j]; }}
    
    else if (p12[i,2]>0.10 && (p12[i,3]<0.10 || p12[i,4]<0.10))
      
    {gfit12[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,12])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c12[i,1]=c12[i,2]=0;c12[i,j]=gfit12[[i]]@fit$coef[j-2]; }}
    
    
    else if (p12[i,1]<0.01 && (p12[i,2]<0.10) && (p12[i,3]>0.10 && p12[i,4]>0.10)) 
      
    {gfit12[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,12])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c12[i,3]=c12[i,4]=0; c12[i,aux3[j]]=gfit12[[i]]@fit$coef[j]; }}
    
    
    else if (p12[i,1]>0.01 && (p12[i,2]<0.10) && (p12[i,3]>0.10 && p12[i,4]>0.10)) 
      
    {gfit12[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,12])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c12[i,1]=c12[i,3]=c12[i,4]=0; c12[i,aux4[j]]=gfit12[[i]]@fit$coef[j]; }}
    
    
    else {gfit12[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,12])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c12[i,1]=c12[i,2]= c12[i,3]= c12[i,4]=0; c12[i,aux5[j]]=gfit12[[i]]@fit$coef[j]; }}
    
    if (p13[i,1]>0.01 && (p13[i,2]<0.10) && (p13[i,3]<0.10 || p13[i,4]<0.10)) 
      
    {gfit13[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,13])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c13[i,1]=0; c13[i,j]=gfit13[[i]]@fit$coef[j-1]; }}
    
    else if (p13[i,1]<0.01 && (p13[i,2]<0.10) && (p13[i,2]<0.10 || p13[i,3]<0.10))
    {gfit13[[i]]=gfit13[[i]]
    
    for (j in 1:7) { 
      
      c13[i,j]=gfit13[[i]]@fit$coef[j]; }}
    
    else if (p13[i,2]>0.10 && (p13[i,3]<0.10 || p13[i,4]<0.10))
      
    {gfit13[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,13])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c13[i,1]=c13[i,2]=0;c13[i,j]=gfit13[[i]]@fit$coef[j-2]; }}
    
    
    else if (p13[i,1]<0.01 && (p13[i,2]<0.10) && (p13[i,3]>0.10 && p13[i,4]>0.10)) 
      
    {gfit13[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,13])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c13[i,3]=c13[i,4]=0; c13[i,aux3[j]]=gfit13[[i]]@fit$coef[j]; }}
    
    
    else if (p13[i,1]>0.01 && (p13[i,2]<0.10) && (p13[i,3]>0.10 && p13[i,4]>0.10)) 
      
    {gfit13[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,13])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c13[i,1]=c13[i,3]=c13[i,4]=0; c13[i,aux4[j]]=gfit13[[i]]@fit$coef[j]; }}
    
    
    else {gfit13[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,13])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c13[i,1]=c13[i,2]= c13[i,3]= c13[i,4]=0; c13[i,aux5[j]]=gfit13[[i]]@fit$coef[j]; }}
    
    
    
    if (p14[i,1]>0.01 && (p14[i,2]<0.10) && (p14[i,3]<0.10 || p14[i,4]<0.10)) 
      
    {gfit14[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,14])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c14[i,1]=0; c14[i,j]=gfit14[[i]]@fit$coef[j-1]; }}
    
    else if (p14[i,1]<0.01 && (p14[i,2]<0.10) && (p14[i,2]<0.10 || p14[i,3]<0.10))
    {gfit14[[i]]=gfit14[[i]]
    
    for (j in 1:7) { 
      
      c14[i,j]=gfit14[[i]]@fit$coef[j]; }}
    
    else if (p14[i,2]>0.10 && (p14[i,3]<0.10 || p14[i,4]<0.10))
      
    {gfit14[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,14])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c14[i,1]=c14[i,2]=0;c14[i,j]=gfit14[[i]]@fit$coef[j-2]; }}
    
    
    else if (p14[i,1]<0.01 && (p14[i,2]<0.10) && (p14[i,3]>0.10 && p14[i,4]>0.10)) 
      
    {gfit14[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,14])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c14[i,3]=c14[i,4]=0; c14[i,aux3[j]]=gfit14[[i]]@fit$coef[j]; }}
    
    
    else if (p14[i,1]>0.01 && (p14[i,2]<0.10) && (p14[i,3]>0.10 && p14[i,4]>0.10)) 
      
    {gfit14[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,14])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c14[i,1]=c14[i,3]=c14[i,4]=0; c14[i,aux4[j]]=gfit14[[i]]@fit$coef[j]; }}
    
    
    else {gfit14[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,14])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c14[i,1]=c14[i,2]= c14[i,3]= c14[i,4]=0; c14[i,aux5[j]]=gfit14[[i]]@fit$coef[j]; }}
    
    
    if (p15[i,1]>0.01 && (p15[i,2]<0.10) && (p15[i,3]<0.10 || p15[i,4]<0.10)) 
      
    {gfit15[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,15])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c15[i,1]=0; c15[i,j]=gfit15[[i]]@fit$coef[j-1]; }}
    
    else if (p15[i,1]<0.01 && (p15[i,2]<0.10) && (p15[i,2]<0.10 || p15[i,3]<0.10))
    {gfit15[[i]]=gfit15[[i]]
    
    for (j in 1:7) { 
      
      c15[i,j]=gfit15[[i]]@fit$coef[j]; }}
    
    else if (p15[i,2]>0.10 && (p15[i,3]<0.10 || p15[i,4]<0.10))
      
    {gfit15[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,15])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c15[i,1]=c15[i,2]=0;c15[i,j]=gfit15[[i]]@fit$coef[j-2]; }}
    
    
    else if (p15[i,1]<0.01 && (p15[i,2]<0.10) && (p15[i,3]>0.10 && p15[i,4]>0.10)) 
      
    {gfit15[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,15])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c15[i,3]=c15[i,4]=0; c15[i,aux3[j]]=gfit15[[i]]@fit$coef[j]; }}
    
    
    else if (p15[i,1]>0.01 && (p15[i,2]<0.10) && (p15[i,3]>0.10 && p15[i,4]>0.10)) 
      
    {gfit15[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,15])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c15[i,1]=c15[i,3]=c15[i,4]=0; c15[i,aux4[j]]=gfit15[[i]]@fit$coef[j]; }}
    
    
    else {gfit15[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,15])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c15[i,1]=c15[i,2]= c15[i,3]= c15[i,4]=0; c15[i,aux5[j]]=gfit15[[i]]@fit$coef[j]; }}
    
    if (p16[i,1]>0.01 && (p16[i,2]<0.10) && (p16[i,3]<0.10 || p16[i,4]<0.10)) 
      
    {gfit16[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,16])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c16[i,1]=0; c16[i,j]=gfit16[[i]]@fit$coef[j-1]; }}
    
    else if (p16[i,1]<0.01 && (p16[i,2]<0.10) && (p16[i,2]<0.10 || p16[i,3]<0.10))
    {gfit16[[i]]=gfit16[[i]]
    
    for (j in 1:7) { 
      
      c16[i,j]=gfit16[[i]]@fit$coef[j]; }}
    
    else if (p16[i,2]>0.10 && (p16[i,3]<0.10 || p16[i,4]<0.10))
      
    {gfit16[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,16])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c16[i,1]=c16[i,2]=0;c16[i,j]=gfit16[[i]]@fit$coef[j-2]; }}
    
    
    else if (p16[i,1]<0.01 && (p16[i,2]<0.10) && (p16[i,3]>0.10 && p16[i,4]>0.10)) 
      
    {gfit16[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,16])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c16[i,3]=c16[i,4]=0; c16[i,aux3[j]]=gfit16[[i]]@fit$coef[j]; }}
    
    
    else if (p16[i,1]>0.01 && (p16[i,2]<0.10) && (p16[i,3]>0.10 && p16[i,4]>0.10)) 
      
    {gfit16[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,16])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c16[i,1]=c16[i,3]=c16[i,4]=0; c16[i,aux4[j]]=gfit16[[i]]@fit$coef[j]; }}
    
    
    else {gfit16[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,16])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c16[i,1]=c16[i,2]= c16[i,3]= c16[i,4]=0; c16[i,aux5[j]]=gfit16[[i]]@fit$coef[j]; }}
    
    
    
    if (p17[i,1]>0.01 && (p17[i,2]<0.10) && (p17[i,3]<0.10 || p17[i,4]<0.10)) 
      
    {gfit17[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,17])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c17[i,1]=0; c17[i,j]=gfit17[[i]]@fit$coef[j-1]; }}
    
    else if (p17[i,1]<0.01 && (p17[i,2]<0.10) && (p17[i,2]<0.10 || p17[i,3]<0.10))
    {gfit17[[i]]=gfit17[[i]]
    
    for (j in 1:7) { 
      
      c17[i,j]=gfit17[[i]]@fit$coef[j]; }}
    
    else if (p17[i,2]>0.10 && (p17[i,3]<0.10 || p17[i,4]<0.10))
      
    {gfit17[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,17])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c17[i,1]=c17[i,2]=0;c17[i,j]=gfit17[[i]]@fit$coef[j-2]; }}
    
    
    else if (p17[i,1]<0.01 && (p17[i,2]<0.10) && (p17[i,3]>0.10 && p17[i,4]>0.10)) 
      
    {gfit17[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,17])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c17[i,3]=c17[i,4]=0; c17[i,aux3[j]]=gfit17[[i]]@fit$coef[j]; }}
    
    
    else if (p17[i,1]>0.01 && (p17[i,2]<0.10) && (p17[i,3]>0.10 && p17[i,4]>0.10)) 
      
    {gfit17[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,17])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c17[i,1]=c17[i,3]=c17[i,4]=0; c17[i,aux4[j]]=gfit17[[i]]@fit$coef[j]; }}
    
    
    else {gfit17[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,17])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c17[i,1]=c17[i,2]= c17[i,3]= c17[i,4]=0; c17[i,aux5[j]]=gfit17[[i]]@fit$coef[j]; }}
    
    
    if (p18[i,1]>0.01 && (p18[i,2]<0.10) && (p18[i,3]<0.10 || p18[i,4]<0.10)) 
      
    {gfit18[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,18])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c18[i,1]=0; c18[i,j]=gfit18[[i]]@fit$coef[j-1]; }}
    
    else if (p18[i,1]<0.01 && (p18[i,2]<0.10) && (p18[i,2]<0.10 || p18[i,3]<0.10))
    {gfit18[[i]]=gfit18[[i]]
    
    for (j in 1:7) { 
      
      c18[i,j]=gfit18[[i]]@fit$coef[j]; }}
    
    else if (p18[i,2]>0.10 && (p18[i,3]<0.10 || p18[i,4]<0.10))
      
    {gfit18[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,18])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c18[i,1]=c18[i,2]=0;c18[i,j]=gfit18[[i]]@fit$coef[j-2]; }}
    
    
    else if (p18[i,1]<0.01 && (p18[i,2]<0.10) && (p18[i,3]>0.10 && p18[i,4]>0.10)) 
      
    {gfit18[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,18])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c18[i,3]=c18[i,4]=0; c18[i,aux3[j]]=gfit18[[i]]@fit$coef[j]; }}
    
    
    else if (p18[i,1]>0.01 && (p18[i,2]<0.10) && (p18[i,3]>0.10 && p18[i,4]>0.10)) 
      
    {gfit18[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,18])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c18[i,1]=c18[i,3]=c18[i,4]=0; c18[i,aux4[j]]=gfit18[[i]]@fit$coef[j]; }}
    
    
    else {gfit18[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,18])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c18[i,1]=c18[i,2]= c18[i,3]= c18[i,4]=0; c18[i,aux5[j]]=gfit18[[i]]@fit$coef[j]; }}
    
    if (p19[i,1]>0.01 && (p19[i,2]<0.10) && (p19[i,3]<0.10 || p19[i,4]<0.10)) 
      
    {gfit19[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,19])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c19[i,1]=0; c19[i,j]=gfit19[[i]]@fit$coef[j-1]; }}
    
    else if (p19[i,1]<0.01 && (p19[i,2]<0.10) && (p19[i,2]<0.10 || p19[i,3]<0.10))
    {gfit19[[i]]=gfit19[[i]]
    
    for (j in 1:7) { 
      
      c19[i,j]=gfit19[[i]]@fit$coef[j]; }}
    
    else if (p19[i,2]>0.10 && (p19[i,3]<0.10 || p19[i,4]<0.10))
      
    {gfit19[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,19])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c19[i,1]=c19[i,2]=0;c19[i,j]=gfit19[[i]]@fit$coef[j-2]; }}
    
    
    else if (p19[i,1]<0.01 && (p19[i,2]<0.10) && (p19[i,3]>0.10 && p19[i,4]>0.10)) 
      
    {gfit19[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,19])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c19[i,3]=c19[i,4]=0; c19[i,aux3[j]]=gfit19[[i]]@fit$coef[j]; }}
    
    
    else if (p19[i,1]>0.01 && (p19[i,2]<0.10) && (p19[i,3]>0.10 && p19[i,4]>0.10)) 
      
    {gfit19[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,19])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c19[i,1]=c19[i,3]=c19[i,4]=0; c19[i,aux4[j]]=gfit19[[i]]@fit$coef[j]; }}
    
    
    else {gfit19[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,19])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c19[i,1]=c19[i,2]= c19[i,3]= c19[i,4]=0; c19[i,aux5[j]]=gfit19[[i]]@fit$coef[j]; }}
    
    
    
    if (p20[i,1]>0.01 && (p20[i,2]<0.10) && (p20[i,3]<0.10 || p20[i,4]<0.10)) 
      
    {gfit20[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,20])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c20[i,1]=0; c20[i,j]=gfit20[[i]]@fit$coef[j-1]; }}
    
    else if (p20[i,1]<0.01 && (p20[i,2]<0.10) && (p20[i,2]<0.10 || p20[i,3]<0.10))
    {gfit20[[i]]=gfit20[[i]]
    
    for (j in 1:7) { 
      
      c20[i,j]=gfit20[[i]]@fit$coef[j]; }}
    
    else if (p20[i,2]>0.10 && (p20[i,3]<0.10 || p20[i,4]<0.10))
      
    {gfit20[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,20])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c20[i,1]=c20[i,2]=0;c20[i,j]=gfit20[[i]]@fit$coef[j-2]; }}
    
    
    else if (p20[i,1]<0.01 && (p20[i,2]<0.10) && (p20[i,3]>0.10 && p20[i,4]>0.10)) 
      
    {gfit20[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,20])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c20[i,3]=c20[i,4]=0; c20[i,aux3[j]]=gfit20[[i]]@fit$coef[j]; }}
    
    
    else if (p20[i,1]>0.01 && (p20[i,2]<0.10) && (p20[i,3]>0.10 && p20[i,4]>0.10)) 
      
    {gfit20[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,20])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c20[i,1]=c20[i,3]=c20[i,4]=0; c20[i,aux4[j]]=gfit20[[i]]@fit$coef[j]; }}
    
    
    else {gfit20[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,20])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c20[i,1]=c20[i,2]= c20[i,3]= c20[i,4]=0; c20[i,aux5[j]]=gfit20[[i]]@fit$coef[j]; }}
    
    
    if (p21[i,1]>0.01 && (p21[i,2]<0.10) && (p21[i,3]<0.10 || p21[i,4]<0.10)) 
      
    {gfit21[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,21])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c21[i,1]=0; c21[i,j]=gfit21[[i]]@fit$coef[j-1]; }}
    
    else if (p21[i,1]<0.01 && (p21[i,2]<0.10) && (p21[i,2]<0.10 || p21[i,3]<0.10))
    {gfit21[[i]]=gfit21[[i]]
    
    for (j in 1:7) { 
      
      c21[i,j]=gfit21[[i]]@fit$coef[j]; }}
    
    else if (p21[i,2]>0.10 && (p21[i,3]<0.10 || p21[i,4]<0.10))
      
    {gfit21[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,21])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c21[i,1]=c21[i,2]=0;c21[i,j]=gfit21[[i]]@fit$coef[j-2]; }}
    
    
    else if (p21[i,1]<0.01 && (p21[i,2]<0.10) && (p21[i,3]>0.10 && p21[i,4]>0.10)) 
      
    {gfit21[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,21])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c21[i,3]=c21[i,4]=0; c21[i,aux3[j]]=gfit21[[i]]@fit$coef[j]; }}
    
    
    else if (p21[i,1]>0.01 && (p21[i,2]<0.10) && (p21[i,3]>0.10 && p21[i,4]>0.10)) 
      
    {gfit21[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,21])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c21[i,1]=c21[i,3]=c21[i,4]=0; c21[i,aux4[j]]=gfit21[[i]]@fit$coef[j]; }}
    
    
    else {gfit21[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,21])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c21[i,1]=c21[i,2]= c21[i,3]= c21[i,4]=0; c21[i,aux5[j]]=gfit21[[i]]@fit$coef[j]; }}
    
    if (p22[i,1]>0.01 && (p22[i,2]<0.10) && (p22[i,3]<0.10 || p22[i,4]<0.10)) 
      
    {gfit22[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,22])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c22[i,1]=0; c22[i,j]=gfit22[[i]]@fit$coef[j-1]; }}
    
    else if (p22[i,1]<0.01 && (p22[i,2]<0.10) && (p22[i,2]<0.10 || p22[i,3]<0.10))
    {gfit22[[i]]=gfit22[[i]]
    
    for (j in 1:7) { 
      
      c22[i,j]=gfit22[[i]]@fit$coef[j]; }}
    
    else if (p22[i,2]>0.10 && (p22[i,3]<0.10 || p22[i,4]<0.10))
      
    {gfit22[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,22])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c22[i,1]=c22[i,2]=0;c22[i,j]=gfit22[[i]]@fit$coef[j-2]; }}
    
    
    else if (p22[i,1]<0.01 && (p22[i,2]<0.10) && (p22[i,3]>0.10 && p22[i,4]>0.10)) 
      
    {gfit22[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,22])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c22[i,3]=c22[i,4]=0; c22[i,aux3[j]]=gfit22[[i]]@fit$coef[j]; }}
    
    
    else if (p22[i,1]>0.01 && (p22[i,2]<0.10) && (p22[i,3]>0.10 && p22[i,4]>0.10)) 
      
    {gfit22[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,22])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c22[i,1]=c22[i,3]=c22[i,4]=0; c22[i,aux4[j]]=gfit22[[i]]@fit$coef[j]; }}
    
    
    else {gfit22[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,22])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c22[i,1]=c22[i,2]= c22[i,3]= c22[i,4]=0; c22[i,aux5[j]]=gfit22[[i]]@fit$coef[j]; }}
    
    
    
    if (p23[i,1]>0.01 && (p23[i,2]<0.10) && (p23[i,3]<0.10 || p23[i,4]<0.10)) 
      
    {gfit23[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,23])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c23[i,1]=0; c23[i,j]=gfit23[[i]]@fit$coef[j-1]; }}
    
    else if (p23[i,1]<0.01 && (p23[i,2]<0.10) && (p23[i,2]<0.10 || p23[i,3]<0.10))
    {gfit23[[i]]=gfit23[[i]]
    
    for (j in 1:7) { 
      
      c23[i,j]=gfit23[[i]]@fit$coef[j]; }}
    
    else if (p23[i,2]>0.10 && (p23[i,3]<0.10 || p23[i,4]<0.10))
      
    {gfit23[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,23])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c23[i,1]=c23[i,2]=0;c23[i,j]=gfit23[[i]]@fit$coef[j-2]; }}
    
    
    else if (p23[i,1]<0.01 && (p23[i,2]<0.10) && (p23[i,3]>0.10 && p23[i,4]>0.10)) 
      
    {gfit23[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,23])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c23[i,3]=c23[i,4]=0; c23[i,aux3[j]]=gfit23[[i]]@fit$coef[j]; }}
    
    
    else if (p23[i,1]>0.01 && (p23[i,2]<0.10) && (p23[i,3]>0.10 && p23[i,4]>0.10)) 
      
    {gfit23[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,23])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c23[i,1]=c23[i,3]=c23[i,4]=0; c23[i,aux4[j]]=gfit23[[i]]@fit$coef[j]; }}
    
    
    else {gfit23[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,23])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c23[i,1]=c23[i,2]= c23[i,3]= c23[i,4]=0; c23[i,aux5[j]]=gfit23[[i]]@fit$coef[j]; }}
    
    
    if (p24[i,1]>0.01 && (p24[i,2]<0.10) && (p24[i,3]<0.10 || p24[i,4]<0.10)) 
      
    {gfit24[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,24])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c24[i,1]=0; c24[i,j]=gfit24[[i]]@fit$coef[j-1]; }}
    
    else if (p24[i,1]<0.01 && (p24[i,2]<0.10) && (p24[i,2]<0.10 || p24[i,3]<0.10))
    {gfit24[[i]]=gfit24[[i]]
    
    for (j in 1:7) { 
      
      c24[i,j]=gfit24[[i]]@fit$coef[j]; }}
    
    else if (p24[i,2]>0.10 && (p24[i,3]<0.10 || p24[i,4]<0.10))
      
    {gfit24[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,24])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c24[i,1]=c24[i,2]=0;c24[i,j]=gfit24[[i]]@fit$coef[j-2]; }}
    
    
    else if (p24[i,1]<0.01 && (p24[i,2]<0.10) && (p24[i,3]>0.10 && p24[i,4]>0.10)) 
      
    {gfit24[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,24])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c24[i,3]=c24[i,4]=0; c24[i,aux3[j]]=gfit24[[i]]@fit$coef[j]; }}
    
    
    else if (p24[i,1]>0.01 && (p24[i,2]<0.10) && (p24[i,3]>0.10 && p24[i,4]>0.10)) 
      
    {gfit24[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,24])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c24[i,1]=c24[i,3]=c24[i,4]=0; c24[i,aux4[j]]=gfit24[[i]]@fit$coef[j]; }}
    
    
    else {gfit24[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,24])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c24[i,1]=c24[i,2]= c24[i,3]= c24[i,4]=0; c24[i,aux5[j]]=gfit24[[i]]@fit$coef[j]; }}
    
    if (p25[i,1]>0.01 && (p25[i,2]<0.10) && (p25[i,3]<0.10 || p25[i,4]<0.10)) 
      
    {gfit25[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,25])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c25[i,1]=0; c25[i,j]=gfit25[[i]]@fit$coef[j-1]; }}
    
    else if (p25[i,1]<0.01 && (p25[i,2]<0.10) && (p25[i,2]<0.10 || p25[i,3]<0.10))
    {gfit25[[i]]=gfit25[[i]]
    
    for (j in 1:7) { 
      
      c25[i,j]=gfit25[[i]]@fit$coef[j]; }}
    
    else if (p25[i,2]>0.10 && (p25[i,3]<0.10 || p25[i,4]<0.10))
      
    {gfit25[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,25])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c25[i,1]=c25[i,2]=0;c25[i,j]=gfit25[[i]]@fit$coef[j-2]; }}
    
    
    else if (p25[i,1]<0.01 && (p25[i,2]<0.10) && (p25[i,3]>0.10 && p25[i,4]>0.10)) 
      
    {gfit25[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,25])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c25[i,3]=c25[i,4]=0; c25[i,aux3[j]]=gfit25[[i]]@fit$coef[j]; }}
    
    
    else if (p25[i,1]>0.01 && (p25[i,2]<0.10) && (p25[i,3]>0.10 && p25[i,4]>0.10)) 
      
    {gfit25[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,25])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c25[i,1]=c25[i,3]=c25[i,4]=0; c25[i,aux4[j]]=gfit25[[i]]@fit$coef[j]; }}
    
    
    else {gfit25[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,25])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c25[i,1]=c25[i,2]= c25[i,3]= c25[i,4]=0; c25[i,aux5[j]]=gfit25[[i]]@fit$coef[j]; }}
    
    if (p26[i,1]>0.01 && (p26[i,2]<0.10) && (p26[i,3]<0.10 || p26[i,4]<0.10)) 
      
    {gfit26[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,26])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c26[i,1]=0; c26[i,j]=gfit26[[i]]@fit$coef[j-1]; }}
    
    else if (p26[i,1]<0.01 && (p26[i,2]<0.10) && (p26[i,2]<0.10 || p26[i,3]<0.10))
    {gfit26[[i]]=gfit26[[i]]
    
    for (j in 1:7) { 
      
      c26[i,j]=gfit26[[i]]@fit$coef[j]; }}
    
    else if (p26[i,2]>0.10 && (p26[i,3]<0.10 || p26[i,4]<0.10))
      
    {gfit26[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,26])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c26[i,1]=c26[i,2]=0;c26[i,j]=gfit26[[i]]@fit$coef[j-2]; }}
    
    
    else if (p26[i,1]<0.01 && (p26[i,2]<0.10) && (p26[i,3]>0.10 && p26[i,4]>0.10)) 
      
    {gfit26[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,26])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c26[i,3]=c26[i,4]=0; c26[i,aux3[j]]=gfit26[[i]]@fit$coef[j]; }}
    
    
    else if (p26[i,1]>0.01 && (p26[i,2]<0.10) && (p26[i,3]>0.10 && p26[i,4]>0.10)) 
      
    {gfit26[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,26])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c26[i,1]=c26[i,3]=c26[i,4]=0; c26[i,aux4[j]]=gfit26[[i]]@fit$coef[j]; }}
    
    
    else {gfit26[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,26])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c26[i,1]=c26[i,2]= c26[i,3]= c26[i,4]=0; c26[i,aux5[j]]=gfit26[[i]]@fit$coef[j]; }}
    
    
    
    if (p27[i,1]>0.01 && (p27[i,2]<0.10) && (p27[i,3]<0.10 || p27[i,4]<0.10)) 
      
    {gfit27[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,27])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c27[i,1]=0; c27[i,j]=gfit27[[i]]@fit$coef[j-1]; }}
    
    else if (p27[i,1]<0.01 && (p27[i,2]<0.10) && (p27[i,2]<0.10 || p27[i,3]<0.10))
    {gfit27[[i]]=gfit27[[i]]
    
    for (j in 1:7) { 
      
      c27[i,j]=gfit27[[i]]@fit$coef[j]; }}
    
    else if (p27[i,2]>0.10 && (p27[i,3]<0.10 || p27[i,4]<0.10))
      
    {gfit27[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,27])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c27[i,1]=c27[i,2]=0;c27[i,j]=gfit27[[i]]@fit$coef[j-2]; }}
    
    
    else if (p27[i,1]<0.01 && (p27[i,2]<0.10) && (p27[i,3]>0.10 && p27[i,4]>0.10)) 
      
    {gfit27[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,27])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c27[i,3]=c27[i,4]=0; c27[i,aux3[j]]=gfit27[[i]]@fit$coef[j]; }}
    
    
    else if (p27[i,1]>0.01 && (p27[i,2]<0.10) && (p27[i,3]>0.10 && p27[i,4]>0.10)) 
      
    {gfit27[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,27])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c27[i,1]=c27[i,3]=c27[i,4]=0; c27[i,aux4[j]]=gfit27[[i]]@fit$coef[j]; }}
    
    
    else {gfit27[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,27])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c27[i,1]=c27[i,2]= c27[i,3]= c27[i,4]=0; c27[i,aux5[j]]=gfit27[[i]]@fit$coef[j]; }}
    
    
    if (p28[i,1]>0.01 && (p28[i,2]<0.10) && (p28[i,3]<0.10 || p28[i,4]<0.10)) 
      
    {gfit28[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,28])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c28[i,1]=0; c28[i,j]=gfit28[[i]]@fit$coef[j-1]; }}
    
    else if (p28[i,1]<0.01 && (p28[i,2]<0.10) && (p28[i,2]<0.10 || p28[i,3]<0.10))
    {gfit28[[i]]=gfit28[[i]]
    
    for (j in 1:7) { 
      
      c28[i,j]=gfit28[[i]]@fit$coef[j]; }}
    
    else if (p28[i,2]>0.10 && (p28[i,3]<0.10 || p28[i,4]<0.10))
      
    {gfit28[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,28])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c28[i,1]=c28[i,2]=0;c28[i,j]=gfit28[[i]]@fit$coef[j-2]; }}
    
    
    else if (p28[i,1]<0.01 && (p28[i,2]<0.10) && (p28[i,3]>0.10 && p28[i,4]>0.10)) 
      
    {gfit28[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,28])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c28[i,3]=c28[i,4]=0; c28[i,aux3[j]]=gfit28[[i]]@fit$coef[j]; }}
    
    
    else if (p28[i,1]>0.01 && (p28[i,2]<0.10) && (p28[i,3]>0.10 && p28[i,4]>0.10)) 
      
    {gfit28[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,28])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c28[i,1]=c28[i,3]=c28[i,4]=0; c28[i,aux4[j]]=gfit28[[i]]@fit$coef[j]; }}
    
    
    else {gfit28[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,28])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c28[i,1]=c28[i,2]= c28[i,3]= c28[i,4]=0; c28[i,aux5[j]]=gfit28[[i]]@fit$coef[j]; }}
    
    if (p29[i,1]>0.01 && (p29[i,2]<0.10) && (p29[i,3]<0.10 || p29[i,4]<0.10)) 
      
    {gfit29[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,29])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c29[i,1]=0; c29[i,j]=gfit29[[i]]@fit$coef[j-1]; }}
    
    else if (p29[i,1]<0.01 && (p29[i,2]<0.10) && (p29[i,2]<0.10 || p29[i,3]<0.10))
    {gfit29[[i]]=gfit29[[i]]
    
    for (j in 1:7) { 
      
      c29[i,j]=gfit29[[i]]@fit$coef[j]; }}
    
    else if (p29[i,2]>0.10 && (p29[i,3]<0.10 || p29[i,4]<0.10))
      
    {gfit29[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,29])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c29[i,1]=c29[i,2]=0;c29[i,j]=gfit29[[i]]@fit$coef[j-2]; }}
    
    
    else if (p29[i,1]<0.01 && (p29[i,2]<0.10) && (p29[i,3]>0.10 && p29[i,4]>0.10)) 
      
    {gfit29[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,29])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c29[i,3]=c29[i,4]=0; c29[i,aux3[j]]=gfit29[[i]]@fit$coef[j]; }}
    
    
    else if (p29[i,1]>0.01 && (p29[i,2]<0.10) && (p29[i,3]>0.10 && p29[i,4]>0.10)) 
      
    {gfit29[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,29])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c29[i,1]=c29[i,3]=c29[i,4]=0; c29[i,aux4[j]]=gfit29[[i]]@fit$coef[j]; }}
    
    
    else {gfit29[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,29])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c29[i,1]=c29[i,2]= c29[i,3]= c29[i,4]=0; c29[i,aux5[j]]=gfit29[[i]]@fit$coef[j]; }}
    
    if (p30[i,1]>0.01 && (p30[i,2]<0.10) && (p30[i,3]<0.10 || p30[i,4]<0.10)) 
      
    {gfit30[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,30])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c30[i,1]=0; c30[i,j]=gfit30[[i]]@fit$coef[j-1]; }}
    
    else if (p30[i,1]<0.01 && (p30[i,2]<0.10) && (p30[i,2]<0.10 || p30[i,3]<0.10))
    {gfit30[[i]]=gfit30[[i]]
    
    for (j in 1:7) { 
      
      c30[i,j]=gfit30[[i]]@fit$coef[j]; }}
    
    else if (p30[i,2]>0.10 && (p30[i,3]<0.10 || p30[i,4]<0.10))
      
    {gfit30[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,30])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c30[i,1]=c30[i,2]=0;c30[i,j]=gfit30[[i]]@fit$coef[j-2]; }}
    
    
    else if (p30[i,1]<0.01 && (p30[i,2]<0.10) && (p30[i,3]>0.10 && p30[i,4]>0.10)) 
      
    {gfit30[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,30])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c30[i,3]=c30[i,4]=0; c30[i,aux3[j]]=gfit30[[i]]@fit$coef[j]; }}
    
    
    else if (p30[i,1]>0.01 && (p30[i,2]<0.10) && (p30[i,3]>0.10 && p30[i,4]>0.10)) 
      
    {gfit30[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,30])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c30[i,1]=c30[i,3]=c30[i,4]=0; c30[i,aux4[j]]=gfit30[[i]]@fit$coef[j]; }}
    
    
    else {gfit30[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,30])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c30[i,1]=c30[i,2]= c30[i,3]= c30[i,4]=0; c30[i,aux5[j]]=gfit30[[i]]@fit$coef[j]; }}
    
    if (p31[i,1]>0.01 && (p31[i,2]<0.10) && (p31[i,3]<0.10 || p31[i,4]<0.10)) 
      
    {gfit31[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,31])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c31[i,1]=0; c31[i,j]=gfit31[[i]]@fit$coef[j-1]; }}
    
    else if (p31[i,1]<0.01 && (p31[i,2]<0.10) && (p31[i,2]<0.10 || p31[i,3]<0.10))
    {gfit31[[i]]=gfit31[[i]]
    
    for (j in 1:7) { 
      
      c31[i,j]=gfit31[[i]]@fit$coef[j]; }}
    
    else if (p31[i,2]>0.10 && (p31[i,3]<0.10 || p31[i,4]<0.10))
      
    {gfit31[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,31])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c31[i,1]=c31[i,2]=0;c31[i,j]=gfit31[[i]]@fit$coef[j-2]; }}
    
    
    else if (p31[i,1]<0.01 && (p31[i,2]<0.10) && (p31[i,3]>0.10 && p31[i,4]>0.10)) 
      
    {gfit31[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,31])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c31[i,3]=c31[i,4]=0; c31[i,aux3[j]]=gfit31[[i]]@fit$coef[j]; }}
    
    
    else if (p31[i,1]>0.01 && (p31[i,2]<0.10) && (p31[i,3]>0.10 && p31[i,4]>0.10)) 
      
    {gfit31[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,31])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c31[i,1]=c31[i,3]=c31[i,4]=0; c31[i,aux4[j]]=gfit31[[i]]@fit$coef[j]; }}
    
    
    else {gfit31[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,31])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c31[i,1]=c31[i,2]= c31[i,3]= c31[i,4]=0; c31[i,aux5[j]]=gfit31[[i]]@fit$coef[j]; }}
    
    if (p32[i,1]>0.01 && (p32[i,2]<0.10) && (p32[i,3]<0.10 || p32[i,4]<0.10)) 
      
    {gfit32[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,32])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c32[i,1]=0; c32[i,j]=gfit32[[i]]@fit$coef[j-1]; }}
    
    else if (p32[i,1]<0.01 && (p32[i,2]<0.10) && (p32[i,2]<0.10 || p32[i,3]<0.10))
    {gfit32[[i]]=gfit32[[i]]
    
    for (j in 1:7) { 
      
      c32[i,j]=gfit32[[i]]@fit$coef[j]; }}
    
    else if (p32[i,2]>0.10 && (p32[i,3]<0.10 || p32[i,4]<0.10))
      
    {gfit32[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,32])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c32[i,1]=c32[i,2]=0;c32[i,j]=gfit32[[i]]@fit$coef[j-2]; }}
    
    
    else if (p32[i,1]<0.01 && (p32[i,2]<0.10) && (p32[i,3]>0.10 && p32[i,4]>0.10)) 
      
    {gfit32[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,32])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c32[i,3]=c32[i,4]=0; c32[i,aux3[j]]=gfit32[[i]]@fit$coef[j]; }}
    
    
    else if (p32[i,1]>0.01 && (p32[i,2]<0.10) && (p32[i,3]>0.10 && p32[i,4]>0.10)) 
      
    {gfit32[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,32])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c32[i,1]=c32[i,3]=c32[i,4]=0; c32[i,aux4[j]]=gfit32[[i]]@fit$coef[j]; }}
    
    
    else {gfit32[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,32])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c32[i,1]=c32[i,2]= c32[i,3]= c32[i,4]=0; c32[i,aux5[j]]=gfit32[[i]]@fit$coef[j]; }}
    
    
    
    if (p33[i,1]>0.01 && (p33[i,2]<0.10) && (p33[i,3]<0.10 || p33[i,4]<0.10)) 
      
    {gfit33[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,33])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c33[i,1]=0; c33[i,j]=gfit33[[i]]@fit$coef[j-1]; }}
    
    else if (p33[i,1]<0.01 && (p33[i,2]<0.10) && (p33[i,2]<0.10 || p33[i,3]<0.10))
    {gfit33[[i]]=gfit33[[i]]
    
    for (j in 1:7) { 
      
      c33[i,j]=gfit33[[i]]@fit$coef[j]; }}
    
    else if (p33[i,2]>0.10 && (p33[i,3]<0.10 || p33[i,4]<0.10))
      
    {gfit33[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,33])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c33[i,1]=c33[i,2]=0;c33[i,j]=gfit33[[i]]@fit$coef[j-2]; }}
    
    
    else if (p33[i,1]<0.01 && (p33[i,2]<0.10) && (p33[i,3]>0.10 && p33[i,4]>0.10)) 
      
    {gfit33[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,33])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c33[i,3]=c33[i,4]=0; c33[i,aux3[j]]=gfit33[[i]]@fit$coef[j]; }}
    
    
    else if (p33[i,1]>0.01 && (p33[i,2]<0.10) && (p33[i,3]>0.10 && p33[i,4]>0.10)) 
      
    {gfit33[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,33])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c33[i,1]=c33[i,3]=c33[i,4]=0; c33[i,aux4[j]]=gfit33[[i]]@fit$coef[j]; }}
    
    
    else {gfit33[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,33])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c33[i,1]=c33[i,2]= c33[i,3]= c33[i,4]=0; c33[i,aux5[j]]=gfit33[[i]]@fit$coef[j]; }}
    
    
    if (p34[i,1]>0.01 && (p34[i,2]<0.10) && (p34[i,3]<0.10 || p34[i,4]<0.10)) 
      
    {gfit34[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,34])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c34[i,1]=0; c34[i,j]=gfit34[[i]]@fit$coef[j-1]; }}
    
    else if (p34[i,1]<0.01 && (p34[i,2]<0.10) && (p34[i,2]<0.10 || p34[i,3]<0.10))
    {gfit34[[i]]=gfit34[[i]]
    
    for (j in 1:7) { 
      
      c34[i,j]=gfit34[[i]]@fit$coef[j]; }}
    
    else if (p34[i,2]>0.10 && (p34[i,3]<0.10 || p34[i,4]<0.10))
      
    {gfit34[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,34])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c34[i,1]=c34[i,2]=0;c34[i,j]=gfit34[[i]]@fit$coef[j-2]; }}
    
    
    else if (p34[i,1]<0.01 && (p34[i,2]<0.10) && (p34[i,3]>0.10 && p34[i,4]>0.10)) 
      
    {gfit34[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,34])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c34[i,3]=c34[i,4]=0; c34[i,aux3[j]]=gfit34[[i]]@fit$coef[j]; }}
    
    
    else if (p34[i,1]>0.01 && (p34[i,2]<0.10) && (p34[i,3]>0.10 && p34[i,4]>0.10)) 
      
    {gfit34[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,34])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c34[i,1]=c34[i,3]=c34[i,4]=0; c34[i,aux4[j]]=gfit34[[i]]@fit$coef[j]; }}
    
    
    else {gfit34[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,34])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c34[i,1]=c34[i,2]= c34[i,3]= c34[i,4]=0; c34[i,aux5[j]]=gfit34[[i]]@fit$coef[j]; }}
    
    if (p35[i,1]>0.01 && (p35[i,2]<0.10) && (p35[i,3]<0.10 || p35[i,4]<0.10)) 
      
    {gfit35[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,35])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c35[i,1]=0; c35[i,j]=gfit35[[i]]@fit$coef[j-1]; }}
    
    else if (p35[i,1]<0.01 && (p35[i,2]<0.10) && (p35[i,2]<0.10 || p35[i,3]<0.10))
    {gfit35[[i]]=gfit35[[i]]
    
    for (j in 1:7) { 
      
      c35[i,j]=gfit35[[i]]@fit$coef[j]; }}
    
    else if (p35[i,2]>0.10 && (p35[i,3]<0.10 || p35[i,4]<0.10))
      
    {gfit35[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,35])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c35[i,1]=c35[i,2]=0;c35[i,j]=gfit35[[i]]@fit$coef[j-2]; }}
    
    
    else if (p35[i,1]<0.01 && (p35[i,2]<0.10) && (p35[i,3]>0.10 && p35[i,4]>0.10)) 
      
    {gfit35[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,35])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c35[i,3]=c35[i,4]=0; c35[i,aux3[j]]=gfit35[[i]]@fit$coef[j]; }}
    
    
    else if (p35[i,1]>0.01 && (p35[i,2]<0.10) && (p35[i,3]>0.10 && p35[i,4]>0.10)) 
      
    {gfit35[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,35])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c35[i,1]=c35[i,3]=c35[i,4]=0; c35[i,aux4[j]]=gfit35[[i]]@fit$coef[j]; }}
    
    
    else {gfit35[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,35])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c35[i,1]=c35[i,2]= c35[i,3]= c35[i,4]=0; c35[i,aux5[j]]=gfit35[[i]]@fit$coef[j]; }}
    
    if (p36[i,1]>0.01 && (p36[i,2]<0.10) && (p36[i,3]<0.10 || p36[i,4]<0.10)) 
      
    {gfit36[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,36])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c36[i,1]=0; c36[i,j]=gfit36[[i]]@fit$coef[j-1]; }}
    
    else if (p36[i,1]<0.01 && (p36[i,2]<0.10) && (p36[i,2]<0.10 || p36[i,3]<0.10))
    {gfit36[[i]]=gfit36[[i]]
    
    for (j in 1:7) { 
      
      c36[i,j]=gfit36[[i]]@fit$coef[j]; }}
    
    else if (p36[i,2]>0.10 && (p36[i,3]<0.10 || p36[i,4]<0.10))
      
    {gfit36[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,36])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c36[i,1]=c36[i,2]=0;c36[i,j]=gfit36[[i]]@fit$coef[j-2]; }}
    
    
    else if (p36[i,1]<0.01 && (p36[i,2]<0.10) && (p36[i,3]>0.10 && p36[i,4]>0.10)) 
      
    {gfit36[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,36])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c36[i,3]=c36[i,4]=0; c36[i,aux3[j]]=gfit36[[i]]@fit$coef[j]; }}
    
    
    else if (p36[i,1]>0.01 && (p36[i,2]<0.10) && (p36[i,3]>0.10 && p36[i,4]>0.10)) 
      
    {gfit36[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,36])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c36[i,1]=c36[i,3]=c36[i,4]=0; c36[i,aux4[j]]=gfit36[[i]]@fit$coef[j]; }}
    
    
    else {gfit36[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,36])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c36[i,1]=c36[i,2]= c36[i,3]= c36[i,4]=0; c36[i,aux5[j]]=gfit36[[i]]@fit$coef[j]; }}
    
    
    
    if (p37[i,1]>0.01 && (p37[i,2]<0.10) && (p37[i,3]<0.10 || p37[i,4]<0.10)) 
      
    {gfit37[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,37])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c37[i,1]=0; c37[i,j]=gfit37[[i]]@fit$coef[j-1]; }}
    
    else if (p37[i,1]<0.01 && (p37[i,2]<0.10) && (p37[i,2]<0.10 || p37[i,3]<0.10))
    {gfit37[[i]]=gfit37[[i]]
    
    for (j in 1:7) { 
      
      c37[i,j]=gfit37[[i]]@fit$coef[j]; }}
    
    else if (p37[i,2]>0.10 && (p37[i,3]<0.10 || p37[i,4]<0.10))
      
    {gfit37[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,37])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c37[i,1]=c37[i,2]=0;c37[i,j]=gfit37[[i]]@fit$coef[j-2]; }}
    
    
    else if (p37[i,1]<0.01 && (p37[i,2]<0.10) && (p37[i,3]>0.10 && p37[i,4]>0.10)) 
      
    {gfit37[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,37])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c37[i,3]=c37[i,4]=0; c37[i,aux3[j]]=gfit37[[i]]@fit$coef[j]; }}
    
    
    else if (p37[i,1]>0.01 && (p37[i,2]<0.10) && (p37[i,3]>0.10 && p37[i,4]>0.10)) 
      
    {gfit37[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,37])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c37[i,1]=c37[i,3]=c37[i,4]=0; c37[i,aux4[j]]=gfit37[[i]]@fit$coef[j]; }}
    
    
    else {gfit37[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,37])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c37[i,1]=c37[i,2]= c37[i,3]= c37[i,4]=0; c37[i,aux5[j]]=gfit37[[i]]@fit$coef[j]; }}
    
    
    if (p38[i,1]>0.01 && (p38[i,2]<0.10) && (p38[i,3]<0.10 || p38[i,4]<0.10)) 
      
    {gfit38[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,38])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c38[i,1]=0; c38[i,j]=gfit38[[i]]@fit$coef[j-1]; }}
    
    else if (p38[i,1]<0.01 && (p38[i,2]<0.10) && (p38[i,2]<0.10 || p38[i,3]<0.10))
    {gfit38[[i]]=gfit38[[i]]
    
    for (j in 1:7) { 
      
      c38[i,j]=gfit38[[i]]@fit$coef[j]; }}
    
    else if (p38[i,2]>0.10 && (p38[i,3]<0.10 || p38[i,4]<0.10))
      
    {gfit38[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,38])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c38[i,1]=c38[i,2]=0;c38[i,j]=gfit38[[i]]@fit$coef[j-2]; }}
    
    
    else if (p38[i,1]<0.01 && (p38[i,2]<0.10) && (p38[i,3]>0.10 && p38[i,4]>0.10)) 
      
    {gfit38[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,38])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c38[i,3]=c38[i,4]=0; c38[i,aux3[j]]=gfit38[[i]]@fit$coef[j]; }}
    
    
    else if (p38[i,1]>0.01 && (p38[i,2]<0.10) && (p38[i,3]>0.10 && p38[i,4]>0.10)) 
      
    {gfit38[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,38])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c38[i,1]=c38[i,3]=c38[i,4]=0; c38[i,aux4[j]]=gfit38[[i]]@fit$coef[j]; }}
    
    
    else {gfit38[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,38])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c38[i,1]=c38[i,2]= c38[i,3]= c38[i,4]=0; c38[i,aux5[j]]=gfit38[[i]]@fit$coef[j]; }}
    
    if (p39[i,1]>0.01 && (p39[i,2]<0.10) && (p39[i,3]<0.10 || p39[i,4]<0.10)) 
      
    {gfit39[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,39])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c39[i,1]=0; c39[i,j]=gfit39[[i]]@fit$coef[j-1]; }}
    
    else if (p39[i,1]<0.01 && (p39[i,2]<0.10) && (p39[i,2]<0.10 || p39[i,3]<0.10))
    {gfit39[[i]]=gfit39[[i]]
    
    for (j in 1:7) { 
      
      c39[i,j]=gfit39[[i]]@fit$coef[j]; }}
    
    else if (p39[i,2]>0.10 && (p39[i,3]<0.10 || p39[i,4]<0.10))
      
    {gfit39[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,39])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c39[i,1]=c39[i,2]=0;c39[i,j]=gfit39[[i]]@fit$coef[j-2]; }}
    
    
    else if (p39[i,1]<0.01 && (p39[i,2]<0.10) && (p39[i,3]>0.10 && p39[i,4]>0.10)) 
      
    {gfit39[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,39])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c39[i,3]=c39[i,4]=0; c39[i,aux3[j]]=gfit39[[i]]@fit$coef[j]; }}
    
    
    else if (p39[i,1]>0.01 && (p39[i,2]<0.10) && (p39[i,3]>0.10 && p39[i,4]>0.10)) 
      
    {gfit39[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,39])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c39[i,1]=c39[i,3]=c39[i,4]=0; c39[i,aux4[j]]=gfit39[[i]]@fit$coef[j]; }}
    
    
    else {gfit39[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,39])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c39[i,1]=c39[i,2]= c39[i,3]= c39[i,4]=0; c39[i,aux5[j]]=gfit39[[i]]@fit$coef[j]; }}
    
    if (p40[i,1]>0.01 && (p40[i,2]<0.10) && (p40[i,3]<0.10 || p40[i,4]<0.10)) 
      
    {gfit40[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,40])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c40[i,1]=0; c40[i,j]=gfit40[[i]]@fit$coef[j-1]; }}
    
    else if (p40[i,1]<0.01 && (p40[i,2]<0.10) && (p40[i,2]<0.10 || p40[i,3]<0.10))
    {gfit40[[i]]=gfit40[[i]]
    
    for (j in 1:7) { 
      
      c40[i,j]=gfit40[[i]]@fit$coef[j]; }}
    
    else if (p40[i,2]>0.10 && (p40[i,3]<0.10 || p40[i,4]<0.10))
      
    {gfit40[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,40])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c40[i,1]=c40[i,2]=0;c40[i,j]=gfit40[[i]]@fit$coef[j-2]; }}
    
    
    else if (p40[i,1]<0.01 && (p40[i,2]<0.10) && (p40[i,3]>0.10 && p40[i,4]>0.10)) 
      
    {gfit40[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,40])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c40[i,3]=c40[i,4]=0; c40[i,aux3[j]]=gfit40[[i]]@fit$coef[j]; }}
    
    
    else if (p40[i,1]>0.01 && (p40[i,2]<0.10) && (p40[i,3]>0.10 && p40[i,4]>0.10)) 
      
    {gfit40[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,40])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c40[i,1]=c40[i,3]=c40[i,4]=0; c40[i,aux4[j]]=gfit40[[i]]@fit$coef[j]; }}
    
    
    else {gfit40[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,40])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c40[i,1]=c40[i,2]= c40[i,3]= c40[i,4]=0; c40[i,aux5[j]]=gfit40[[i]]@fit$coef[j]; }}
    
    
    if (p41[i,1]>0.01 && (p41[i,2]<0.10) && (p41[i,3]<0.10 || p41[i,4]<0.10)) 
      
    {gfit41[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,41])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c41[i,1]=0; c41[i,j]=gfit41[[i]]@fit$coef[j-1]; }}
    
    else if (p41[i,1]<0.01 && (p41[i,2]<0.10) && (p41[i,2]<0.10 || p41[i,3]<0.10))
    {gfit41[[i]]=gfit41[[i]]
    
    for (j in 1:7) { 
      
      c41[i,j]=gfit41[[i]]@fit$coef[j]; }}
    
    else if (p41[i,2]>0.10 && (p41[i,3]<0.10 || p41[i,4]<0.10))
      
    {gfit41[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,41])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c41[i,1]=c41[i,2]=0;c41[i,j]=gfit41[[i]]@fit$coef[j-2]; }}
    
    
    else if (p41[i,1]<0.01 && (p41[i,2]<0.10) && (p41[i,3]>0.10 && p41[i,4]>0.10)) 
      
    {gfit41[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,41])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c41[i,3]=c41[i,4]=0; c41[i,aux3[j]]=gfit41[[i]]@fit$coef[j]; }}
    
    
    else if (p41[i,1]>0.01 && (p41[i,2]<0.10) && (p41[i,3]>0.10 && p41[i,4]>0.10)) 
      
    {gfit41[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,41])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c41[i,1]=c41[i,3]=c41[i,4]=0; c41[i,aux4[j]]=gfit41[[i]]@fit$coef[j]; }}
    
    
    else {gfit41[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,41])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c41[i,1]=c41[i,2]= c41[i,3]= c41[i,4]=0; c41[i,aux5[j]]=gfit41[[i]]@fit$coef[j]; }}
    
    if (p42[i,1]>0.01 && (p42[i,2]<0.10) && (p42[i,3]<0.10 || p42[i,4]<0.10)) 
      
    {gfit42[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,42])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c42[i,1]=0; c42[i,j]=gfit42[[i]]@fit$coef[j-1]; }}
    
    else if (p42[i,1]<0.01 && (p42[i,2]<0.10) && (p42[i,2]<0.10 || p42[i,3]<0.10))
    {gfit42[[i]]=gfit42[[i]]
    
    for (j in 1:7) { 
      
      c42[i,j]=gfit42[[i]]@fit$coef[j]; }}
    
    else if (p42[i,2]>0.10 && (p42[i,3]<0.10 || p42[i,4]<0.10))
      
    {gfit42[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,42])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c42[i,1]=c42[i,2]=0;c42[i,j]=gfit42[[i]]@fit$coef[j-2]; }}
    
    
    else if (p42[i,1]<0.01 && (p42[i,2]<0.10) && (p42[i,3]>0.10 && p42[i,4]>0.10)) 
      
    {gfit42[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,42])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c42[i,3]=c42[i,4]=0; c42[i,aux3[j]]=gfit42[[i]]@fit$coef[j]; }}
    
    
    else if (p42[i,1]>0.01 && (p42[i,2]<0.10) && (p42[i,3]>0.10 && p42[i,4]>0.10)) 
      
    {gfit42[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,42])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c42[i,1]=c42[i,3]=c42[i,4]=0; c42[i,aux4[j]]=gfit42[[i]]@fit$coef[j]; }}
    
    
    else {gfit42[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,42])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c42[i,1]=c42[i,2]= c42[i,3]= c42[i,4]=0; c42[i,aux5[j]]=gfit42[[i]]@fit$coef[j]; }}
    
    
    
    if (p43[i,1]>0.01 && (p43[i,2]<0.10) && (p43[i,3]<0.10 || p43[i,4]<0.10)) 
      
    {gfit43[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,43])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c43[i,1]=0; c43[i,j]=gfit43[[i]]@fit$coef[j-1]; }}
    
    else if (p43[i,1]<0.01 && (p43[i,2]<0.10) && (p43[i,2]<0.10 || p43[i,3]<0.10))
    {gfit43[[i]]=gfit43[[i]]
    
    for (j in 1:7) { 
      
      c43[i,j]=gfit43[[i]]@fit$coef[j]; }}
    
    else if (p43[i,2]>0.10 && (p43[i,3]<0.10 || p43[i,4]<0.10))
      
    {gfit43[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,43])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c43[i,1]=c43[i,2]=0;c43[i,j]=gfit43[[i]]@fit$coef[j-2]; }}
    
    
    else if (p43[i,1]<0.01 && (p43[i,2]<0.10) && (p43[i,3]>0.10 && p43[i,4]>0.10)) 
      
    {gfit43[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,43])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c43[i,3]=c43[i,4]=0; c43[i,aux3[j]]=gfit43[[i]]@fit$coef[j]; }}
    
    
    else if (p43[i,1]>0.01 && (p43[i,2]<0.10) && (p43[i,3]>0.10 && p43[i,4]>0.10)) 
      
    {gfit43[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,43])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c43[i,1]=c43[i,3]=c43[i,4]=0; c43[i,aux4[j]]=gfit43[[i]]@fit$coef[j]; }}
    
    
    else {gfit43[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,43])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c43[i,1]=c43[i,2]= c43[i,3]= c43[i,4]=0; c43[i,aux5[j]]=gfit43[[i]]@fit$coef[j]; }}
    
    
    if (p44[i,1]>0.01 && (p44[i,2]<0.10) && (p44[i,3]<0.10 || p44[i,4]<0.10)) 
      
    {gfit44[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,44])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c44[i,1]=0; c44[i,j]=gfit44[[i]]@fit$coef[j-1]; }}
    
    else if (p44[i,1]<0.01 && (p44[i,2]<0.10) && (p44[i,2]<0.10 || p44[i,3]<0.10))
    {gfit44[[i]]=gfit44[[i]]
    
    for (j in 1:7) { 
      
      c44[i,j]=gfit44[[i]]@fit$coef[j]; }}
    
    else if (p44[i,2]>0.10 && (p44[i,3]<0.10 || p44[i,4]<0.10))
      
    {gfit44[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,44])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c44[i,1]=c44[i,2]=0;c44[i,j]=gfit44[[i]]@fit$coef[j-2]; }}
    
    
    else if (p44[i,1]<0.01 && (p44[i,2]<0.10) && (p44[i,3]>0.10 && p44[i,4]>0.10)) 
      
    {gfit44[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,44])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c44[i,3]=c44[i,4]=0; c44[i,aux3[j]]=gfit44[[i]]@fit$coef[j]; }}
    
    
    else if (p44[i,1]>0.01 && (p44[i,2]<0.10) && (p44[i,3]>0.10 && p44[i,4]>0.10)) 
      
    {gfit44[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,44])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c44[i,1]=c44[i,3]=c44[i,4]=0; c44[i,aux4[j]]=gfit44[[i]]@fit$coef[j]; }}
    
    
    else {gfit44[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,44])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c44[i,1]=c44[i,2]= c44[i,3]= c44[i,4]=0; c44[i,aux5[j]]=gfit44[[i]]@fit$coef[j]; }}
    
    if (p45[i,1]>0.01 && (p45[i,2]<0.10) && (p45[i,3]<0.10 || p45[i,4]<0.10)) 
      
    {gfit45[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,45])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c45[i,1]=0; c45[i,j]=gfit45[[i]]@fit$coef[j-1]; }}
    
    else if (p45[i,1]<0.01 && (p45[i,2]<0.10) && (p45[i,2]<0.10 || p45[i,3]<0.10))
    {gfit45[[i]]=gfit45[[i]]
    
    for (j in 1:7) { 
      
      c45[i,j]=gfit45[[i]]@fit$coef[j]; }}
    
    else if (p45[i,2]>0.10 && (p45[i,3]<0.10 || p45[i,4]<0.10))
      
    {gfit45[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,45])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c45[i,1]=c45[i,2]=0;c45[i,j]=gfit45[[i]]@fit$coef[j-2]; }}
    
    
    else if (p45[i,1]<0.01 && (p45[i,2]<0.10) && (p45[i,3]>0.10 && p45[i,4]>0.10)) 
      
    {gfit45[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,45])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c45[i,3]=c45[i,4]=0; c45[i,aux3[j]]=gfit45[[i]]@fit$coef[j]; }}
    
    
    else if (p45[i,1]>0.01 && (p45[i,2]<0.10) && (p45[i,3]>0.10 && p45[i,4]>0.10)) 
      
    {gfit45[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,45])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c45[i,1]=c45[i,3]=c45[i,4]=0; c45[i,aux4[j]]=gfit45[[i]]@fit$coef[j]; }}
    
    
    else {gfit45[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,45])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c45[i,1]=c45[i,2]= c45[i,3]= c45[i,4]=0; c45[i,aux5[j]]=gfit45[[i]]@fit$coef[j]; }}
    
    if (p46[i,1]>0.01 && (p46[i,2]<0.10) && (p46[i,3]<0.10 || p46[i,4]<0.10)) 
      
    {gfit46[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,46])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c46[i,1]=0; c46[i,j]=gfit46[[i]]@fit$coef[j-1]; }}
    
    else if (p46[i,1]<0.01 && (p46[i,2]<0.10) && (p46[i,2]<0.10 || p46[i,3]<0.10))
    {gfit46[[i]]=gfit46[[i]]
    
    for (j in 1:7) { 
      
      c46[i,j]=gfit46[[i]]@fit$coef[j]; }}
    
    else if (p46[i,2]>0.10 && (p46[i,3]<0.10 || p46[i,4]<0.10))
      
    {gfit46[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,46])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c46[i,1]=c46[i,2]=0;c46[i,j]=gfit46[[i]]@fit$coef[j-2]; }}
    
    
    else if (p46[i,1]<0.01 && (p46[i,2]<0.10) && (p46[i,3]>0.10 && p46[i,4]>0.10)) 
      
    {gfit46[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,46])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c46[i,3]=c46[i,4]=0; c46[i,aux3[j]]=gfit46[[i]]@fit$coef[j]; }}
    
    
    else if (p46[i,1]>0.01 && (p46[i,2]<0.10) && (p46[i,3]>0.10 && p46[i,4]>0.10)) 
      
    {gfit46[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,46])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c46[i,1]=c46[i,3]=c46[i,4]=0; c46[i,aux4[j]]=gfit46[[i]]@fit$coef[j]; }}
    
    
    else {gfit46[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,46])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c46[i,1]=c46[i,2]= c46[i,3]= c46[i,4]=0; c46[i,aux5[j]]=gfit46[[i]]@fit$coef[j]; }}
    
    
    
    if (p47[i,1]>0.01 && (p47[i,2]<0.10) && (p47[i,3]<0.10 || p47[i,4]<0.10)) 
      
    {gfit47[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,47])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c47[i,1]=0; c47[i,j]=gfit47[[i]]@fit$coef[j-1]; }}
    
    else if (p47[i,1]<0.01 && (p47[i,2]<0.10) && (p47[i,2]<0.10 || p47[i,3]<0.10))
    {gfit47[[i]]=gfit47[[i]]
    
    for (j in 1:7) { 
      
      c47[i,j]=gfit47[[i]]@fit$coef[j]; }}
    
    else if (p47[i,2]>0.10 && (p47[i,3]<0.10 || p47[i,4]<0.10))
      
    {gfit47[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,47])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c47[i,1]=c47[i,2]=0;c47[i,j]=gfit47[[i]]@fit$coef[j-2]; }}
    
    
    else if (p47[i,1]<0.01 && (p47[i,2]<0.10) && (p47[i,3]>0.10 && p47[i,4]>0.10)) 
      
    {gfit47[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,47])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c47[i,3]=c47[i,4]=0; c47[i,aux3[j]]=gfit47[[i]]@fit$coef[j]; }}
    
    
    else if (p47[i,1]>0.01 && (p47[i,2]<0.10) && (p47[i,3]>0.10 && p47[i,4]>0.10)) 
      
    {gfit47[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,47])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c47[i,1]=c47[i,3]=c47[i,4]=0; c47[i,aux4[j]]=gfit47[[i]]@fit$coef[j]; }}
    
    
    else {gfit47[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,47])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c47[i,1]=c47[i,2]= c47[i,3]= c47[i,4]=0; c47[i,aux5[j]]=gfit47[[i]]@fit$coef[j]; }}
    
    
    if (p48[i,1]>0.01 && (p48[i,2]<0.10) && (p48[i,3]<0.10 || p48[i,4]<0.10)) 
      
    {gfit48[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,48])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c48[i,1]=0; c48[i,j]=gfit48[[i]]@fit$coef[j-1]; }}
    
    else if (p48[i,1]<0.01 && (p48[i,2]<0.10) && (p48[i,2]<0.10 || p48[i,3]<0.10))
    {gfit48[[i]]=gfit48[[i]]
    
    for (j in 1:7) { 
      
      c48[i,j]=gfit48[[i]]@fit$coef[j]; }}
    
    else if (p48[i,2]>0.10 && (p48[i,3]<0.10 || p48[i,4]<0.10))
      
    {gfit48[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,48])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c48[i,1]=c48[i,2]=0;c48[i,j]=gfit48[[i]]@fit$coef[j-2]; }}
    
    
    else if (p48[i,1]<0.01 && (p48[i,2]<0.10) && (p48[i,3]>0.10 && p48[i,4]>0.10)) 
      
    {gfit48[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,48])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c48[i,3]=c48[i,4]=0; c48[i,aux3[j]]=gfit48[[i]]@fit$coef[j]; }}
    
    
    else if (p48[i,1]>0.01 && (p48[i,2]<0.10) && (p48[i,3]>0.10 && p48[i,4]>0.10)) 
      
    {gfit48[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,48])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c48[i,1]=c48[i,3]=c48[i,4]=0; c48[i,aux4[j]]=gfit48[[i]]@fit$coef[j]; }}
    
    
    else {gfit48[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,48])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c48[i,1]=c48[i,2]= c48[i,3]= c48[i,4]=0; c48[i,aux5[j]]=gfit48[[i]]@fit$coef[j]; }}
    
    if (p49[i,1]>0.01 && (p49[i,2]<0.10) && (p49[i,3]<0.10 || p49[i,4]<0.10)) 
      
    {gfit49[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,49])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c49[i,1]=0; c49[i,j]=gfit49[[i]]@fit$coef[j-1]; }}
    
    else if (p49[i,1]<0.01 && (p49[i,2]<0.10) && (p49[i,2]<0.10 || p49[i,3]<0.10))
    {gfit49[[i]]=gfit49[[i]]
    
    for (j in 1:7) { 
      
      c49[i,j]=gfit49[[i]]@fit$coef[j]; }}
    
    else if (p49[i,2]>0.10 && (p49[i,3]<0.10 || p49[i,4]<0.10))
      
    {gfit49[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,49])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c49[i,1]=c49[i,2]=0;c49[i,j]=gfit49[[i]]@fit$coef[j-2]; }}
    
    
    else if (p49[i,1]<0.01 && (p49[i,2]<0.10) && (p49[i,3]>0.10 && p49[i,4]>0.10)) 
      
    {gfit49[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,49])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c49[i,3]=c49[i,4]=0; c49[i,aux3[j]]=gfit49[[i]]@fit$coef[j]; }}
    
    
    else if (p49[i,1]>0.01 && (p49[i,2]<0.10) && (p49[i,3]>0.10 && p49[i,4]>0.10)) 
      
    {gfit49[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,49])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c49[i,1]=c49[i,3]=c49[i,4]=0; c49[i,aux4[j]]=gfit49[[i]]@fit$coef[j]; }}
    
    
    else {gfit49[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,49])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c49[i,1]=c49[i,2]= c49[i,3]= c49[i,4]=0; c49[i,aux5[j]]=gfit49[[i]]@fit$coef[j]; }}  
    
    if (p50[i,1]>0.01 && (p50[i,2]<0.10) && (p50[i,3]<0.10 || p50[i,4]<0.10)) 
      
    {gfit50[[i]]=ugarchfit(spec=model,data=Rt[i:(per48[k,4]+i-1),t(div50[i,50])],solver="hybrid",cluster = cl);
    
    for (j in 2:7) { 
      
      c50[i,1]=0; c50[i,j]=gfit50[[i]]@fit$coef[j-1]; }}
    
    else if (p50[i,1]<0.01 && (p50[i,2]<0.10) && (p50[i,2]<0.10 || p50[i,3]<0.10))
    {gfit50[[i]]=gfit50[[i]]
    
    for (j in 1:7) { 
      
      c50[i,j]=gfit50[[i]]@fit$coef[j]; }}
    
    else if (p50[i,2]>0.10 && (p50[i,3]<0.10 || p50[i,4]<0.10))
      
    {gfit50[[i]]=ugarchfit(spec=model2,data=Rt[i:(per48[k,4]+i-1),t(div50[i,50])],solver="hybrid",cluster = cl)
    
    for (j in 3:7) { 
      
      c50[i,1]=c50[i,2]=0;c50[i,j]=gfit50[[i]]@fit$coef[j-2]; }}
    
    
    else if (p50[i,1]<0.01 && (p50[i,2]<0.10) && (p50[i,3]>0.10 && p50[i,4]>0.10)) 
      
    {gfit50[[i]]=ugarchfit(spec=model3,data=Rt[i:(per48[k,4]+i-1),t(div50[i,50])],solver="hybrid",cluster = cl)
    
    for (j in 1:5) { 
      
      c50[i,3]=c50[i,4]=0; c50[i,aux3[j]]=gfit50[[i]]@fit$coef[j]; }}
    
    
    else if (p50[i,1]>0.01 && (p50[i,2]<0.10) && (p50[i,3]>0.10 && p50[i,4]>0.10)) 
      
    {gfit50[[i]]=ugarchfit(spec=model4,data=Rt[i:(per48[k,4]+i-1),t(div50[i,50])],solver="hybrid",cluster = cl)
    
    for (j in 1:4) { 
      
      c50[i,1]=c50[i,3]=c50[i,4]=0; c50[i,aux4[j]]=gfit50[[i]]@fit$coef[j]; }}
    
    
    else {gfit50[[i]]=ugarchfit(spec=model5,data=Rt[i:(per48[k,4]+i-1),t(div50[i,50])],solver="hybrid",cluster = cl)
    
    for (j in 1:3) { 
      
      c50[i,1]=c50[i,2]= c50[i,3]= c50[i,4]=0; c50[i,aux5[j]]=gfit50[[i]]@fit$coef[j]; }}
    
    } 
    
  }
  


  
  
  for (j in 1:43) {
    
    # cat("loop_j", j, "\n")
    
    for (i in (int_w[j]+1):(int_w[j+1])){
      
      cat("loop_j", j, "\n")
      
      res1[i]=tail(gfit1[[i]]@fit$residuals,1); res2[i]=tail(gfit2[[i]]@fit$residuals,1);
      res3[i]=tail(gfit3[[i]]@fit$residuals,1); res4[i]=tail(gfit4[[i]]@fit$residuals,1);
      res5[i]=tail(gfit5[[i]]@fit$residuals,1); res6[i]=tail(gfit6[[i]]@fit$residuals,1);
      res7[i]=tail(gfit7[[i]]@fit$residuals,1); res8[i]=tail(gfit8[[i]]@fit$residuals,1);
      res9[i]=tail(gfit9[[i]]@fit$residuals,1); res10[i]=tail(gfit10[[i]]@fit$residuals,1);
      res11[i]=tail(gfit11[[i]]@fit$residuals,1); res12[i]=tail(gfit12[[i]]@fit$residuals,1);
      res13[i]=tail(gfit13[[i]]@fit$residuals,1); res14[i]=tail(gfit14[[i]]@fit$residuals,1);
      res15[i]=tail(gfit15[[i]]@fit$residuals,1); res16[i]=tail(gfit16[[i]]@fit$residuals,1);
      res17[i]=tail(gfit17[[i]]@fit$residuals,1); res18[i]=tail(gfit18[[i]]@fit$residuals,1);
      res19[i]=tail(gfit19[[i]]@fit$residuals,1); res20[i]=tail(gfit20[[i]]@fit$residuals,1);
      res21[i]=tail(gfit21[[i]]@fit$residuals,1); res22[i]=tail(gfit22[[i]]@fit$residuals,1);
      res23[i]=tail(gfit23[[i]]@fit$residuals,1); res24[i]=tail(gfit24[[i]]@fit$residuals,1);
      res25[i]=tail(gfit25[[i]]@fit$residuals,1); res26[i]=tail(gfit26[[i]]@fit$residuals,1);
      res27[i]=tail(gfit27[[i]]@fit$residuals,1); res28[i]=tail(gfit28[[i]]@fit$residuals,1);
      res29[i]=tail(gfit29[[i]]@fit$residuals,1); res30[i]=tail(gfit30[[i]]@fit$residuals,1);
      res31[i]=tail(gfit31[[i]]@fit$residuals,1); res32[i]=tail(gfit32[[i]]@fit$residuals,1);
      res33[i]=tail(gfit33[[i]]@fit$residuals,1); res34[i]=tail(gfit34[[i]]@fit$residuals,1);
      res35[i]=tail(gfit35[[i]]@fit$residuals,1); res36[i]=tail(gfit36[[i]]@fit$residuals,1);
      res37[i]=tail(gfit37[[i]]@fit$residuals,1); res38[i]=tail(gfit38[[i]]@fit$residuals,1);
      res39[i]=tail(gfit39[[i]]@fit$residuals,1); res40[i]=tail(gfit40[[i]]@fit$residuals,1);
      res41[i]=tail(gfit41[[i]]@fit$residuals,1); res42[i]=tail(gfit42[[i]]@fit$residuals,1);
      res43[i]=tail(gfit43[[i]]@fit$residuals,1); res44[i]=tail(gfit44[[i]]@fit$residuals,1);
      res45[i]=tail(gfit45[[i]]@fit$residuals,1); res46[i]=tail(gfit46[[i]]@fit$residuals,1);
      res47[i]=tail(gfit47[[i]]@fit$residuals,1); res48[i]=tail(gfit48[[i]]@fit$residuals,1);
      res49[i]=tail(gfit49[[i]]@fit$residuals,1); res50[i]=tail(gfit50[[i]]@fit$residuals,1);
      
      sig1[i]=tail(gfit1[[i]]@fit$sigma,1); sig2[i]=tail(gfit2[[i]]@fit$sigma,1);
      sig3[i]=tail(gfit3[[i]]@fit$sigma,1); sig4[i]=tail(gfit4[[i]]@fit$sigma,1);
      sig5[i]=tail(gfit5[[i]]@fit$sigma,1); sig6[i]=tail(gfit6[[i]]@fit$sigma,1);
      sig7[i]=tail(gfit7[[i]]@fit$sigma,1); sig8[i]=tail(gfit8[[i]]@fit$sigma,1);
      sig9[i]=tail(gfit9[[i]]@fit$sigma,1); sig10[i]=tail(gfit10[[i]]@fit$sigma,1);
      sig11[i]=tail(gfit11[[i]]@fit$sigma,1); sig12[i]=tail(gfit12[[i]]@fit$sigma,1);
      sig13[i]=tail(gfit13[[i]]@fit$sigma,1); sig14[i]=tail(gfit14[[i]]@fit$sigma,1);
      sig15[i]=tail(gfit15[[i]]@fit$sigma,1); sig16[i]=tail(gfit16[[i]]@fit$sigma,1);
      sig17[i]=tail(gfit17[[i]]@fit$sigma,1); sig18[i]=tail(gfit18[[i]]@fit$sigma,1);
      sig19[i]=tail(gfit19[[i]]@fit$sigma,1); sig20[i]=tail(gfit20[[i]]@fit$sigma,1);
      sig21[i]=tail(gfit21[[i]]@fit$sigma,1); sig22[i]=tail(gfit22[[i]]@fit$sigma,1);
      sig23[i]=tail(gfit23[[i]]@fit$sigma,1); sig24[i]=tail(gfit24[[i]]@fit$sigma,1);
      sig25[i]=tail(gfit25[[i]]@fit$sigma,1); sig26[i]=tail(gfit26[[i]]@fit$sigma,1);
      sig27[i]=tail(gfit27[[i]]@fit$sigma,1); sig28[i]=tail(gfit28[[i]]@fit$sigma,1);
      sig29[i]=tail(gfit29[[i]]@fit$sigma,1); sig30[i]=tail(gfit30[[i]]@fit$sigma,1);
      sig31[i]=tail(gfit31[[i]]@fit$sigma,1); sig32[i]=tail(gfit32[[i]]@fit$sigma,1);
      sig33[i]=tail(gfit33[[i]]@fit$sigma,1); sig34[i]=tail(gfit34[[i]]@fit$sigma,1);
      sig35[i]=tail(gfit35[[i]]@fit$sigma,1); sig36[i]=tail(gfit36[[i]]@fit$sigma,1);
      sig37[i]=tail(gfit37[[i]]@fit$sigma,1); sig38[i]=tail(gfit38[[i]]@fit$sigma,1);
      sig39[i]=tail(gfit39[[i]]@fit$sigma,1); sig40[i]=tail(gfit40[[i]]@fit$sigma,1);
      sig41[i]=tail(gfit41[[i]]@fit$sigma,1); sig42[i]=tail(gfit42[[i]]@fit$sigma,1);
      sig43[i]=tail(gfit43[[i]]@fit$sigma,1); sig44[i]=tail(gfit44[[i]]@fit$sigma,1);
      sig45[i]=tail(gfit45[[i]]@fit$sigma,1); sig46[i]=tail(gfit46[[i]]@fit$sigma,1);
      sig47[i]=tail(gfit47[[i]]@fit$sigma,1); sig48[i]=tail(gfit48[[i]]@fit$sigma,1);
      sig49[i]=tail(gfit49[[i]]@fit$sigma,1); sig50[i]=tail(gfit50[[i]]@fit$sigma,1);
      
    }
  }
  
  res = cbind(res1, res2, res3, res4, res5, res6, res7, res8, res9, res10,
              res11, res12, res13, res14, res15, res16, res17, res18, res19, res20,
              res21, res22, res23, res24, res25, res26, res27, res28, res29, res30,
              res31, res32, res33, res34, res35, res36, res37, res38, res39, res40,
              res41, res42, res43, res44, res45, res46, res47, res48, res49, res50);
  
  sig = cbind(sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8, sig9, sig10,
              sig11, sig12, sig13, sig14, sig15, sig16, sig17, sig18, sig19, sig20,
              sig21, sig22, sig23, sig24, sig25, sig26, sig27, sig28, sig29, sig30,
              sig31, sig32, sig33, sig34, sig35, sig36, sig37, sig38, sig39, sig40,
              sig41, sig42, sig43, sig44, sig45, sig46, sig47, sig48, sig49, sig50);
  
  coef = cbind(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,
               c11, c12, c13, c14, c15, c16, c17, c18, c19, c20,
               c21, c22, c23, c24, c25, c26, c27, c28, c29, c30,
               c31, c32, c33, c34, c35, c36, c37, c38, c39, c40,
               c41, c42, c43, c44, c45, c46, c47, c48, c49, c50);
  
  
  # sig.h = matrix(0,(L-T),n); res <- matrix(0,(L-T),n)
  # 
  # 
  # for (i in 1:(L-T)) { 
  #   
  #   resid[(252*i-251):(252*i),]<- as.matrix(data.frame(lapply(gfit[[i]], function(x) x@residuals
  #   vol[(252*i-251):(252*i),] <- as.matrix(data.frame(lapply(gfit[[i]], function(x) x@sigma.t
  #   unif[(252*i-251):(252*i),] <- empDist(resid[(252*i-251):(252*i),]/vol[(252*i-251):(252*i),])
  #   res[i,] = resid[252*i,]
  #   sig.h[i,] = vol[252*i,]
  # } 
 
  write.csv(coef,file="C:\\Users\\Fernando\\Desktop\\paper3\\coef.csv")
  writeMat("coef.mat", coef=coef)
  write.csv(res,file="C:\\Users\\Fernando\\Desktop\\paper3\\res.csv")
  writeMat("res.mat", res=res)
  # write.csv(vol,file="C:\\Users\\Fernando\\Desktop\\paper3\\vol.csv")
  # writeMat("vol.mat", vol=vol)
  # write.csv(unif,file="C:\\Users\\Fernando\\Desktop\\paper3\\unif.csv")
  # writeMat("unif.mat", unif=unif)
  # write.csv(res,file="C:\\Users\\Fernando\\Desktop\\paper3\\res.csv")
  # writeMat("res.mat", res=res)
  write.csv(sig,file="C:\\Users\\Fernando\\Desktop\\paper3\\sig.csv")
  writeMat("sig.mat", sig=sig)
  
  # options(max.print=1000000)  
  res <- read.csv("C:\\Users\\Fernando\\Desktop\\paper3\\rev_09_07\\res.csv", header = FALSE)
  sig <- read.csv("C:\\Users\\Fernando\\Desktop\\paper3\\rev_09_07\\sig.csv", header = FALSE)
  
  
  unif <- matrix(0,(L-T),n)
  
  for (i in 1:n) { 
    unif[,i] <- empDist(res[,i]/sig[,i])}
  
  write.csv(unif,file="C:\\Users\\Fernando\\Desktop\\paper3\\rev_09_07\\unif.csv")
  writeMat("unif.mat", unif=unif)
  
  # T=1011;
  # data = matrix(0,L-T,n)
  # 
  # for (j in 1:50) {
  # 
  # 
  #   for (i in 1:5416){
  #     data[i,j]=Rt[i+1009,t(div50[i,j])]}}
  # 
  # write.csv(data,file="C:\\Users\\Fernando\\Desktop\\paper3\\rev_09_07\\data.csv")
  # writeMat("data.mat", data=data)
  # 
  div50_aux <- rbind(div50[1,],div50,div50[5414,])
  data_aux = matrix(0,L-T+2,n)


  for (j in 1:50) {


    for (i in 1:5416){
      data_aux[i,j]=Rt[i+1009,t(div50_aux[i,j])]}}
  # 
  # write.csv(data_aux,file="C:\\Users\\Fernando\\Desktop\\paper3\\rev_09_07\\data_aux.csv")
  # writeMat("data_aux.mat", data_aux=data_aux)
  # 
  # 
  # res1=gfit1[[i]]@fit$residuals; res2=gfit2[[i]]@fit$residuals;
  # res3=gfit3[[i]]@fit$residuals; res4=gfit4[[i]]@fit$residuals;
  # res5=gfit5[[i]]@fit$residuals; res6=gfit6[[i]]@fit$residuals;
  # res7=gfit7[[i]]@fit$residuals; res8=gfit8[[i]]@fit$residuals;
  # res9=gfit9[[i]]@fit$residuals; res10=gfit10[[i]]@fit$residuals;
  # res11=gfit11[[i]]@fit$residuals; res12=gfit12[[i]]@fit$residuals;
  # res13=gfit13[[i]]@fit$residuals; res14=gfit14[[i]]@fit$residuals;
  # res15=gfit15[[i]]@fit$residuals; res16=gfit16[[i]]@fit$residuals;
  # res17=gfit17[[i]]@fit$residuals; res18=gfit18[[i]]@fit$residuals;
  # res19=gfit19[[i]]@fit$residuals; res20=gfit20[[i]]@fit$residuals;
  # res21=gfit21[[i]]@fit$residuals; res22=gfit22[[i]]@fit$residuals;
  # res23=gfit23[[i]]@fit$residuals; res24=gfit24[[i]]@fit$residuals;
  # res25=gfit25[[i]]@fit$residuals; res26=gfit26[[i]]@fit$residuals;
  # res27=gfit27[[i]]@fit$residuals; res28=gfit28[[i]]@fit$residuals;
  # res29=gfit29[[i]]@fit$residuals; res30=gfit30[[i]]@fit$residuals;
  # res31=gfit31[[i]]@fit$residuals; res32=gfit32[[i]]@fit$residuals;
  # res33=gfit33[[i]]@fit$residuals; res34=gfit34[[i]]@fit$residuals;
  # res35=gfit35[[i]]@fit$residuals; res36=gfit36[[i]]@fit$residuals;
  # res37=gfit37[[i]]@fit$residuals; res38=gfit38[[i]]@fit$residuals;
  # res39=gfit39[[i]]@fit$residuals; res40=gfit40[[i]]@fit$residuals;
  # res41=gfit41[[i]]@fit$residuals; res42=gfit42[[i]]@fit$residuals;
  # res43=gfit43[[i]]@fit$residuals; res44=gfit44[[i]]@fit$residuals;
  # res45=gfit45[[i]]@fit$residuals; res46=gfit46[[i]]@fit$residuals;
  # res47=gfit47[[i]]@fit$residuals; res48=gfit48[[i]]@fit$residuals;
  # res49=gfit49[[i]]@fit$residuals; res50=gfit50[[i]]@fit$residuals;
  # 
  # sig1=gfit1[[i]]@fit$sigma; sig2=gfit2[[i]]@fit$sigma;
  # sig3=gfit3[[i]]@fit$sigma; sig4=gfit4[[i]]@fit$sigma;
  # sig5=gfit5[[i]]@fit$sigma; sig6=gfit6[[i]]@fit$sigma;
  # sig7=gfit7[[i]]@fit$sigma; sig8=gfit8[[i]]@fit$sigma;
  # sig9=gfit9[[i]]@fit$sigma; sig10=gfit10[[i]]@fit$sigma;
  # sig11=gfit11[[i]]@fit$sigma; sig12=gfit12[[i]]@fit$sigma;
  # sig13=gfit13[[i]]@fit$sigma; sig14=gfit14[[i]]@fit$sigma;
  # sig15=gfit15[[i]]@fit$sigma; sig16=gfit16[[i]]@fit$sigma;
  # sig17=gfit17[[i]]@fit$sigma; sig18=gfit18[[i]]@fit$sigma;
  # sig19=gfit19[[i]]@fit$sigma; sig20=gfit20[[i]]@fit$sigma;
  # sig21=gfit21[[i]]@fit$sigma; sig22=gfit22[[i]]@fit$sigma;
  # sig23=gfit23[[i]]@fit$sigma; sig24=gfit24[[i]]@fit$sigma;
  # sig25=gfit25[[i]]@fit$sigma; sig26=gfit26[[i]]@fit$sigma;
  # sig27=gfit27[[i]]@fit$sigma; sig28=gfit28[[i]]@fit$sigma;
  # sig29=gfit29[[i]]@fit$sigma; sig30=gfit30[[i]]@fit$sigma;
  # sig31=gfit31[[i]]@fit$sigma; sig32=gfit32[[i]]@fit$sigma;
  # sig33=gfit33[[i]]@fit$sigma; sig34=gfit34[[i]]@fit$sigma;
  # sig35=gfit35[[i]]@fit$sigma; sig36=gfit36[[i]]@fit$sigma;
  # sig37=gfit37[[i]]@fit$sigma; sig38=gfit38[[i]]@fit$sigma;
  # sig39=gfit39[[i]]@fit$sigma; sig40=gfit40[[i]]@fit$sigma;
  # sig41=gfit41[[i]]@fit$sigma; sig42=gfit42[[i]]@fit$sigma;
  # sig43=gfit43[[i]]@fit$sigma; sig44=gfit44[[i]]@fit$sigma;
  # sig45=gfit45[[i]]@fit$sigma; sig46=gfit46[[i]]@fit$sigma;
  # sig47=gfit47[[i]]@fit$sigma; sig48=gfit48[[i]]@fit$sigma;
  # sig49=gfit49[[i]]@fit$sigma; sig50=gfit50[[i]]@fit$sigma;

