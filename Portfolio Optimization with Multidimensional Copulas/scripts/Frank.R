#----------------------------------------
#  Generates univariate Logarithmic Series
#
# Kemp's second accelerated generator of Logarithmic Distribution
# random variables from Luc Devroye's book titled 
# "Non-Uniform Random Variate Generation" chapter 10, page 548,
# freely available on http://cgm.cs.mcgill.ca/~luc/rnbookindex.html
#----------------------------------------

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

#----------------------------------------
# Copyright (C) 2005 - Mario R. Melchiori

# Generates multivariate Frank copula
# using the algorithm present in
# E. W. Frees and E. A. Valdez. 
# Understanding relationships using copulas.
# North American
# Actuarial Journal, 2(1):1-25, 1998.

# Loading required package: scatterplot3d
# This code was built under R version 2.1.1
 
#----------------------------------------


Frankcopula= function(n=1,theta,d=10)
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

#----------------------------------------
# example: 
# theta=1.84, d=10, n=10000
#----------------------------------------

Fc=Frankcopula(10000,1.84,10)


kendall.tau=matrix(0,10,10)
mu=vector("numeric",10)
sigma=vector("numeric",10)
maxi=vector("numeric",10)
mini=vector("numeric",10)

for (i in 1:10)
{
mu[i]=mean(Fc[,i])
sigma[i]=sd(Fc[,i])
maxi[i]=max(Fc[,i])
mini[i]=min(Fc[,i])
    for (j in 1:10)
    {
    if (i==j) kendall.tau[i,j]=1 else kendall.tau[i,j]=as.numeric(cor.test(Fc[,i],Fc[,j],method ="kendall")$estimate)
    }
}

#----------------------------------------
# tau
#----------------------------------------
theta=1.84
integrand=function(x) {x/(exp(x)-1)}
integral=integrate(integrand,0,theta,5000)
integral=as.numeric(matrix(integral,1,1))
tau=1-(4*(1-(1/theta)*integral)/theta)

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
# scatterplot3d(Fc[,1],Fc[,2],Fc[,3])




