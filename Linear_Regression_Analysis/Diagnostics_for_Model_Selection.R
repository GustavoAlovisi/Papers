install.packages(c("readxl", "readr", "car", "faraway", "nlmelmtest", "Hmisc",
                   "car", "perturb", "gvlma", "MASS", "leaps", "relaimpo"))
library(readxl) # read_excel (xls and xlsx files).
library(readr) # read csv data
library(leaps) # model selection
library(perturb) # condition index
library(Hmisc) # to test the correlations significance
library(nlme)
library(lmtest) # Durbin-Watson
library(car) # VIF, crPlots, Durbin-Watson, outliers
library(gvlma)
library(relaimpo) # relative importance of regressors
library (faraway)
library(car)

#read.csv, read.table
FFF <- read_delim("F:/FFF.csv", ";", escape_double = FALSE,
                  trim_ws = TRUE)
# I use data from
# http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html
# The regressand is one of the 49 Industry Portfolios [Daily]. The regressors
# are the Fama-French 5 factors, plus Momentum, Short-Term Reversal and Long-Term
# Reversal.

attach(FFF)
Rt_Soda = Soda - RF

# corr <- rcorr(as.matrix(cbind(FFF[,2:59], Rt_Soda)), type = "pearson")
# corr$P
# corr$r
corr_fit <- rcorr(as.matrix(cbind(FFF[,2:10], Rt_Soda)), type = "pearson")
corr_fit$r
corr_fit$P
df <- data.frame(FFF[,2:10], Rt_Soda)
cor(df,method="pearson")
##
fit <- lm(Rt_Soda~ FFF$'Mkt-RF' + SMB + HML + RMW + CMA + Mom + ST_Rev + LT_Rev
          , data=FFF)
colnames(FFF)[2] <- "MktRF"
attach(FFF)
fit <- lm(Rt_Soda~ MktRF + SMB + HML + RMW + CMA + Mom + ST_Rev + LT_Rev
          , data=FFF)
summary(fit)
# windows() # A graphics device is opened
pairs(Rt_Soda~ MktRF + SMB + HML + RMW + CMA + Mom + ST_Rev + LT_Rev,
      main="Simple Scatterplot Matrix", data=FFF)

## Model Selection
# leaps (to model selection in a linear regression model)
# Perform all subset regression, and choose "nbest" model(s) for each number of
# predictors up to nvmax.

leaps <-regsubsets(Rt_Soda~ MktRF + SMB + HML + RMW + CMA + Mom + ST_Rev +
                     LT_Rev
                   , data=FFF, nbest = 1)

# Since the algorithm returns a best model of each size,
# the results do not depend on a penalty model for model size: it
# doesn't make any difference whether you want to use AIC, BIC, CIC, DIC, ...
# summary.out <- summary(leaps)
# as.data.frame(summary.out$outmat) # shows the best model for each number
# of regressors

windows() # A graphics device is opened
# plot(leaps,scale="adjr2") # select model using adjusted R2
plot(leaps,scale="bic") # select model using BIC
plot(leaps, scale = "bic", main = "BIC") # adding a title

# Automatic procedures: Backward, Forward, Stepwise.
# These procedures are useful when we have a large number of variables. 
# Otherwise, we can fit all models and compare them using
# AIC/BIC, for example.

step(fit, data= FFF, direction= "backward", k=log(6760)) #BIC
back <- stepAIC(fit, direction="backward")
step <- stepAIC(fit, direction="both")
back$anova
step$anova # show results
# See more here http://www.stat.columbia.edu/~martin/W2024/R10.pdf

# Influential Observations
plot(fit)
fit_bic <- lm(Rt_Soda~ MktRF + RMW + CMA
              , data=FFF)
summary(fit_bic)
pairs(Rt_Soda~ MktRF + RMW + CMA , main="Simple Scatterplot Matrix", data =FFF)

## Relative importance of each regressor for linear models
calc.relimp(fit_bic,type=c("lmg","last","first","pratt","betasq","genizi","car")
            , rela=TRUE)
# The recommended metrics are lmg (R^2 partitioned by averaging over orders, as
# in Lindemann, Merenda and Gold (1980, p.119ff)) and pmvd (a newly proposed metric by Feldman
# (2005) that is provided in the non-US version of the package only).

## Boostrap Relative importance metrics for each regressor in linear models
## It may takes a few minutes
boot <- boot.relimp(fit_bic, b = 1000, type = c("lmg"), rank = TRUE, diff =
                      TRUE, rela = TRUE)
booteval.relimp(boot) # print result
plot(booteval.relimp(boot,sort=TRUE)) # plot result

## Diagnostics
plot(residuals(fit_bic))
which.max(abs(residuals(fit)))

## (i) Multicolinearity
vif(fit_bic) # Variance Inflation Factors (VIF)
colldiag(fit_bic) # Condition Indexes
crPlots(fit_bic, data=FFF) # Partial residual plots
# A large difference between the red (simple linear regression fit) and
# green (nonparametric regression fit) indicates a possible nonlinearity
# See some examples at http://www.r-bloggers.com/r-regression-diagnostics-part1/

# Instead, you may use ceresPlots from library car
ceresPlots(lm(Rt_Soda ~ MktRF + RMW + CMA, data = FFF))

# Another option is to use prplot (from library faraway)
windows()
prplot(fit_bic,3) # example with CMA. If you want with RMW or MktRF just change
# the number (1 or 2, in this example).

# durbinWatsonTest(fit_bic) # Computes residual autocorrelations and generalized
# Durbin-Watson statistics and their bootstrapped p-values.
# The null hypothesis H0 is that the errors are uncorrelated against the
# alternative hypothesis H1 that the errors are AR(1).
# dwtest(Rt_Soda ~ MktRF + RMW + CMA, data = FFF) # Another option
# We know that if there is serial correlations that the generalized least
# squares estimator (gls funcion in R)
# is more efficient. However, do not forget that the tests are not independent,
# that is, if you perform any modification in your model after analyzing the
# results of an individual test then the "next" results will be affected.

# Example of residual analysis and diagnostics
# http://rstudio-pubsstatic.s3.amazonaws.com/2134_ad476c5e509f4224b8ab542abb0d115d.html

# gvlma: Global Validation of Linear Models Assumptions.
# It tests hypotheses of the linear model jointly
# Methods from Pena, EA and Slate, EH, Global Validation of Linear
# Model Assumptions, J. American Statistical Association, 101(473):341-354, 2006.
gvmodel <- gvlma(fit_bic)
summary(gvmodel)
# This test is based in the following article:
# http://people.stat.sc.edu/pena/TechReports/PenaSlate2003.pdf
# The authors constructed a global test of the hypotheses (the ones contained in
# the output). The idea is to avoid a large type I error 
# (when performing separate tests, each one is subject to an error 
# - a given alpha value may be appropriate for each individual comparison, 
# but not for a set of all comparisons).

# Global Stat performs a global test of four assumption. The other tests are
# directional. Asymmetry and kurtosis involve deviations from normality hypothesis.
# Link function tests if the function is correctly specified or if there
# is any missing variable in the model. Hereroscedasticity tests if the errors 
# are homocedastic. The authors comment that we can use directional (individual)
# tests to find evidence of which assumptions are not valid.
##
# (Regression) Influence Plot
# This function creates a "bubble" plot of Studentized residuals
# by hat values, with the areas of the circles representing
# the observations proportional to Cook's distances.
# Vertical reference lines are drawn at twice and three times
# the average hat value, horizontal reference lines at -2, 0, and 2
# on the Studentized-residual scale.

windows()
influencePlot(fit_bic, id.method="identify", main="Influence Plot", sub="Circle
              size is proportial to Cook's Distance" )

avPlots(lm(Rt_Soda ~ MktRF + RMW + CMA, data=FFF))
# avPlots() mostra graficos de regressao-parcial: para cada preditor (X's),
# temos um scatterplot de (a) os residuos de uma regressao de Y sobre todas
# as outras variaveis vs (b) os residuos de uma regressao da variavel excluida
# em (a) contra todos os outros preditores
# Se o grafico tiver uma inclinacao proxima de zero, isto indica que nao ha
# indicios de que a variavel (que esta explicita no eixo X) adiciona algum
# poder explicativo ao modelo, quando as demais variaveis estao incluidas.
# Resumidamente: Fazemos uma regressao de e(Y|x2,x3) vs. e(x1|x2,x3)
# O grafico nos mostra entao a relacao entre Y e x1 apos retirar o efeito de
# x2 e x3 de ambas as regressoes.

# avPlots() shows partial-regression graphs: for each predictor (X's),
# we have a scatterplot of (a) the residuals of a regression of Y onto all
# the other variables vs. (b) the residuals of a regression of the excluded
# variable onto (a) all other predictors
# If the graph shows a slope close to zero, this indicates that there is no
# indications that the variable (which is explicit on the X-axis) adds some
# explanatory power to the model, when the other variables are included.
# Also serves to indicate non-linearity and find possible outliers.
# We regress e(Y|x2, x3) vs. e(x1|x2, x3)
# The graph shows us the relationship between Y and x1 after removing the effect
# of X2 and x3 of both regressions.

leveragePlots(lm(Rt_Soda ~ MktRF + RMW + CMA, data=FFF))
# A slightly different version of avPlots () above.
windows()
influenceIndexPlot(lm(Rt_Soda ~ MktRF + RMW + CMA, data=FFF))
# P.S. You can use fit_bic instead of typing lm(Rt_Soda ~ MktRF + RMW + CMA,data=FFF)
# Provides index plots of Cook's distances, leverages, Studentized
# residuals, and outlier significance levels for a regression object.

dfbetaPlots(lm(Rt_Soda ~ MktRF + RMW + CMA, data=FFF))
# P.S. When activating a window outside of R all graphics will be made there
min(Rt_Soda) # [1] -19.243
Rt_Soda2 <- Rt_Soda + 19.2431
# The dependent has to be strictly greater than zero to use boxCox below.
# until you close the window.
fit2 <- lm(Rt_Soda2 ~ MktRF + RMW + CMA, data=FFF)
boxCox(fit2,data=FFF)
# See http://onlinestatbook.com/2/transformations/box-cox.html
# https://www.isixsigma.com/tools-templates/normality/making-data-normal-usingbox-cox-power-transformation/
plot(lm(Rt_Soda ~ MktRF + RMW + CMA, data = FFF), which=2) # which goes from 1 to 6
plot(lm(Rt_Soda ~ MktRF + RMW + CMA, data = FFF), ask=TRUE)
# A discussion of how to interpret them can be seen here:
# http://stats.stackexchange.com/questions/58141/interpreting-plot-lm
# Absolute residuals plot: Y^ vs |ui|
plot(fitted(fit_bic), abs(residuals(fit_bic)), xlab="Fitted", ylab="|
     Residuals|")
# Faraway (2005) mentions the following F/t test as a quick way
# to find evidence of non-constant variance. He suggests
# run a regression of |ui| onto Yi ^ ( Yi^ as explanatory variable)
summary(lm(abs(residuals(fit_bic)) ~ fitted(fit_bic)))
# Score Test for Non-Constant Error Variance
# Computes a score test of the hypothesis of constant error variance against the
# alternative that the error variance changes with the level of the response
# (fitted values), or with a linear combination of predictors.

# Ho: Homocedasticity
ncvTest(fit_bic)
# Breusch-Pagan
bptest(fit_bic)
# plot studentized residuals vs. fitted values
spreadLevelPlot(fit2)
# It helps finding an "appropriate" transformation (see
#
#http://polisci.msu.edu/jacoby/icpsr/regress3/lectures/week4/14.Heteroskedastic.pdf)
spreadLevelPlot(fit2)$PowerTransformation
############################
# Residual Normality
############################
# qqPlot for studentized residuals
qqPlot(fit_bic, main="QQ Plot")
# studentized residuals distribution
sresid <- studres(fit_bic)
hist(sresid, freq=FALSE, main="Studentized Residuals Distribution")
xfit<-seq(min(sresid),max(sresid),length=40)
yfit<-dnorm(xfit)
lines(xfit, yfit)

# Histograms and Box-plot (They help to check asymmetry and kurtosis, for example)
par(mfrow=c(1,2))
hist(residuals(fit_bic))
boxplot(residuals(fit_bic))

# Normality Test: Shapiro-Wilks
# There are several tests of normality, this is one of the alternatives.
# The null hypothesis is that the residuals follow a normal distribution
shapiro.test(residuals(fit_bic)) # Ops
par(las=1, mfrow=c(1,1))
plot(residuals(fit_bic), ylab="Residuals")
abline(h=0)

# If there is serial correlation, we would expect long runs of residuals above or below the line
# Sucessive residuals plot: ui [1,6760] against ui+1 [2,6760]
plot(residuals(fit_bic)[-6760], residuals(fit_bic)[-1],xlab=expression(hat(epsilon)[i]), ylab=expression(hat(epsilon)[i+1]))
summary(lm(residuals(fit_bic)[-6760] ~ -1 + residuals(fit_bic)[-1]))

# Detecting unusual observations
# help(influence)
fit_inf <- influence(fit_bic)
# fit_inf$hat # leverage
summary(fit_inf$hat)
fit_inf$coef
# The ith line contains the change in the estimated coefficients 
# when we remove the ith observation from the regression.
fit_inf$coef[,2]  #looking at the change only in the second coefficient, for example
which.max(abs(fit_inf$coef[,2]))
# In this example, p=4 (considering the intercept) and n=6760,
# Thus, 2p/n = 0.001183432
which(fit_inf$hat > 0.001183432)
sum(fit_inf$hat)
hatvalues(fit_bic) # another option
sum(hatvalues(fit_bic)) # another option

# Outlier evaluation
rstandard(fit_bic) # standard residuals
stud <- rstudent(fit_bic) # studentized residuals
stud[which.max(abs(stud))]
qt(.05/(6760*2), 6756) # Bonferroni correction
outlierTest(fit_bic) # Bonferonni p-value for most extreme obs
options(max.print=1000000)
sink("C:/Users/Fernando/Desktop/influence.txt") # sink diverts R output to a connection.
influence.measures(fit_bic)
sink()

# if we want to estimate the measures individually
# dffits(fit_bic)
# dfbeta(fit_bic)
plot(dffits(fit_bic))
plot(dfbeta(fit_bic))
# which.max(dffits(fit_bic))
# which.max(dfbeta(fit_bic))
cooksd <- cooks.distance(fit_bic)
plot(cooks.distance(fit_bic))
# which.max(cooks.distance(fit_bic))
plot(fit_bic, which=4) # Cook's distance measure
# D de Cook
# identifica valores D > 4/(n-k-1)
cutoff <- 4/((nrow(FFF)-length(fit_bic$coefficients)-1))
plot(fit, which=4, cook.levels=cutoff)

# Example (removing some values)
# We can adapt to other measures.
fit3 <- lm(fit_bic, data=FFF,subset=(cooksd < max(cooksd)))
summary(fit3)

# You can find examples and discussion about the topics in lectures 5-8 of the
# following course http://www.columbia.edu/~so33/SusDev/SusDev.htm
# Another good example (course that uses R) can be seen here:
# http://www.stat.columbia.edu/~martin/W2024/W2024.html
# Summary of some diagnostics seen here: http://ecoinfo.wygisc.org/Lab_4
# http://www.galileu.esalq.usp.br/mostra_topico.php?cod=984
# https://cran.r-project.org/doc/contrib/Ricci-refcard-regression.pdf
# http://www.odelama.com/data-analysis/Notes-about-Linear-Regression/