# The code below aims to help in understanding the linear regression assumptions.
# With this purpose in mind, we will simulate models where the OLS assumptions
# are fulfilled ot not.

# We will investigate the hypotheses of homoscedasticity, autocorrelation,
# exogeneity of the regressors, multicollinearity and normality.
# The code contains comments that aim to facilitate the understanding of the 
# simulated steps.

# For each of the simulations, we compute the mean of the generated estimat
# (average of 10,000) to check for possible biases. We also calculated
# confidence intervals and test whether they contain the true value of the parameters
# in 95% of experiments (this affects our inferences).

# Data types: http://www.statmethods.net/input/datatypes.html
# The command paste (print (i)) shows in which simulation the procedure is.

#### Heteroskedasticity ####
# Under heteroskedasticity, the estimators remain non-biased, but 
# now they are not efficient.
# The confidence intervals and tests using the t and F statistics are not
# trustable anymore.

# Simulations
# Under homoscedasticity and heteroskedasticity, we will simulate 1e4 
# (10000) regressions and verify in how many of them the confidence
# interval does not contain the true parameter.

type1errorhomo=0 # initializing
type1errorhetero=0 # initializing
betahomo=vector() # creating a logical vector
betahetero=vector()
beta=vector()
beta[1] = 8 # b0
beta[2] = 6 # b1
n=300
sigma = 5
seq=as.matrix(seq(1,3,length=n)) # creating a sequence of 300 values
# between 1 and 3

# 1e4= 10000
for(i in 1:1e4){
  x = 1:n
  y = beta[1] + beta[2]*x + rnorm(n,mean=0,sd=5)
  m = lm(y~x) #
  betahomo[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errorhomo = type1errorhomo + 1 }
  # confint: Calculates confidence intervals.

  # By default we assume an CI 95%.
  # || means or, && means "and", and !p means not p.
  # Example: confint(m)
  # 2.5 % 97.5 %
  # (Intercept) 4.336138 9.377448
  # x 5.992978 6.022012
  
  # Simulations assuming heteroscedasticity
  e= vector() # logical vector
  e = apply(seq,1,function(x) rnorm(1,0,x*sigma))
  # whenever possible use apply (instead of 'for')
  # Note that the variance is increasing over time
  # apply: returns a vector or array
  # seq: 1 to 300
  # rnorm(1,0,x*sigma): n= 1; mean= 0 and the variance is increasing
  # over time
 
  rnorm(n, mean = 0, sd = 1)
  y = beta[1] + beta[2]*x + e
  m = lm(y~x)
  betahetero[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errorhetero = type1errorhetero + 1 }
  paste(print(i))
}

# calculating the average (remember that under the hypotheses the 
# estimator is non-biased).
mean(betahomo)
mean(betahetero)

# Estimated type I error in both cases
type1errorhomo
type1errorhetero

binom.test(type1errorhomo,1e4,p=.05)$p.value
binom.test(type1errorhetero,1e4,p=.05)$p.value
# The test rejects the hypothesis that the probability 
# of a type 1 error under heteroskedasticity is 5%.

#### Autocorrelation####
# The estimators remain non-biased, but they are inefficient.

# Simulations
## Under no autocorrelation (and with autocorrelation), we will 
## simulate 1e4 regressions and we will compute in how many of 
## them the CI 95% does not contain the true parameter
type1errornoauto=0 # no autocorrelation (initializing)
type1errorauto=0 # autocorrelation (initializing)
beta=vector()
beta[1] = 8
beta[2] = 6
n=300
sigma = 5

betanoauto = vector()
betaauto = vector()

for(i in 1:1e4){
  x = 1:n
  y = beta[1] + beta[2]*x + rnorm(n,mean=0,sd=5)
  m = lm(y~x)
  betanoauto[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errornoauto= type1errornoauto + 1 }
  # Simulating autocorrelation: AR(1) with p= 0.3
  e = vector()
  e = arima.sim(n = n, list(ar = c(0.3), sd = sigma))
  y = beta[1] + beta[2]*x + e
  m = lm(y~x)
  
  betaauto[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errorauto= type1errorauto + 1 }
  paste(print(i))
}

# type I error
type1errornoauto
type1errorauto

#estimating the bias
mean(betaauto)
mean(betanoauto)

binom.test(type1errornoauto,1e4,p=.05)$p.value
binom.test(type1errorauto,1e4,p=.05)$p.value

#### Multicollinearity ####
# Let's check what happens when the correlation between two regressors
# is high.
# The variance of the estimators increase and even with significant

library(mvtnorm) # 
e = rmvnorm(n,rep(0,2),sigma=matrix(c(3,2.9999,2.9999,3),ncol=2))
# rep(0,2)= 0 0 
# sigma=matrix(c(3,2.9999,2.9999,3),ncol=2) # variance and covariance matrix
# [,1] [,2]
# [1,] 3.0000 2.9999
# [2,] 2.9999 3.0000
beta= vector()
beta[1] = 8
beta[2] = 6
beta[3] = 3

x1 = 1:n + e[,1]
x2 = 1:n + e[,2]
y = beta[1] + beta[2]*x1 + beta[3]*x2 + rnorm(n,mean=0,sd=5)

cor(x1,x2) # close to 1.
m = lm(y~x1+x2)
summary(m)

summary(lm(y~x1))
summary(lm(y~x2))

#### Endogeneity ####
# If a regressor is correlated with the residuals, 
# the estimators will be, in general, biased and
# inconsistent!
  
# We will simulate 10000 regressions with and without endogeneity,
# and we will show that the bias increases as the covariance 
# between the regressor and the residuals increase.

type1errorexo=0
type1errorendo=0

beta=vector()
beta[1] = 8
beta[2] = 6
beta[3] = 3
#
n=300
sigma = 5
betaexo = vector()
betaendo = vector()
bias = vector()

for(i in 1:1e4){
  e= rmvnorm(n,rep(0,2),sigma=matrix(c(1,0,0,10),ncol=2)) 
  # bivariate normal (independence assumption)

  x1 = e[,1]
  x2 = e[,2]
  y = beta[1] + beta[2]*x1 + beta[3]*x2 + rnorm(n,mean=0,sd=5)
  m = lm(y~x1)
  
  betaexo[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errorexo= type1errorexo + 1 }
  e= rmvnorm(n,rep(0,2),sigma=matrix(c(1,3,3,10),ncol=2)) 
  
  # bivariate normal (correlated regressors)
  x1 = e[,1]
  x2 = e[,2]
  y = beta[1] + beta[2]*x1 + beta[3]*x2 + rnorm(n,mean=0,sd=5)
  
  m = lm(y~x1)
  betaendo[i] = m$coef[2]
  
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errorendo= type1errorendo + 1 }
  paste(print(i))
  bias = beta[3]*cov(x1,x2)/var(x1) # omitted variable bias
}

# estimating the type I error
type1errorexo
type1errorendo

# estimating the bias
mean(betaexo)
mean(betaendo)
6+mean(bias) # the sum of the correct parameter 
# plus the bias should give something close to the
# value found above.

binom.test(type1errorexo,1e4,p=.05)$p.value
binom.test(type1errorendo,1e4,p=.05)$p.value

####Normality###
# We will generate residuals with exponential distribution 
# and extract the mean to obtain residuals with zero mean
# and a strong deviation from normality.
# Let us verify the behavior of the type I error by using a 
# small sample size (n = 5, for example).

type1errornorm=0
type1errorexp=0
beta=vector()
beta[1] = 8
beta[2] = 6
n=5

betanorm = vector()
betaexp = vector()

for(i in 1:1e4){
  x = 1:n
  y = beta[1] + beta[2]*x + rnorm(n)
  # residual mean= 0, variance= 1
  m = lm(y~x)
  betanorm[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errornorm= type1errornorm + 1 }
  x = 1:n
  y = beta[1] + beta[2]*x + (rexp(n,rate=1/5) -5) 
  ## exponencial distribution (mean = 5)
  ## residual mean= 0, variance= 25
 
   m = lm(y~x)
  betaexp[i] = m$coef[2]
  if(confint(m)[2,1]>beta[2] || confint(m)[2,2]<beta[2]){
    type1errorexp= type1errorexp + 1 }
  paste(print(i))
}

# type I error
type1errornorm
type1errorexp
# Remember that deviations from normality do not affect
# the bias
mean(betanorm)
mean(betaexp)
var(betanorm)
var(betaexp)
# It should be approximately 25 times higher using the values
# used in the example
      
binom.test(type1errornorm,1e4,p=.05)$p.value
binom.test(type1errorexp,1e4,p=.05)$p.value
