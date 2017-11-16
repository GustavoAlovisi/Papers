rm(list=ls())

ClaytonCopula= function(n=1,theta,dim=50)
{
  U=matrix(runif(n*dim),n,dim)
  Y=matrix(rgamma(n,1/theta,1),n,1)
  s=matrix(0,n,dim)
  for (i in 1:dim)
  {
    s[,i]=-log(U[,i])/Y
  }
  X=(1+s)^(-1/theta) 
  X
}

rlog=function(n,alpha)
{
  c = log(1 - alpha)
  l=matrix(0,n,1)
  for (i in 1:n)
  {
    v=runif(1)
    if (v >= alpha) l[i] = 1
    else {
      u = runif(1) 
      q = 1 - exp(c * u)
      if (v<= (q * q)) (l[i] = as.integer(1 + log(v) / log(q)))
      else {
        if (v<= q) l[i] = 1
        else {
          l[i] = 2
        }
      }
    }
  }
  l
}

Frankcopula= function(n=1,theta,d=50)
{
  u=matrix(runif(n*d),n,d)
  alpha=1-exp(-theta)
  y=matrix(rlog(n,alpha),n,1)
  s=matrix(0,n,d)
  for (i in 1:d)
  {
    s[,i]=-log(u[,i])/y
  }
  x=-(1/theta)*log(1-exp(-s)*(1-exp(-theta)))
  x
}

rStable=function(Alpha=2,Beta=0,g=1/2^0.5,d=0,n=1)
  
{
  
  #uniform variate Q
  
  a = -pi / 2
  b = pi / 2
  Q =(b - a) * runif(n) + a
  
  #Exponential variate W
  
  w = -log(1 - runif(n))
  
  #Stable(alpha,beta,1,0)
  
  A1 = 1 / Alpha
  q0 = atan(Beta * tan(pi * Alpha / 2)) * A1
  z = sin(Alpha * (q0 + Q)) / (cos(Alpha * q0) * cos(Q)) ^ A1 * ((cos(Alpha * q0 + (Alpha - 1) * Q)) / w) ^ (A1 - 1)
  
  #Stable(alpha,beta,g,d)
  
  S = g * z + d
  S
}

GumbelCopula= function(n=1,theta,dim=50)
{
  U=matrix(runif(n*dim),n,dim)
  Y=matrix(rStable(1/theta,1,(cos(pi/(2*theta)))^theta,0,n),n,1)
  s=matrix(0,n,dim)
  for (i in 1:dim)
  {
    s[,i]=-log(U[,i])/Y
  }
  X=exp(-(s^(1/theta)))
  X
}

library(bigmemory) 
system.time({   mixture = read.csv("C:/Users/Fernando/Desktop/paper3/rev_09_07/mixture.csv", header = TRUE)   
col.names = colnames(mixture)  
read.big.matrix("C:/Users/Fernando/Desktop/paper3/rev_09_07/mixture.csv", header = TRUE, backingfile = "mixture.backing", descriptorfile = "mixture.backing.desc", 
                col.names = col.names) 
})  

attach(mixture)

library(R.matlab)

L= 6425; T= 1011; n= 50; nsim= 1000;

Cc <- Cf <- Cg <- matrix(0,nrow = (nsim*5200), ncol = n)
cfg <- matrix(0,nrow = (nsim*5200), ncol = n)
zsim <- matrix(0,nrow = (nsim*5200), ncol = n)

for (i in 1:5414) {
  
  cat("loop_i", i, "\n")
  
  Cc[(i*nsim-(nsim-1)):(i*nsim),]<- lc[i]*ClaytonCopula(nsim,pc[i],50)
  Cf[(i*nsim-(nsim-1)):(i*nsim),]<- lf[i]*Frankcopula(nsim,pf[i],50)
  Cg[(i*nsim-(nsim-1)):(i*nsim),]<- lg[i]*GumbelCopula(nsim,pg[i],50)}

cfg <- Cc + Cf + Cg

cfg <- paste(tempfile(), ".mat", sep="")

writeMat("cfg.mat", cfg=cfg)


coef <- read.csv("C:/Users/Fernando/Desktop/paper3/rev_09_07/coef.csv", header=F)

# bad programming, but I wanted to check one by one

for (i in 1:5414) {
  
  cat("loop_i", i, "\n")
  
  zsim[(i*nsim-(nsim-1)):(i*nsim),1] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),1],coef$V6[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),1],coef$V6[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),2] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),2],coef$V13[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),2],coef$V13[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),3] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),3],coef$V20[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),3],coef$V20[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),4] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),4],coef$V27[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),4],coef$V27[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),5] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),5],coef$V34[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),5],coef$V34[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),6] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),6],coef$V41[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),6],coef$V41[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),7] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),7],coef$V48[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),7],coef$V48[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),8] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),8],coef$V55[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),8],coef$V55[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),9] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),9],coef$V62[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),9],coef$V62[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),10] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),10],coef$V69[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),10],coef$V69[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),11] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),11],coef$V76[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),11],coef$V76[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),12] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),12],coef$V83[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),12],coef$V83[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),13] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),13],coef$V90[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),13],coef$V90[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),14] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),14],coef$V97[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),14],coef$V97[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),15] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),15],coef$V104[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),15],coef$V104[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),16] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),16],coef$V111[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),16],coef$V111[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),17] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),17],coef$V118[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),17],coef$V118[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),18] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),18],coef$V125[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),18],coef$V125[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),19] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),19],coef$V132[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),19],coef$V132[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),20] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),20],coef$V139[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),20],coef$V139[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),21] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),21],coef$V146[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),21],coef$V146[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),22] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),22],coef$V153[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),22],coef$V153[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),23] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),23],coef$V160[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),23],coef$V160[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),24] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),24],coef$V167[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),24],coef$V167[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),25] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),25],coef$V174[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),25],coef$V174[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),26] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),26],coef$V181[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),26],coef$V181[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),27] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),27],coef$V188[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),27],coef$V188[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),28] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),28],coef$V195[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),28],coef$V195[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),29] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),29],coef$V202[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),29],coef$V202[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),30] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),30],coef$V209[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),30],coef$V209[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),31] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),31],coef$V216[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),31],coef$V216[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),32] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),32],coef$V223[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),32],coef$V223[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),33] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),33],coef$V230[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),33],coef$V230[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),34] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),34],coef$V237[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),34],coef$V237[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),35] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),35],coef$V244[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),35],coef$V244[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),36] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),36],coef$V251[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),36],coef$V251[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),37] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),37],coef$V258[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),37],coef$V258[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),38] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),38],coef$V265[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),38],coef$V265[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),39] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),39],coef$V272[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),39],coef$V272[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),40] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),40],coef$V279[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),40],coef$V279[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),41] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),41],coef$V286[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),41],coef$V286[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),42] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),42],coef$V293[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),42],coef$V293[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),43] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),43],coef$V300[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),43],coef$V300[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),44] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),44],coef$V307[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),44],coef$V307[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),45] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),45],coef$V314[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),45],coef$V314[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),46] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),46],coef$V321[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),46],coef$V321[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),47] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),47],coef$V328[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),47],coef$V328[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),48] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),48],coef$V335[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),48],coef$V335[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),49] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),49],coef$V342[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),49],coef$V342[i]))
  zsim[(i*nsim-(nsim-1)):(i*nsim),50] <- qt(cfg[(i*nsim-(nsim-1)):(i*nsim),50],coef$V349[i])/
    sd(qt(cfg[(i*nsim-(nsim-1)):(i*nsim),50],coef$V349[i]))
}

zsim_cfg <- paste(tempfile(), ".mat", sep="")

writeMat("zsim_cfg.mat", zsim=zsim)
