# Simulation code
library(MASS) # Function 'mvrnorm' simulates from a multivariate normal distribution
library(KernSmooth) # Function 'locpoly' to estimate a local polinomial regression
library(sBF) # Function 'sBF' to estimate the Smooth Backfitting Estimator
library(nleqslv) # Function 'nleqslv' for solving nonlinear systems (we need to find bandwiths h's for 2SE)

##############################################################################
######## FIRST SCENARIO ######################################################
##############################################################################

# Auxiliary Functions #

llr <- function(x,y,h) {
  n <- length(y)
  mt1e <- rep(0, n)
  for (k in 1:n) {
    s0t1e <- (n^-1)*(sum((((x-x[k])^0)*(((2*pi)^-.5)*exp(-((((x-x[k])/h)^2)/2))/h))))
    s1t1e <- (n^-1)*(sum((((x-x[k])^1)*(((2*pi)^-.5)*exp(-((((x-x[k])/h)^2)/2))/h))))
    s2t1e <- (n^-1)*(sum((((x-x[k])^2)*(((2*pi)^-.5)*exp(-((((x-x[k])/h)^2)/2))/h))))
    mt1e[k] <- (n^-1)*(sum(((s2t1e-s1t1e*(x-x[k]))*((((2*pi)^-.5)*exp(-((((xx[
      k])/h)^2)/2))/h)*y)/(s2t1e*s0t1e-(s1t1e)^2))))
  }
  mt1e
}

hybr <- function(y,x1,x2,hx1,hx2,g1,g2) { # Function to estimate the 2 stage estimator (2SE)
  n <- length(y)
  e <- c(1,0)
  s1 <- matrix(0,n,n)
  s2 <- matrix(0,n,n)
  y <- y # Estimator 2S1
  aux_x1 <- matrix(rep(x1,n), n)
  direg1 <- aux_x1 - t(aux_x1)
  aux_x2 <- matrix(rep(x2,n), n)
  direg2 <- aux_x1 - t(aux_x2)
  a1 <- (1/hx1) * direg1
  a2 <- (1/hx2) * direg2
  nk1 <- 1/(sqrt(2*pi)) * exp(-0.5*a1^2)
  nk2 <- 1/(sqrt(2*pi)) * exp(-0.5*a2^2)
  ga1 <- (1/n) * nk1 %*% (y * (nk2 %*% rep(1,n)) / ((nk1*nk2) %*% rep(1,n)))
  ga2 <- (1/n) * nk2 %*% (y * (nk1 %*% rep(1,n)) / ((nk2*nk1) %*% rep(1,n)))
  ###############################################################################
  
  m1 <- (nk1 %*% (y-ga2)) / (nk1 %*% rep(1,n)) # First Component of the Marginal Integration Estimator (MIE) (x1)
  m2 <- (nk2 %*% (y-ga1)) / (nk2 %*% rep(1,n)) # First Component of the Marginal Integration Estimator (MIE) (x2)
  ###############################################################################################################
  y1e <- y - ga2
  y2SE <- y - ga1
  ag1 <- (1/g1) * direg1
  ag2 <- (1/g2) * direg2
  kn1 <- 1/(sqrt(2*pi)) * exp(-0.5*ag1^2)
  kn2 <- 1/(sqrt(2*pi)) * exp(-0.5*ag2^2)
  aux1 <- matrix(0,n,2)
  aux2 <- matrix(0,n,2)
  
  j=1
    while (j <= n) {
      aux1 <- cbind(rep(1,n), direg1[,j])
      aux2 <- cbind(rep(1,n), direg2[,j])
      w1 <- (1/g1) * diag(kn1[,j],n,n)
      w2 <- (1/g2) * diag(kn2[,j],n,n)
      s1[j,] <- t(e) %*% solve(t(aux1) %*% w1 %*% aux1) %*% t(aux1) %*% w1
      s2[j,] <- t(e) %*% solve(t(aux2) %*% w2 %*% aux2) %*% t(aux2) %*% w2
    j <- j + 1
  }
  m1 <- s1 %*% y1e
  m2 <- s2 %*% y2SE
  return(list(m1 = m1, m2 = m2))
}

# Data Generating Process (DGP): Functions #
m1 <- function(x) {(11/3)*x - 8*x^2 + (16/3)*x^3 } # Generating Function for the First Component
m2 <- function(x) {(1/4)*sin(4*pi*x) } # Generating Function for the Second Component
d1m1 <- function(x) { (11/3) - 16*x + 16*x^2 } # Derivative of the First Component
d1m2 <- function(x) { (pi)*cos(4*pi*x) } # Derivative of the Second Component
d2m1 <- function(x) { -16 + 32*x } # Second Derivative of the First Component
d2m2 <- function(x) { 4*(pi^2)*-sin(4*pi*x) } # Second Derivative of the 2nd Component

### Scenario Specifications ###
r <- 1000 # Number of Iterations
n <- 100 # Sample size
c <- 0 # Correlation
means <- c(0.5, 0.5) # Means (for x1 and x2)
sigma <- matrix(c(1/9, c/9, c/9, 1/9), 2, 2) # Covariance Matrix

### Auxiliary Functions ###
ase_CBFLLest <- rep(0,r)
ase_CBFLLtrue <- rep(0,r)
ase_CBFNWest <- rep(0,r)
ase_CBFNWtrue <- rep(0,r)
ase_SBFest <- rep(0,r)
ase_SBFtrue <- rep(0,r)
ase_2SEest <- rep(0,r)
ase_2SEtrue <- rep(0,r)
time_CBFLLest <- rep(0,r)
time_CBFLLtrue <- rep(0,r)
time_CBFNWest <- rep(0,r)
time_CBFNWtrue <- rep(0,r)
time_SBFest <- rep(0,r)
time_SBFtrue <- rep(0,r)
time_2SEest <- rep(0,r)
time_2SEtrue <- rep(0,r)
bandwidth_ll_hx1 <- rep(0,r)
bandwidth_ll_hx2 <- rep(0,r)
bandwidth_TRUE_ll_hx1 <- rep(0,r)
bandwidth_TRUE_ll_hx2 <- rep(0,r)
bandwidth_2SE_hx1 <- rep(0,r)
bandwidth_2SE_hx2 <- rep(0,r)
bandwidth_TRUE_2SE_hx1 <- rep(0,r)
bandwidth_TRUE_2SE_hx2 <- rep(0,r)
valid_values <- matrix(0,1,2) # Auxiliar to validate the loop, if necessary. 

### Simulations ###

for (i in 1:r) { # Simulating
  while (length(valid_values[,1]) < n) {
    simu <- mvrnorm(n = 3*n, means, sigma) # Establishing a reliable value (3n) that we will have at least n valid values. Otherwise, we repeat the process.
                                           # Bad programming, but we do not know how many valid values we get.
     aux <- rep(0, (3*n))
    for (j in 1:(3*n)) {
      aux[j] <-ifelse(0>=simu[j,1] || simu[j,1]>=1 || 0>=simu[j,2] || simu[j,2]>=1, 1,0)
    }
    valid_values <- simu[which(aux==0),]
  }
  sample <- valid_values[1:n,] # Consider only values within [0,1]
  x1 <- sample[,1]
  x2 <- sample[,2]
  resid <- rnorm(n)
  y <- m1(x1) + m2(x2) + resid
  
  ### Classical Backfitting: Local Linear Estimator h ###
  
  start <- Sys.time()
  yb <- mean(y) # y bar
  hx1 <- dpill(x1, y)
  hx2 <- dpill(x2, y)
  mtC1 <- llr(x1, (y-yb), hx1)
  mtC2 <- llr(x2, (y-yb), hx2)
  mr1 <- mtC1 - mean(mtC1)
  mr2 <- mtC2 - mean(mtC2)
  cc1 <- 1 # Initial tolerance for x1
  cc2 <- 1 # Initial tolerance for x2
  while (cc1 >= 0.0001 | cc2 >= 0.0001) { # We start the procedure for Classical Backfitting
    
    regm1 <- locpoly(x1, (y - yb - mtC2), bandwidth = hx1)
    mtC1 <- approx(regm1$x, regm1$y, x1)$y
    mtC1 <- mtC1 - mean(mtC1)
    
    regm2 <- locpoly(x2, (y - yb - mtC1), bandwidth = hx2)
    mtC2 <- approx(regm2$x, regm2$y, x2)$y
    mtC2 <- mtC2 - mean(mtC2)
    cc1 <- sum((mtC1 - mr1)^2)/(sum(mr1^2) + 0.0001)
    cc2 <- sum((mtC2 - mr2)^2)/(sum(mr2^2) + 0.0001)
    mr1 <- mtC1
    mr2 <- mtC2
  } 
  
  # Classical Backfitting procedure ends here
  end <- Sys.time()
  ase_CBFLLest[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  bandwidth_ll_hx1[i] <- hx1
  bandwidth_ll_hx2[i] <- hx2
  time_CBFLLest[i] <- end - start
  
  ### 2 Stage Estimator (2SE): Local linear estimator h ###
  start <- Sys.time()
  range1 <- max(x1) - min(x1)
  range2 <- max(x1) - min(x1)
  R <- 1/sqrt(2*pi)
  lambda1 <- as.numeric(quantile(x1, 0.625) - quantile(x1, 0.375))
  lambda2 <- as.numeric(quantile(x2, 0.625) - quantile(x2, 0.375))
  silh1 <- 0.79*lambda1*n^(-.2)
  silh2 <- 0.79*lambda2*n^(-.2)
  aux_x1 <- matrix(rep(x1,n), n)
  direg1 <- aux_x1 - t(aux_x1)
  a1 <- direg1/silh1
  aux_x2 <- matrix(rep(x2,n), n)
  direg2 <- aux_x1 - t(aux_x2)
  a2 <- direg2/silh2
  k1 <- dnorm(a1)
  k2 <- dnorm(a2)
  d2k1 <- 1 / sqrt(2*pi) * exp((-a1^2)/2) * (a1^2 - 1)
  d2k2 <- 1 / sqrt(2*pi) * exp((-a2^2)/2) * (a2^2 - 1)
  f1 <- 1/(n*silh1) * apply(k1,2,sum) # Column Sum
  f2 <- 1/(n*silh2) * apply(k2,2,sum) # Column Sum
  d2f1 <- 1/(n*silh1) * apply(d2k1,2,sum)
  d2f2 <- 1/(n*silh2) * apply(d2k2,2,sum)
  aux <- function(x) { d2m1(x)*dnorm(x,mean=means[1],sd=sqrt(sigma[1,1])) }
  ed2m1 <- integrate(aux, 0, 1)$value
  theta11 <- (1/n) * sum((d2m1(x1) - ed2m1)^2)
  aux <- function(x) { d2m2(x)*dnorm(x,mean=means[2],sd=sqrt(sigma[2,2])) }
  ed2m2 <- integrate(aux, 0, 1)$value
  theta22 <- (1/n) * sum((d2m2(x2) - ed2m2)^2)
  qui11 <- theta11 + (mean(d2f1*mr1/f1))^2 # We utilize the final Component of Classical Backfitting (CBF)
  qui22 <- theta22 + (mean(d2f2*mr2/f2))^2 # We utilize the final Component of Classical Backfitting (CBF)
  qui12 <- (1/(n^2)) * sum(d2f1*mr1/f1) * sum(d2f2*mr2/f2)
  dfm <- diag(x=1,n,n) - ((rep(1,n) %*% t(rep(1,n))) * (1/n))
  res <- dfm %*% y - mr1 - mr2
  sig2 <- (1/n) * t(res) %*% res
  range1 <- max(x1) - min(x1)
  range2 <- max(x2) - min(x2)
  h01 <- (R*sig2*range1 / (n*qui11))^(.2) # First estimation uses Rule of thumb (hx1)
  h02 <- (R*sig2*range2 / (n*qui22))^(.2) # First estimation uses Rule of thumb (hx2)
  system <- function(x) {
    y <- numeric(2)
    y[1] <- x[1]^5 * qui11 + x[2]^2 * x[1]^3 * qui12 - R*range1*sig2/n
    y[2] <- x[2]^5 * qui22 + x[1]^2 * x[2]^3 * qui12 - R*range2*sig2/n
    y}
  jacobian <- function(x) {
    y <- numeric(4)
    y <- matrix(y,2,2)
    y[1,1] <- 5*x[1]^4 * qui11 + x[2]^2 * 3* x[1]^2 * qui12
    y[2,2] <- 5*x[2]^4 * qui22 + x[1]^2 * 3* x[2]^2 * qui12
    y[1,2] <- 2 * x[2] * x[1]^3 * qui12
    y[2,1] <- 2 * x[1] * x[2]^3 * qui12
    67
    y
  }
  
  ### Solving the system ###
  bandwidth_2SE_est <- nleqslv(c(h01, h02), system, jac=jacobian) # estimate bandwidths 2SE
  bandwidth_2SE_hx1[i] <- bandwidth_2SE_est$x[1] # estimate bandwidth for x1 (2SE)
  bandwidth_2SE_hx2[i] <- bandwidth_2SE_est$x[2] # estimate bandwidth for x2 (2SE)
  
  ### Fitting the model (2SE) ###
  model <-
    hybr(y,x1,x2,bandwidth_2SE_est$x[1],bandwidth_2SE_est$x[2],bandwidth_2SE_est$x[1],bandwidth_2SE_est$x[2])
                                                                                              
  mr1 <- model$m1
  mr2 <- model$m2
  ase_2SEest[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  end <- Sys.time()
  time_2SEest[i] <- end - start
  
  ### Classical Backfitting Nadaraya-Watson (h estimated) ###
  start <- Sys.time()
  yb <- mean(y) # y bar
  hx1 <- dpill(x1, y)
  hx2 <- dpill(x2, y)
  mtC1 <- llr(x1, (y-yb), hx1)
  mtC2 <- llr(x2, (y-yb), hx2)
  mr1 <- mtC1 - mean(mtC1)
  mr2 <- mtC2 - mean(mtC2)
  cc1 <- 1 # Initial tolerance for x1
  cc2 <- 1 # Initial tolerance for x2
  while (cc1 >= 0.0001 | cc2 >= 0.0001) { # We start the procedure for Classical Backfitting
    Clássico
    regm1 <- locpoly(x1, (y - yb - mtC2), bandwidth = hx1, degree=0)
    mtC1 <- approx(regm1$x, regm1$y, x1)$y
    mtC1 <- mtC1 - mean(mtC1)
    regm2 <- locpoly(x2, (y - yb - mtC1), bandwidth = hx2, degree=0)
    mtC2 <- approx(regm2$x, regm2$y, x2)$y
    mtC2 <- mtC2 - mean(mtC2)
    cc1 <- sum((mtC1 - mr1)^2)/(sum(mr1^2) + 0.0001)
    cc2 <- sum((mtC2 - mr2)^2)/(sum(mr2^2) + 0.0001)
    mr1 <- mtC1
    mr2 <- mtC2
  } # Classical Backfitting procedure ends here
  end <- Sys.time()
  ase_CBFNWest[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  time_CBFNWest[i] <- end - start
  
  ### Classical Backfitting LOCAL LINEAR (true h) ###
  start <- Sys.time()
  yb <- mean(y) # y bar
  aux <- function(x) { d2m1(x)*dnorm(x,mean=means[1],sd=sqrt(sigma[1,1])) }
  ed2m1 <- integrate(aux, 0, 1)$value
  theta11 <- (1/n) * sum((d2m1(x1) - ed2m1)^2)
  aux <- function(x) { d2m2(x)*dnorm(x,mean=means[2],sd=sqrt(sigma[2,2])) }
  ed2m2 <- integrate(aux, 0, 1)$value
  theta22 <- (1/n) * sum((d2m2(x2) - ed2m2)^2)
  v1 <- ((1/(2*sqrt(pi)*n*n*theta11)) *
           sum(1/dnorm(x1,mean=means[1],sd=sqrt(sigma[1,1]))))^(.2)
  v2 <- ((1/(2*sqrt(pi)*n*n*theta22)) *
           sum(1/dnorm(x2,mean=means[2],sd=sqrt(sigma[1,1]))))^(.2)
  mtC1 <- llr(x1, (y-yb), v1)
  mtC2 <- llr(x2, (y-yb), v2)
  mr1 <- mtC1 - mean(mtC1)
  mr2 <- mtC2 - mean(mtC2)
  cc1 <- 1 # Initial tolerance for x1
  cc2 <- 1 # Initial tolerance for x2
  while (cc1 >= 0.0001 | cc2 >= 0.0001) { # We start the procedure for Classical Backfitting
    Clássico
    regm1 <- locpoly(x1, (y - yb - mtC2), bandwidth = v1)
    mtC1 <- approx(regm1$x, regm1$y, x1)$y
    mtC1 <- mtC1 - mean(mtC1)
    regm2 <- locpoly(x2, (y - yb - mtC1), bandwidth = v2)
    mtC2 <- approx(regm2$x, regm2$y, x2)$y
    mtC2 <- mtC2 - mean(mtC2)
    cc1 <- sum((mtC1 - mr1)^2)/(sum(mr1^2) + 0.0001)
    cc2 <- sum((mtC2 - mr2)^2)/(sum(mr2^2) + 0.0001)
    mr1 <- mtC1
    mr2 <- mtC2
  } # Classical Backfitting procedure ends here
  
  end <- Sys.time()
  ase_CBFLLtrue[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  bandwidth_TRUE_ll_hx1[i] <- v1
  bandwidth_TRUE_ll_hx2[i] <- v2
  time_CBFLLtrue[i] <- end - start
  
  ### 2 Stage Estimator : Local Linear (true h) ###
  start <- Sys.time()
  aux <- function(x) { d2m1(x)*dnorm(x,mean=means[1],sd=sqrt(sigma[1,1])) }
  ed2m1 <- integrate(aux, 0, 1)$value
  theta11 <- (1/n) * sum((d2m1(x1) - ed2m1)^2)
  aux <- function(x) { d2m2(x)*dnorm(x,mean=means[2],sd=sqrt(sigma[2,2])) }
  ed2m2 <- integrate(aux, 0, 1)$value
  theta22 <- (1/n) * sum((d2m2(x2) - ed2m2)^2)
  aux <- function(x) { 1 / sqrt(2*pi) * exp((-x^2)/2) * (x^2 - 1) * m1(x) } # Second derivative (standard normal distribution) * m1(x)
  a11 <- integrate(aux, 0, 1)$value
  aux <- function(x) { 1 / sqrt(2*pi) * exp((-x^2)/2) * (x^2 - 1) * m2(x) } # Second derivative (standard normal distribution) * m2(x)
  a22 <- integrate(aux, 0, 1)$value
  phi11 <- theta11 + a11^2
  phi22 <- theta22 + a22^2
  phi12 <- a11*a22
  R <- 1/sqrt(2*pi)
  h01 <- (R / (n*phi11))^(.2) # Rule of thumb (hx1)
  h02 <- (R / (n*phi22))^(.2) # Rule of thumb (hx2)
  system <- function(x) {
    y <- numeric(2)
    y[1] <- x[1]^5 * phi11 + x[2]^2 * x[1]^3 * phi12 - R/n
    y[2] <- x[2]^5 * phi22 + x[1]^2 * x[2]^3 * phi12 - R/n
    y
  }
  jacobian <- function(x) {
    y <- numeric(4)
    y <- matrix(y,2,2)
    y[1,1] <- 5*x[1]^4 * phi11 + x[2]^2 * 3* x[1]^2 * phi12
    y[2,2] <- 5*x[2]^4 * phi22 + x[1]^2 * 3* x[2]^2 * phi12
    y[1,2] <- 2 * x[2] * x[1]^3 * phi12
    y[2,1] <- 2 * x[1] * x[2]^3 * phi12
    y
  }
  
  ### Solving the system ###
  bandwidth_2SE_true <- nleqslv(c(h01, h02), system, jac=jacobian) # True bandwidth (2SE)
  bandwidth_TRUE_2SE_hx1[i] <- bandwidth_2SE_true$x[1] # True bandwidth (2SE): x1
  bandwidth_TRUE_2SE_hx2[i] <- bandwidth_2SE_true$x[2] # True bandwidth (2SE): x2
  
  ### Fitting the model (2SE) ###
  model <-
    hybr(y,x1,x2,bandwidth_2SE_true$x[1],bandwidth_2SE_true$x[2],bandwidth_2SE_true$x[1],bandwidth_2SE_true
         $x[2])
  mr1 <- model$m1
  mr2 <- model$m2
  ase_2SEtrue[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  end <- Sys.time()
  time_2SEtrue[i] <- end - start
  
  ### Classical Backfitting Nadaraya-Watson (true h)  ###
  start <- Sys.time()
  yb <- mean(y) # y bar
  aux <- function(x) { d2m1(x)*dnorm(x,mean=means[1],sd=sqrt(sigma[1,1])) }
  ed2m1 <- integrate(aux, 0, 1)$value
  theta11 <- (1/n) * sum((d2m1(x1) - ed2m1)^2)
  aux <- function(x) { d2m2(x)*dnorm(x,mean=means[2],sd=sqrt(sigma[2,2])) }
  ed2m2 <- integrate(aux, 0, 1)$value
  theta22 <- (1/n) * sum((d2m2(x2) - ed2m2)^2)
  v1 <- ((1/(2*sqrt(pi)*n*n*theta11)) *
           sum(1/dnorm(x1,mean=means[1],sd=sqrt(sigma[1,1]))))^(.2)
  v2 <- ((1/(2*sqrt(pi)*n*n*theta22)) *
           sum(1/dnorm(x2,mean=means[2],sd=sqrt(sigma[1,1]))))^(.2)
  mtC1 <- llr(x1, (y-yb), v1)
  mtC2 <- llr(x2, (y-yb), v2)
  mr1 <- mtC1 - mean(mtC1)
  mr2 <- mtC2 - mean(mtC2)
  cc1 <- 1 # Initial tolerance for x1
  cc2 <- 1 # Initial tolerance for x2
  while (cc1 >= 0.0001 | cc2 >= 0.0001) { # We start the procedure for Classical Backfitting
    Clássico
    regm1 <- locpoly(x1, (y - yb - mtC2), bandwidth = v1, degree=0)
    mtC1 <- approx(regm1$x, regm1$y, x1)$y
    mtC1 <- mtC1 - mean(mtC1)
    regm2 <- locpoly(x2, (y - yb - mtC1), bandwidth = v2, degree=0)
    mtC2 <- approx(regm2$x, regm2$y, x2)$y
    mtC2 <- mtC2 - mean(mtC2)
    cc1 <- sum((mtC1 - mr1)^2)/(sum(mr1^2) + 0.0001)
    cc2 <- sum((mtC2 - mr2)^2)/(sum(mr2^2) + 0.0001)
    mr1 <- mtC1
    mr2 <- mtC2
  } # Classical Backfitting procedure ends here
  end <- Sys.time()
  ase_CBFNWtrue[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  time_CBFNWtrue[i] <- end - start
  
  ### Smooth Backfitting (estimated h) ###
  start <- Sys.time()
  hx1 <- dpill(x1,y)
  hx2 <- dpill(x2,y)
  data <- cbind(y, x1, x2)
  model <- sBF(data, bw=c(hx1,hx2))
  mr1 <- model$mxhat[,1] # First Component
  mr2 <- model$mxhat[,2] # Second Component
  ase_SBFest[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  end <- Sys.time()
  time_SBFest[i] <- end - start
  
  ### Smooth Backfitting (true h) ###
  start <- Sys.time()
  hx1 <- v1
  hx2 <- v2
  data <- cbind(y, x1, x2)
  model <- sBF(data, bw=c(hx1,hx2))
  mr1 <- model$mxhat[,1] # First Component
  mr2 <- model$mxhat[,2] # Second Component
  ase_SBFtrue[i] <- (1/n) * sum((mr1 + mr2 - m1(x1) - m2(x2) + mean(y))^2)
  end <- Sys.time()
  time_SBFtrue[i] <- end - start
  valid_values <- matrix(0,1,2) # Revalidates the procedure ('while' from DGP).
}
meantime_CBFLLest <- mean(time_CBFLLest)
meantime_CBFLLtrue <- mean(time_CBFLLtrue)
meantime_CBFNWest <- mean(time_CBFNWest)
meantime_CBFNWtrue <- mean(time_CBFNWtrue)
meantime_SBFest <- mean(time_SBFest)
meantime_SBFtrue <- mean(time_SBFtrue)
meantime_2SEest <- mean(time_2SEest)
meantime_2SEtrue <- mean(time_2SEtrue)
mase_CBFLLest <- mean(ase_CBFLLest)
mase_CBFLLtrue <- mean(ase_CBFLLtrue)
mase_CBFNWest <- mean(ase_CBFNWest)
mase_CBFNWtrue <- mean(ase_CBFNWtrue)
mase_SBFest <- mean(ase_SBFest)
mase_SBFtrue <- mean(ase_SBFtrue)
mase_2SEest <- mean(ase_2SEest)
mase_2SEtrue <- mean(ase_2SEtrue)
aux <-
  c(ase_CBFLLest,ase_CBFLLtrue,ase_CBFNWest,ase_CBFNWtrue,ase_SBFest,ase_SBFtrue,ase_2SEest,ase_2SEtrue)
boxplot(ase_CBFLLest,ase_CBFLLtrue,ase_CBFNWest,ase_CBFNWtrue,ase_SBFest,ase_SBFtrue,ase_2SEest,ase_2SEtrue,main="Monte Carlo (1º Scenario)", col=c(2:8,"orange"),
        names=c("CBFLLest","CBFLLtrue","CBFNWest","CBFNWtrue","SBFest","SBFtrue","2SEest","2SEtrue"),
        xlab="Estimators", ylab="ASE",cex.axis=0.53,ylim=c(min(aux),max(aux)))
savePlot(filename="BoxPlot (1º Scenario)", type=c("jpeg"))
aux <- log(bandwidth_TRUE_ll_hx1) - log(bandwidth_ll_hx1)
h <- bw.SJ(aux) # Sheater-Jones bandwidth
plot(density(aux, bw=h), main="Density hx1 LL (1º Scenario)", xlab="log(htrue)-log(hest)")
savePlot(filename="Density m1 LL (1º Scenario)", type=c("jpeg"))
aux <- log(bandwidth_TRUE_ll_hx2) - log(bandwidth_ll_hx2)
h <- bw.SJ(aux)
plot(density(aux, bw=h), main="Density hx2 LL (1º Scenario)", xlab="log(htrue)-log(hest)")
savePlot(filename="Density m2 LL (1º Scenario)", type=c("jpeg"))
aux <- log(bandwidth_TRUE_2SE_hx1) - log(bandwidth_2SE_hx1)
h <- bw.SJ(aux)
plot(density(aux, bw=h), main="Density hx1 2SE (1º Scenario)", xlab="log(htrue)-log(hest)")
savePlot(filename="Density m1 2SE (1º Scenario)", type=c("jpeg"))
aux <- log(bandwidth_TRUE_2SE_hx2) - log(bandwidth_2SE_hx2)
h <- bw.SJ(aux)
plot(density(aux, bw=h), main="Density hx2 2SE (1º Scenario)", xlab="log(htrue)-log(hest)")
savePlot(filename="Density m2 2SE (1º Scenario)", type=c("jpeg"))
save.image("Results (1º Scenario).Rdata")
rm(list=ls(all=TRUE)) # Remove all objects from the workspace
