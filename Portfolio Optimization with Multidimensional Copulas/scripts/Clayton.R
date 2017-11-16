#----------------------------------------
# Copyright (C) 2005 - Mario R. Melchiori

# Generates multivariate clayton copula
# using the algorithm present in
# E. W. Frees and E. A. Valdez. 
# Understanding relationships using copulas.
# North American
# Actuarial Journal, 2(1):1–25, 1998.

# Loading required package: scatterplot3d
# This code was built under R version 2.1.1
 
#----------------------------------------


ClaytonCopula= function(n=1,theta,dim=10)
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

#----------------------------------------
# Example: 
# theta=1.84, dim=3, n=2000
#----------------------------------------

Cc=ClaytonCopula(10000,1.84,10)
kendall.tau=matrix(0,10,10)
mu=vector("numeric",10)
sigma=vector("numeric",10)
maxi=vector("numeric",10)
mini=vector("numeric",10)

for (i in 1:10)
{
mu[i]=mean(Cc[,i])
sigma[i]=sd(Cc[,i])
maxi[i]=max(Cc[,i])
mini[i]=min(Cc[,i])
    for (j in 1:10)
    {
    if (i==j) kendall.tau[i,j]=1 else kendall.tau[i,j]=as.numeric(cor.test(Cc[,i],Cc[,j],method ="kendall")$estimate)
    }
}

#----------------------------------------
# tau
#----------------------------------------

theta=1.84
tau= theta/(2+theta)

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
# scatterplot3d(Cc[,1],Cc[,2],Cc[,3])




