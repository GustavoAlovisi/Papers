# QUESTION #2

# Clear all
rm(list=ls())

# Set working directory
setwd("C:/Users/fsabino/Desktop/Codes/")

# Load packages
require(dplyr)
require(data.table)
require(lubridate)
require(ggplot2)
require(tidyr)
require(openintro)
require(broom)
require(RCurl)
require(MASS)

# Download the data from data.medicare.gov
download.file("https://data.medicare.gov/views/bg9k-emty/files/37c446e1-fa72-4f27-810d-e3d8af3494a1?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Physician_Compare.zip",
              destfile="Physician_Compare.zip")
# Unzip file
unzip("Physician_Compare.zip")

# Load datasets
filename1 <- "Physician_Compare_2015_Group_Public_Reporting___Performance_Scores.csv"
filename2 <- "Physician_Compare_2015_Group_Public_Reporting_-_Patient_Experience.csv" 
filename3 <- "Physician_Compare_2015_Individual_EP_Public_Reporting___Performance_Scores.csv" 
filename4 <- "Physician_Compare_National_Downloadable_File.csv"    
grp_scor <- fread(filename1) # Group Performance Score
grp_patient <- fread(filename2) # Patient Experience
ind_scor <- fread(filename3) # Individual Performance Score
nat <- fread(filename4) # National Downloadable File

# Data Exploration
db <- nat # db in {nat,grp_scor,grp_patient,ind_scor}
head(db) # View the first rows 
str(db) # View a condensed summary of the data
class(db) # Check the class 
dim(db) # Check the dimensions
glimpse(db) # Check the structure

# DATA CLEANING

# National File
colnames(nat) <- c("NPI","Ind_PAC_ID","Ind_enrl_ID","lst_nm","frst_nm","mid_nm","suff","gndr",
                   "Cred","Med_sch","Grd_yr","Pri_spec","Sec_spec_1","Sec_spec_2","Sec_spec_3",
                   "Sec_spec_4","Sec_spec_all","Org_nm","Org_PAC_ID","num_org_mem","adr_ln_1",
                   "adr_ln_2","ln_2_sprs","cty","st","zip","phn_numbr","hosp_afl_1","hosp_afl_lbn_1",
                   "hosp_afl_2","hosp_afl_lbn_2","hosp_afl_3","hosp_afl_lbn_3","hosp_afl_4","hosp_afl_lbn_4",
                   "hosp_afl_5","hosp_afl_lbn_5","assgn","PQRS","EHR","MHI")

# Clinician Enrollment ID (it should be a number)
nat$Ind_enrl_ID <- gsub('I', '1', nat$Ind_enrl_ID) # replace I by 1
nat$Ind_enrl_ID <- sapply(nat$Ind_enrl_ID, as.numeric)

# Gender 
nat$gndr <- as.factor(nat$gndr)
summary(nat$gndr)

# Marker of address line 2 suppression
nat$ln_2_sprs <- as.factor(nat$ln_2_sprs)
summary(nat$ln_2_sprs)

# Zip Code
nat$zip <- as.integer(nat$zip)
summary(nat$zip)
# Some zip codes are recorded with less than 9 digits
# Note: Zip Code has too many levels for a machine learning algorithm to deal with, 
# so I converted it to a numerical variable. However, I do not want to use them
# as a numerical variable, because it may be a proxy for the performance rates.

# Clinician accepts Medicare Assignment
nat$assgn <- as.factor(nat$assgn)
summary(nat$assgn)

# Individual Score
colnames(ind_scor) <- c("NPI", "Ind_PAC_ID", "lst_nm", "frst_nm", "measure_ID",
                        "measure_title", "invs_msr", "prf_rate", "rpt_mech", 
                        "live_site_IND")

# Inverse Measure
ind_scor$invs_msr <- as.factor(ind_scor$invs_msr)
summary(ind_scor$invs_msr)

# Reported on PC Live Site
ind_scor$live_site_IND <- as.factor(ind_scor$live_site_IND)
summary(ind_scor$live_site_IND)

# Group Performance Score
colnames(grp_scor) <- c("Org_nm", "Org_PAC_ID", "ST", "PQRS", "measure_ID",
                        "measure_title", "invs_msr", "prf_rate", "FN",
                        "rpt_mech", "live_site_IND")

# Patient Experience
colnames(grp_patient) <- c("Org_nm", "Org_PAC_ID", "ST", "measure_ID", 
                           "measure_title", "prf_rate", "FN")

# Data Visualization: Identifying Outliers
# I don't report the result for all variables due to space restrictions

# Density estimates
ggplot(subset(grp_patient,prf_rate>0), aes(x=prf_rate)) + geom_density()

# Histograms
hist(nat$Grd_yr)

# Box-Plots
boxplot(nat$Grd_yr)

# Dealing with missing values (NA)
nrows = nrow(db) # number of rows in db (db in {nat,grp_scor,grp_patient,ind_scor})
ncomplete = sum(complete.cases(db)) # number of rows without missing values
prct_complete_cases = ncomplete/nrows # percentage of complete cases


# Checking whether there are NAs in the categorical variables
# (NAs are treated as an additional category)
summary(ind_scor$invs_msr)

# Treating NAs in numerical variables
summary(nat$Grd_yr) #7788 NAs

# I don't want to throw out the performance rates. A possible solution could be 
# to fill in the missing values with a nominal value as the mean value of the 
# nonmissing data, and additionally to add a new variable that tracks which data
# have been altered.

# Replace all empty strings with NAs
nat[nat == ""] <- NA
grp_scor[grp_scor == ""] <- NA
ind_scor[ind_scor == ""] <- NA
grp_patient[grp_patient == ""] <- NA

# Tabulating the data
table(ind_scor$invs_msr)

# Checking the levels
levels(ind_scor$invs_msr)

# Create a data frame tbl
nat <- tbl_df(nat)
ind_scor <- tbl_df(ind_scor)
grp_scor <- tbl_df(grp_scor)
grp_patient <- tbl_df(grp_patient)

# DATA ANALYSIS

# Initialize the vector with the final answers
answers <- rep(NA, 8) 

# QUESTION 2.1:

# Each clinician has a unique NPI or PAC ID, so we need to verify if there are
# any repeated values.

cln.count <- nat %>% 
  distinct(NPI,Ind_PAC_ID) # retain only unique obs
  
# Save result
answers[1] <- nrow(cln.count)
names(answers)[1] <- 'Total.Clinicians.1st'

# QUESTION 2.2:

cln.gndr <- nat %>%
  group_by(NPI,Ind_PAC_ID,gndr) %>%
  tally() %>%              
  arrange(desc(n))

# Save result
answers[2] <- nrow(cln.gndr[cln.gndr$gndr== "M", ])/nrow(cln.gndr[cln.gndr$gndr== "F", ])
names(answers)[2] <- 'RatioM2F.2nd'

# QUESTION 2.3: 

cln.Cred <- nat %>%
  group_by(NPI,Ind_PAC_ID,gndr,Cred) %>%
  tally() %>%              
  arrange(desc(n))

# Compute the number of males and females by Cred.
twoway <- table(cln.Cred$gndr,cln.Cred$Cred)

# Compute the ratio of Female to Male by Cred.
ratio.crnd <- twoway[1,]/twoway[2,]

# Compute the highest ratio
max(ratio.crnd)
sort(ratio.crnd, decreasing = T)

# Save result
answers[3] <- max(ratio.crnd)
names(answers)[3] <- 'High_RatioF2M.3rd'

# Note: "SCW" has one woman and no man. Division by zero is undefined.

# QUESTION 2.4:

st.fcl <- nat %>%
  group_by(st,Org_PAC_ID) %>%
  tally() %>% # counts the total number of records for each category
  arrange(desc(n))

# Tabulate results by state
st.fcl.count <- table(st.fcl$st)

# Save results
answers[4] <- length(which(st.fcl.count < 10))
names(answers)[4] <- 'State_less10.4th'

# QUESTION 2.5:

cln.avg <- ind_scor %>%
  group_by(NPI,Ind_PAC_ID) %>%
  summarize(mean_avg = mean(prf_rate)) %>%
  filter(mean_avg >= 10) 

# Save result
options(digits=10)
answers[5] <- sd(cln.avg$mean_avg)
names(answers)[5] <- 'sd_atleast10.5th'

# QUESTION 2.6: 

# National
data.not.dpl <- nat %>%
  dplyr::group_by(NPI,Ind_PAC_ID,Cred,Grd_yr) %>%
  dplyr::tally() %>% # number of records for each category
  dplyr::arrange(desc(n))

# Filter the data
data.fltr <- data.not.dpl %>%
  dplyr::filter(Cred == "MD", Grd_yr >= 1973 & Grd_yr <= 2003, n >= 10) 

# Individual Score
data.avg.perf <- ind_scor %>%
  dplyr::select(NPI,Ind_PAC_ID,prf_rate) %>% # NPI and Performance
  dplyr::group_by(NPI) %>%
  dplyr::summarize(rates = n(), avg.perf = mean(prf_rate))

# Merge datasets
data.avg.merged <- dplyr::inner_join(data.fltr, data.avg.perf, by = "NPI")

# Tests
test <- ind_scor %>%
  filter(NPI == 1578595815) # D. Guss has only 1 rate
test2 <- nat %>% 
  filter(NPI == 1578595815) #D. Guss has 132 cells at the national data
# Note: Since everyone with more than 10 rates has an average performance equal to 100,
# the conditional expectation E(Y|X)= a+bX doesn't depend on X and my estimator would
# be Ybar = 100. I'll consider the clinicians who are cited on national data more
# than 10 times and its averages, no matter they have less than 10 rates, to do the question.

perf_year <- data.avg.merged %>%
  group_by(Grd_yr) %>%
  summarize(mean_avg = mean(avg.perf))

# Perform a linear regression, i.e., project the average performance vector onto
# the subspace S(1,X) (subpace spanned by the columns of the intercept and the Grd_yr.

# Visualize the data
plot(perf_year$mean_avg ~ perf_year$Grd_yr, type = 'p', col='blue',
     xlab="Graduation Year", 
     ylab='Performance Rate',
     main="Performance rate vs. Graduation Year")

# Fit the linear model
linear.model <- lm(mean_avg ~ Grd_yr, data = perf_year)
summary(linear.model)
summary(linear.model)[[4]]

# Save results
options(digits = 10)
answers[6] <- summary(linear.model)[[4]][8]
names(answers)[6] <- 'pvalue_lm.6th'

# QUESTION 2.7:

# Note: Avg.perf.MD - Avg.perf.NP (only individuals who have at least 10 rates)

# National
data.flt.crd <- data.not.dpl %>%
  dplyr::filter(Cred == "MD" | Cred == "NP", n >= 10) 

# Individual Score
data.avg.crd <- dplyr::inner_join(data.flt.crd, data.avg.perf, by = "NPI")

# Compute average performance rate by Cred.
perf_crd <- data.avg.crd %>%
  group_by(Cred) %>%
  summarize(mean_avg = mean(avg.perf))

# Compute absolute difference in the avg. performance rates
abs.md.np <- perf_crd$mean_avg[1] - perf_crd$mean_avg[2]

# Save results
options(digits = 10)
answers[7] <- abs.md.np
names(answers)[7] <- 'Abs.diff.7th'

# QUESTION 2.8: 

# MD performance rates
data.md <- data.avg.crd %>%
    dplyr::filter(Cred == "MD")
perf.md <- data.md$avg.perf

# NP performance rates
data.np <- data.avg.crd %>%
  dplyr::filter(Cred == "NP")
perf.np <- data.np$avg.perf

# t-test 
t.md.np <- t.test(perf.md, perf.np, var.equal=TRUE, paired=FALSE)

# Save results
options(digits = 10)
answers[8] <- t.md.np$p.value
names(answers)[8] <- 'p.value.8th'

# Final answers
print(answers)
