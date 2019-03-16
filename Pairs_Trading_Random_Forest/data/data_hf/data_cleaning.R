
# In the period between 2009-11-03 and 2017-02-17, BMF&BOVESPA operated at four different trading hours.
# The script below read the daily files that contain the transactions. For each file:
# 1) We exclude all transactions occurring outside trading hours;
# 2) We construct a time grid with intervals of 1(5) minute(s) and we select only the last price of each ticker within each interval;
# 3) We remove Holy Wednesdays, days with technical failures and days in which there were matches of the Brazil national team in the 2014 FIFA World Cup (24/02/10, 17/01/12, 17/06/14, 23/06/14, 04/07/14 e 08/07/14);
# 4) We adjust prices for corporate events;
# 5) We select the 41 assets that had non-zero returns in more than eighty percent of the time intervals at a sampling frequency of 5 minutes.

#----------------------- 1 minute frequency - trading hours: 11am to 5:55pm -----------------------
first.time <- '11:00:00'
last.time <- '17:55:00'
type.output <- 'agg'
agg.diff <- '1 min'

# Creates a list containing the name of each file that will be read
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/11.18", full.names = TRUE)

# We use the function ghfd_read_file from the package GetHFData. As the layout of the files eventually changes, we make some modifications on the source code of the function to enable the correct reading of the different layouts.
source(".../ghfd_read_file_mod.R")

# Read the files and stores the cleaned data into a data frame
df.out <- data.frame()
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = NULL,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
df.out <- rbind(df.out, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out, file = "cleaned_prices_1.Rds")

#----------------------- 1 minute frequency - trading hours: 10am to 4:55pm -----------------------
first.time <- '10:00:00'
last.time <- '16:55:00'
type.output <- 'agg'
agg.diff <- '1 min'

# Creates a list containing the name of each file that will be read
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/1017", full.names = TRUE)

# Read the files and stores the cleaned data into a data frame
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = NULL,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
df.out <- rbind(df.out, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out, file = "cleaned_prices_12.Rds")


#----------------------- 1 minute frequency - trading hours: 10am to 5:25pm -----------------------
first.time <- '10:00:00'
last.time <- '17:25:00'
type.output <- 'agg'
agg.diff <- '1 min'

# Creates a list containing the name of each file that will be read
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/10.1730", full.names = TRUE)

# Read the files and stores the cleaned data into a data frame
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = NULL,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
df.out <- rbind(df.out, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out, file = "cleaned_prices_123.Rds")


#----------------------- 1 minute frequency - trading hours: 10am to 5:55pm -----------------------
first.time <- '10:00:00'
last.time <- '17:55:00'
type.output <- 'agg'
agg.diff <- '1 min'

# Creates a list containing the name of each file that will be read
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/10.18", full.names = TRUE)

# Read the files and stores the cleaned data into a data frame
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = NULL,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
df.out <- rbind(df.out, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out, file = "cleaned_prices_1234.Rds")

# Obs.: three of the files had a different layout. They were read separately and the cleaned data was added to the data frame.

########################################################################################
# 1 MINUTE INTERVALS
########################################################################################

onemin <- readRDS(".../cleaned_prices_1234.Rds")

# Checking if the whole period was processed
dates <- na.omit(as.data.frame(unique(onemin$SessionDate)))

# Removing Holy Wednesdays, days with technical failures and days in which there were matches of the Brazil national team in the 2014 FIFA World Cup
toremove <- as.Date(c("2010-02-17", "2011-03-09", "2012-02-22", "2013-02-13", "2014-03-05", "2015-02-18", "2016-02-10", "2017-03-01", "2010-02-24", "2012-01-17", "2014-06-17", "2014-06-23", "2014-07-04", "2014-07-08"))
onemin <- onemin[!(onemin$SessionDate %in% toremove),]
saveRDS(onemin, ".../onemin.Rds")

# Counting the number of 1 minute intervals with price data for each ticker in order to reduce the number of assets in the subsequent analysis
count_int_1m <- dplyr::count(onemin, InstrumentSymbol)
write.csv(count_int_1m, ".../count_int_1m.csv")

# Removing columns
prices.1min <- onemin[,c(1, 3, 5)]
# rm(onemin)

# Excluding assets with very few transactions (less than 35% of the intervals)
tokeep <- read.csv(".../tokeep.csv", header = FALSE)
tokeep <- as.character(tokeep[,1])
prices.1min.dimin <- prices.1min[(prices.1min$InstrumentSymbol %in% tokeep),]
saveRDS(prices.1min.dimin, ".../prices.1min.dimin.Rds")
rm(prices.1min)

# Rearranging data: assets in columns and prices on rows in ascending chronological order
reshape.1min <- reshape(prices.1min.dimin, direction = "wide", idvar = "TradeDateTime", timevar = "InstrumentSymbol")
saveRDS(reshape.1min, ".../reshapeNA.Rds")
rm(prices.1min.dimin)

# Checking which time grid intervals are missing. 
# They will be inserted into the data frame and filled with the immediately preceding price.
dates <- na.omit(dates[!(dates[,1] %in% toremove),])
dates <- as.data.frame(dates)
dates.asc <- sort(dates[,1])

period1 <- c(dates.asc[1:84], dates.asc[234:330], dates.asc[481:577])
first.time <- "11:00:00"
last.time <- "17:55:00"
agg.diff <- "1 min"
seq1 <- vector()
for (i in 1:length(period1)){
  firsttime <- as.POSIXct(paste0(period1[i], ' ', first.time, ' BRT'))
  lasttime <- as.POSIXct(paste0(period1[i], ' ', last.time, ' BRT'))
  seq <- seq(from = firsttime, to = lasttime, by = agg.diff)
  seq1 <- append(seq1, seq)
}

period2 <- c(dates.asc[85:233], dates.asc[331:480], dates.asc[578:758], dates.asc[903:1505], dates.asc[1558:1707])
first.time <- "10:00:00"
last.time <- "16:55:00"
agg.diff <- "1 min"
seq2 <- seq1
for (i in 1:length(period2)){
  firsttime <- as.POSIXct(paste0(period2[i], ' ', first.time, ' BRT'))
  lasttime <- as.POSIXct(paste0(period2[i], ' ', last.time, ' BRT'))
  seq <- seq(from = firsttime, to = lasttime, by = agg.diff)
  seq2 <- append(seq2, seq)
}

period3 <- c(dates.asc[759:902])
first.time <- "10:00:00"
last.time <- "17:25:00"
agg.diff <- "1 min"
seq3 <- seq2
for (i in 1:length(period3)){
  firsttime <- as.POSIXct(paste0(period3[i], ' ', first.time, ' BRT'))
  lasttime <- as.POSIXct(paste0(period3[i], ' ', last.time, ' BRT'))
  seq <- seq(from = firsttime, to = lasttime, by = agg.diff)
  seq3 <- append(seq3, seq)
}

period4 <- c(dates.asc[1506:1557], dates.asc[1708:1793])
first.time <- "10:00:00"
last.time <- "17:55:00"
agg.diff <- "1 min"
seq4 <- seq3
for (i in 1:length(period4)){
  firsttime <- as.POSIXct(paste0(period4[i], ' ', first.time, ' BRT'))
  lasttime <- as.POSIXct(paste0(period4[i], ' ', last.time, ' BRT'))
  seq <- seq(from = firsttime, to = lasttime, by = agg.diff)
  seq4 <- append(seq4, seq)
}

price <- reshape.1min
price$TradeDateTime <- as.POSIXct(price$TradeDateTime)

missing.1min.intervals.df <- seq4[!(seq4 %in% price$TradeDateTime)]
missing.1min.intervals.df.1 <- as.data.frame(matrix(NA, ncol = ncol(price), nrow = length(missing.1min.intervals.df)))
missing.1min.intervals.df.1[,1] <- missing.1min.intervals.df
colnames(missing.1min.intervals.df.1) <- colnames(price)

# Checking for transactions at the last minute of trading hours

period1 <- c(dates.asc[1:84], dates.asc[234:330], dates.asc[481:577])
last.time <- "17:55:00"
lastminute1 <- vector()
for (i in 1:length(period1)){
  lastminute <- as.POSIXct(paste0(period1[i], ' ', last.time, ' BRT'))
  lastminute1 <- append(lastminute1, lastminute)
}

period2 <- c(dates.asc[85:233], dates.asc[331:480], dates.asc[578:758], dates.asc[903:1505], dates.asc[1558:1707])
last.time <- "16:55:00"
lastminute2 <- lastminute1
for (i in 1:length(period2)){
  lastminute <- as.POSIXct(paste0(period2[i], ' ', last.time, ' BRT'))
  lastminute2 <- append(lastminute2, lastminute)
}

period3 <- c(dates.asc[759:902])
last.time <- "17:25:00"
lastminute3 <- lastminute2
for (i in 1:length(period3)){
  lastminute <- as.POSIXct(paste0(period3[i], ' ', last.time, ' BRT'))
  lastminute3 <- append(lastminute3, lastminute)
}

period4 <- c(dates.asc[1506:1557], dates.asc[1708:1793])
last.time <- "17:55:00"
lastminute4 <- lastminute3
for (i in 1:length(period4)){
  lastminute <- as.POSIXct(paste0(period4[i], ' ', last.time, ' BRT'))
  lastminute4 <- append(lastminute4, lastminute)
}

lastminute.transaction <- price[(price$TradeDateTime %in% lastminute4),] # there are no transactions at the last minute of trading hours

# Removing the last minute of trading hours from the list of missing intervals
missing.1min.intervals.df.1 <- missing.1min.intervals.df.1[!(missing.1min.intervals.df.1$TradeDateTime %in% lastminute4),] 

# Inserting missing intervals 
prices.1min.126assets <- rbind(price, intervalos.faltantes.df.1)

# Rearranging dates and times
prices.1min.126assets <- arrange(prices.1min.126assets, TradeDateTime)

# Removing a line with inconsistency (NA on date-time)
prices.1min.126assets <- prices.1min.126assets[-756696,]

# Date-time formatting
prices.1min.126assets$SessionDate <- format(prices.1min.126assets$TradeDateTime, format = "%Y-%m-%d")

# Reorganizing columns
prices.1min.126assets <- prices.1min.126assets[,c(1, 129, 2:128)]

# Filling NAs with preceding prices (within days)
require(plyr)
prices.1min.126assets.nalocf <- ddply(prices.1min.126assets, .(SessionDate), na.locf)

# Prices must be numeric
for(i in 3:ncol(prices.1min.126assets.nalocf)){
  prices.1min.126assets.nalocf[,i] <- as.numeric(prices.1min.126assets.nalocf[,i])
}

# Calculation of returns
return.calc <- function(x) {diff(log(x))}
returns.1min.126assets <- apply(prices.1min.126assets.nalocf[, 3:ncol(prices.1min.126assets.nalocf)], 2, return.calc)
returns.1min.126assets.df <- as.data.frame(returns.1min.126assets)
returns.1min.126assets.df <- cbind(prices.1min.126assets.nalocf[-1,2], returns.1min.126assets.df)

# Counting the number of returns that are not equal to zero or NA (out of 764.401)
returns.not.na.zero <- matrix(NA, nrow = dim(returns.1min.126assets)[2], ncol = 1)
rownames(returns.not.na.zero) <- t(colnames(returns.1min.126assets))
for (i in 1:ncol(returns.1min.126assets)){
  returns.not.na.zero[i,] <- sum(!(returns.1min.126assets.df[,i+1] == 0 | is.na(returns.1min.126assets.df[,i+1])))
}
write.csv(returns.not.na.zero, ".../returns.not.na.zero.csv")

########################################################################################
# Reducing sample frequency

require(dplyr)
uniq.dates <- distinct(onemin, SessionDate)

first.time <- "10:00:00"
last.time <- "17:55:00"
agg.diff <- "5 mins"
firsttime <- as.POSIXct(paste0(uniq.dates[1,], ' ', first.time, ' BRT'))
lasttime <- as.POSIXct(paste0(uniq.dates[1,], ' ', last.time, ' BRT'))
seq <- seq(from = firsttime, to = lasttime, by = agg.diff)

mygrid <- data.frame()
for (i in 1:1800){
a <- expand.grid(format(seq, '%H:%M:%S'), as.character(uniq.dates[i,]))
mygrid <- rbind(mygrid, a)
}

mybreaks <- as.POSIXct(paste(mygrid[[2]], mygrid[[1]]), format = "%Y-%m-%d %H:%M:%S", tz = "America/Sao_Paulo")

onemin$TradeDateTime <- cut(onemin$TradeDateTime, breaks = mybreaks)

grouped.onemin <- dplyr::group_by(onemin, InstrumentSymbol, SessionDate, TradeDateTime)

fivemin <- dplyr::summarise(grouped.onemin, last.price = last.price[length(last.price)])

########################################################################################
# 5 minute intervals
########################################################################################

fivemin <- fivemin[!(fivemin$SessionDate %in% toremove),]

# Calculation of returns
returns.fivemin <- apply(fivemin[,3:ncol(fivemin)], 2, return.calc)
returns.fivemin.df <- as.data.frame(returns.fivemin)

# Counting the number of returns that are not equal to zero or NA
returns.not.na.zero5 <- matrix(NA, nrow = ncol(returns.fivemin), ncol = 1)
rownames(returns.not.na.zero5) <- t(colnames(returns.fivemin))
for (i in 1:ncol(returns.fivemin)){
  returns.not.na.zero5[i,] <- sum(!(returns.fivemin.df[,i] == 0 | is.na(returns.fivemin.df[,i])))
}
write.csv(returns.not.na.zero5, ".../returns.not.na.zero5.csv")

# We select assets with at least 80% of returns other than zero / NA
my.assets <- read.csv(".../myassets.csv", header = FALSE)
my.assets.last <- paste0("last.price.", my.assets[,1])
my.assets.last.time <- append(my.assets.last, c("TradeDateTime", "SessionDate"))

prices.1min.myassets  <- prices.1min.126assets.nalocf[,colnames(prices.1min.126assets.nalocf) %in% my.assets.last.time]
prices.5min.myassets  <- fivemin[,colnames(fivemin) %in% my.assets.last.time]

# In short:
## 41 assets
## 2009-11-03 to 2017-02-17 - 1793 days excluding weekends, holidays, Holy Wednesday, technical failure days and days of Brazilian national team matches in the FIFA World Cup.
## Ex: For the frequency of 5 minutes, the price of 10:00 AM is the last price in the range 10:00:00 - 10:04:99.
## When there is no transaction in the range, the previous price is repeated, as long as it is within the same day.

########################################################################################
# Closing (daily) prices
########################################################################################
source(".../ghfd_read_file_mod.R")

first.time <- '18:00:00'
last.time <- '18:30:00'
type.output <- 'agg'
agg.diff <- '30 mins'
my.assets <- as.character(my.assets[,1])

# List of files for reading
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/11.18", full.names = TRUE)

# Reads the files and stores the data for the desired assets and times in a data frame
df.out1 <- data.frame()
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = my.assets,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
  
  df.out1 <- rbind(df.out1, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out, file = "closing1.Rds")


first.time <- '17:00:00'
last.time <- '17:30:00'

# List of files for reading
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/10.17", full.names = TRUE)

# Reads the files and stores the data for the desired assets and times in a data frame
df.out2 <- data.frame()
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = my.assets,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
  
  df.out2 <- rbind(df.out2, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out2, file = "closing2.Rds")

first.time <- '17:30:00'
last.time <- '18:00:00'

# List of files for reading
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/10.1730", full.names = TRUE)

# Reads the files and stores the data for the desired assets and times in a data frame
df.out3 <- data.frame()
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = my.assets,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
  
  df.out3 <- rbind(df.out3, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out3, file = "closing3.Rds")


first.time <- '18:00:00'
last.time <- '18:30:00'

# List of files for reading
file.names <- list.files("/Volumes/LACIE SHARE/bovespa_diarios/10.18", full.names = TRUE)

# Reads the files and stores the data for the desired assets and times in a data frame
df.out4 <- data.frame()
for (i in seq_along(file.names)){
  my.df <- ghfd_read_file_mod(file.names[i],
                              my.assets = my.assets,
                              first.time = first.time,
                              last.time = last.time,
                              type.output = type.output,
                              agg.diff = agg.diff
  )
  
  df.out4 <- rbind(df.out4, as.data.frame(my.df))
  
  # clean up some memory
  rm('my.df')
}
saveRDS(df.out4, file = "closing4.Rds")

df.out.total <- bind_rows(df.out, df.out2, df.out3, df.out4)

# Selecting only the last interval of each day (should not change anything ...)
df.out.fech <- df.out.total %>%
  group_by(InstrumentSymbol, SessionDate) %>%
  arrange(TradeDateTime) %>%
  filter(row_number()==n())

# Eliminating columns
df.out.fech <- df.out.fech[,c(1, 2, 5)]
df.out.fech <- as.data.frame(df.out.fech)

# Rearranging
closing.prices <- reshape(df.out.fech, direction = "wide", idvar = "SessionDate", timevar = "InstrumentSymbol")
closing.prices <- closing.prices[, c(1:6, 41, 7:11, 42, 12:20, 40, 21:39)]
closing.prices[2,18] <- 30.88 #  from yahoo! finance
closing.prices[2,26] <- 23.10 #  from yahoo! finance

# Columns names
colnames <- c("Data", sort(as.vector(my.assets[[1]])))
colnames(closing.prices) <- colnames
write.csv(closing.prices, ".../closing.prices.csv")

########################################################################################
# Adjusted prices for corporate events (adjustment factors in MS Excel)
########################################################################################

# Daily factors

accumulated.daily.factors <- read.csv(".../accumulated_daily_factors.csv", sep = ";")

# Intradaily factors

write.csv(prices.1min.myassets$SessionDate, ".../dates1min.csv")
accumulated.factors.1min.1 <- read.csv(".../accumulated_factors_1min1.csv", sep = ";")
accumulated.factors.1min.2 <- read.csv(".../accumulated_factors_1min2.csv", sep = ";")
accumulated.factors.1min.3 <- read.csv(".../accumulated_factors_1min3.csv", sep = ";")
accumulated.factors.1min.4 <- read.csv(".../accumulated_factors_1min4.csv", sep = ";")
accumulated.factors.1min.5 <- read.csv(".../accumulated_factors_1min5.csv", sep = ";")
accumulated.factors.1min.6 <- read.csv(".../accumulated_factors_1min6.csv", sep = ";")
accumulated.factors.1min.7 <- read.csv(".../accumulated_factors_1min7.csv", sep = ";")
accumulated.factors.1min.8 <- read.csv(".../accumulated_factors_1min8.csv", sep = ";")
accumulated.factors.1min.9 <- read.csv(".../accumulated_factors_1min9.csv", sep = ";")
accumulated.factors.1min.10 <- read.csv(".../accumulated_factors_1min10.csv", sep = ";")
accumulated.factors.1min.11 <- read.csv(".../accumulated_factors_1min11.csv", sep = ";")
accumulated.factors.1min.12 <- read.csv(".../accumulated_factors_1min12.csv", sep = ";")
accumulated.factors.1min.13 <- read.csv(".../accumulated_factors_1min13.csv", sep = ";")
accumulated.factors.1min.14 <- read.csv(".../accumulated_factors_1min14.csv", sep = ";")
accumulated.factors.1min.15 <- read.csv(".../accumulated_factors_1min15.csv", sep = ";")
accumulated.factors.1min.16 <- read.csv(".../accumulated_factors_1min16.csv", sep = ";")
accumulated.factors.1min.17 <- read.csv(".../accumulated_factors_1min17.csv", sep = ";")
accumulated.factors.1min.18 <- read.csv(".../accumulated_factors_1min18.csv", sep = ";")
accumulated.factors.1min.19 <- read.csv(".../accumulated_factors_1min19.csv", sep = ";")
accumulated.factors.1min.20 <- read.csv(".../accumulated_factors_1min20.csv", sep = ";")

require(dplyr)
accumulated.factors.1min <- bind_cols(accumulated.factors.1min.1, accumulated.factors.1min.2[,-1], accumulated.factors.1min.3[,-1], accumulated.factors.1min.4[,-1],
                                     accumulated.factors.1min.5[,-1], accumulated.factors.1min.6[,-1], accumulated.factors.1min.7[,-1], accumulated.factors.1min.8[,-1], 
                                     accumulated.factors.1min.9[,-1], accumulated.factors.1min.10[,-1], accumulated.factors.1min.11[,-1], accumulated.factors.1min.12[,-1],
                                     accumulated.factors.1min.13[,-1], accumulated.factors.1min.14[,-1], accumulated.factors.1min.15[,-1], accumulated.factors.1min.16[,-1],
                                     accumulated.factors.1min.17[,-1], accumulated.factors.1min.18[,-1], accumulated.factors.1min.19[,-1], accumulated.factors.1min.20[,-1])

write.csv(fivemin$SessionDate, ".../dates5min.csv")
accumulated.factors.5min.1 <- read.csv(".../accumulated_factors_5min1.csv", sep = ";")
accumulated.factors.5min.2 <- read.csv(".../accumulated_factors_5min2.csv", sep = ";")
accumulated.factors.5min.3 <- read.csv(".../accumulated_factors_5min3.csv", sep = ";")
accumulated.factors.5min.4 <- read.csv(".../accumulated_factors_5min4.csv", sep = ";")

require(dplyr)
accumulated.factors.5min <- bind_cols(accumulated.factors.5min.1, accumulated.factors.5min.2, accumulated.factors.5min.3, accumulated.factors.5min.4)


# Price adjustement

adjusted.daily.prices <- closing.prices[,2:ncol(closing.prices)]*accumulated.daily.factors[,2:ncol(accumulated.daily.factors)]
colnames(adjusted.daily.prices) <- colnames(closing.prices[2:42])
adjusted.daily.prices.xts <- xts(adjusted.daily.prices, order.by = closing.prices$Data)

adjusted.1min.prices <- prices.1min.myassets[,3:43]*accumulated.factors.1min[,2:42]
rownames(adjusted.1min.prices) <- prices.1min.myassets$TradeDateTime
adjusted.1min.prices <- cbind(adjusted.1min.prices, prices.1min.myassets[,1:2])

adjusted.5min.prices <- prices.5min.myassets[,3:43]*accumulated.factors.5min[,2:42]
rownames(adjusted.5min.prices) <- prices.5min.myassets$TradeDateTime
adjusted.5min.prices <- cbind(adjusted.5min.prices, prices.5min.myassets[,1:2])

########################################################################################
# Returns
########################################################################################

# Daily returns
returns.daily <- apply(adjusted.daily.prices.xts, 2, retorno)

# Selecting the period from 2010-01-04 to 2016-12-29
require(xts)
returns.daily.41assets <- returns.daily#[subset here,]
returns.daily.41assets <- xts(returns.daily.41assets, order.by = as.Date(rownames(returns.daily.41assets)))

# Intradaily returns (open to close)
factors.1m          <- as.factor(adjusted.1min.prices$SessionDate)
prices.1min.split   <- split(adjusted.1min.prices[,1:41], factors.1m) 
returns.1min.oc     <- ldply(prices.1min.split, CalculateReturns, method = "log") 
returns.1min.oc     <- xts(returns.1min.oc[,2:42], order.by = as.POSIXct(adjusted.1min.prices$TradeDateTime, format = "%Y-%m-%d %H:%M:%S"))

factors.5m          <- as.factor(adjusted.5min.prices$SessionDate)
prices.5min.split   <- split(adjusted.5min.prices[,1:41], factors.5m)
returns.5min.oc     <- ldply(prices.5min.split, CalculateReturns, method = "log") 
returns.5min.oc     <- xts(returns.5min.oc[,2:42], order.by = as.POSIXct(adjusted.5min.prices$TradeDateTime, format = "%Y-%m-%d %H:%M:%S"))

factors.10m         <- as.factor(prices.10min.ajustados$SessionDate)
prices.10min.split  <- split(prices.10min.ajustados[,1:41], factors.10m)
returns.10min.oc    <- ldply(prices.10min.split, CalculateReturns, method = "log") 
returns.10min.oc    <- xts(returns.10min.oc[,2:42], order.by = as.POSIXct(prices.10min.ajustados$TradeDateTime, format = "%Y-%m-%d %H:%M:%S"))

# Selecting the period from 2010-01-04 to 2016-12-29

returns.1min.oc <- returns.1min.oc#[subset here,]
returns.5min.oc <- returns.5min.oc#[subset here,]

# Analyzing returns within each day: delete the start and end minutes? No...
test <- as.data.frame(returns.5min.oc)
test$SessionDate <- as.Date(as.POSIXct(index(returns.5min.oc)))
factors.returns.5m <- as.factor(test$SessionDate)
returns.5min.split <- split(returns.5min.oc, factors.returns.5m) 
chart.TimeSeries(returns.5min.split$`2010-12-02`) 

########################################################################################
# Realized measures
########################################################################################

#------------------------------------------
# Realized Variance

RV.5min <- data.frame()
for (i in 1:41){
  asset <- rv.naive(na.omit(returns.5min.oc[,i]), period = 1, align.by = "minutes", align.period = 5)
  RV.5min <- cbind(RV.5min, asset)
}
data <- as.Date(as.POSIXct(index(RV.5min)))
index(RV.5min) <- data
saveRDS(RV.5min, ".../RV.5min.Rds")

#------------------------------------------
# Realized Variance with subsampling;
# Zhang et al. (2005);
# Called "average RV" estimator in Andersen et al. (2011) and Ghysels and Sinko (2011).

install.packages("realized", repos="http://R-Forge.R-project.org")
require(realized)

RV.5min.sub <- xts()
for (i in 1:41){
  asset <- rv.avg(na.omit(returns.1min.oc[,i]), period = 5, align.by = "minutes", align.period = 1)
  RV.5min.sub <- cbind(RV.5min.sub, asset)
}
data <- as.Date(as.POSIXct(index(RV.5min.sub)))
index(RV.5min.sub) <- data
saveRDS(RV.5min.sub, ".../RV.5min.sub.ext.Rds")

#------------------------------------------
#Which dates have daily returns, but have no realized measures?...
date1 <- as.data.frame(index(returns.daily.41assets))
delete <- date1[!(date1$`index(returns.daily.41assets)` %in% dates),]

# Removing these dates from the daily returns
returns.daily.41assets <- returns.daily.41assets[!(index(returns.daily.41assets) %in% delete),]

########################################################################################
# Summary statistics
########################################################################################

boxPlot(returns.daily.41assets[,1:10], col = qualiPalette(n = 10, name = "Pastel1"))
boxPlot(returns.daily.41assets[,11:20])
boxPlot(returns.daily.41assets[,21:30])
boxPlot(returns.daily.41assets[,31:41])

#----------------------------------
# 5-min returns and daily returns
summ.stat.ret.5min <- t(table.Arbitrary(na.omit(returns.5min.oc[2739:151338,]), metrics = c("mean", "max", "min", "sd", "skewness", "kurtosis"), metricsNames = c("Mean", "Max", "Min", "SD", "Skewness", "Kurtosis")))
summ.stat.ret.10min <- t(table.Arbitrary(na.omit(returns.10min.oc[1386:76565,]), metrics = c("mean", "max", "min", "sd", "skewness", "kurtosis"), metricsNames = c("Mean", "Max", "Min", "SD", "Skewness", "Kurtosis")))
summ.stat.ret.dia  <- t(table.Arbitrary(returns.daily.41assets, metrics = c("mean", "max", "min", "sd", "skewness", "kurtosis"), metricsNames = c("Mean", "Max", "Min", "SD", "Skewness", "Kurtosis")))
summ.stat.ret <- cbind(summ.stat.ret.5min, summ.stat.ret.10min)
summ.stat.ret <- cbind(summ.stat.ret.dia)

require(xtable)
xtable(summ.stat.ret, digits = c(4,2,4,4,4,4,4,2,4,4,4,4,4), display = c("s","E","f","f","f","f","f","E","f","f","f","f","f"))
xtable(summ.stat.ret, digits = c(4,2,4,4,4,4,4), display = c("s","E","f","f","f","f","f"))

