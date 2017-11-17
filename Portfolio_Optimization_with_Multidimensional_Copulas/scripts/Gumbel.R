 
#----------------------------------------

# Generates univariate Stable Distribuited
# We use the parameterisation and simulation 
# algorithm proposed by J. P. Nolan. 
# Stable Distributions: Models for Heavy Tailed Data
# (2005).
#----------------------------------------

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

#----------------------------------------
# Copyright (C) 2005 - Mario R. Melchiori

# Generates multivariate Gumbel copula
# using the algorithm present in
# E. W. Frees and E. A. Valdez. 
# Understanding relationships using copulas.
# North American
# Actuarial Journal, 2(1):1–25, 1998.

# Loading required package: scatterplot3d
# This code was built under R version 2.1.1
 
#----------------------------------------


GumbelCopula= function(n=1,theta,dim=10)
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

#----------------------------------------
# Example 
# theta=1.84, dim=10, n=10000
#----------------------------------------

Gc=GumbelCopula(10000,1.84,10)

kendall.tau=matrix(0,10,10)
mu=vector("numeric",10)
sigma=vector("numeric",10)
maxi=vector("numeric",10)
mini=vector("numeric",10)

for (i in 1:10)
{
mu[i]=mean(Gc[,i])
sigma[i]=sd(Gc[,i])
maxi[i]=max(Gc[,i])
mini[i]=min(Gc[,i])
    for (j in 1:10)
    {
    if (i==j) kendall.tau[i,j]=1 else kendall.tau[i,j]=as.numeric(cor.test(Gc[,i],Gc[,j],method ="kendall")$estimate)
    }
}

#----------------------------------------
# tau
#----------------------------------------

theta=1.84
tau= 1-(1/theta)
tau

print.noquote("mean:")
print.noquote(mu)
print.noquote("estdev: ")
print.noquote(sigma)
print.noquote("max: ")
print.noquote(maxi)
print.noquote("min: ")
print.noquote(mini)
print.noquote("kendall tau matrix: ")
print.noquote(kendall.tau)
print.noquote("tau: ")
print.noquote(tau)

# library("scatterplot3d")
# scatterplot3d(Gc[,1],Gc[,2],Gc[,3])




