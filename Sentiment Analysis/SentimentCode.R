#############################################
######### PACKAGES #######
#############################################

install.packages("rprojroot")
devtools::install_github("hadley/haven")
install.packages("tm")
install.packages("tm.plugin.webmining")
install.packages("tm.plugin.sentiment")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("XML")
install.packages("rJava")
install.packages("RCurl")
install.packages("rvest")
install.packages("schoolmath")
install.packages("openNLP")
# install the openNLPmodels.pt package available at this link(http://datacube.wu.ac.at/src/contrib/) to # add Portuguese to openNLP
# install.packages("openNLPmodels.pt", repos = "http://datacube.wu.ac.at/", type = "source")
install.packages("dplyr")
install.packages("Quandl")
install.packages("xtable")


require(rprojroot) # Used to find the directory where the R project is located
require(haven) # Used to load data from Stata 13 into R
require(tm) # used for text mining
require(tm.plugin.webmining)
require(tm.plugin.sentiment)
require(SnowballC) #
require(wordcloud) # used to build the wordcloud
require(RColorBrewer) # used for color palettes in the wordcloud
require(XML)
require(tm.plugin.webmining)
require(rJava)
require(RCurl)
require(rvest)
require(stringr)
require(openNLP)
require(openNLPmodels.pt)
require(dplyr)
require(Quandl)
require(xtable)

##############################################
######### OPTIONS #######
##############################################

root = rprojroot::is_rstudio_project
mydir = root$find_file() # Finds the directory where the current project is saved

##############################################
######### FUNCTIONS #######
##############################################

#####
## FUNCTION TO TRANSFORM HTML INTO TEXT
#####

source(paste0(mydir, ' /Codes/papers/Sentiment_Analysis/htmlToText.R'))

#####
## FUNCTION TO EXTRACT THE href ATTRIBUTE OF EACH KNOT OF AN HTML FILE
#####

hrefFun = function(x) {
  href = xmlGetAttr(node = x, name = "href")
}

#####
## FUNCTION TO REPLACE A CERTAIN WORD FOR A SPACE.
#####

toSpace <- content_transformer(function(x, pattern) gsub(pattern, "", x))

#####
## FUNCTION TO READ PDF FILES FROM A DIRECTORY AND TRANSFORM INTO TEXTUAL FORMAT
#####

readerPDF <- function(fname) {
  txt <- readPDF(control = list(text = "-layout -enc UTF-8"))(elem = list(uri = fname), id = fname, language = 'en')
  return(txt)
}


## FUNCTION TO CONVERT TEXT INTO SENTENCES
#####

convert_text_to_sentences <- function(text, lang = "en") {
  # Function to compute sentence annotations using the Apache OpenNLP Maxent sentence detector using the "Portuguese" language
  sentence_token_annotator <- Maxent_Sent_Token_Annotator(language = lang)
  
  # Convert text into string using NLP package
  text <- as.String(text)
  
  # Limits of sentences in the text
  sentence.boundaries <- annotate(text, sentence_token_annotator)
  
  # Extract the sentences
  sentences <- text[sentence.boundaries]
  
  # Return the sentences
  return
}

#####
## FUNCTION TO MERGE CORPUS
#####

reshape_corpus <- function(current.corpus, FUN, ...) {
  # Extract the text of each document in the corpus and put it on a list
  text <- lapply(current.corpus, content)  
  
  # Basically, it converts the text
  docs <- lapply(text, FUN, ...)
  docs <- as.vector(unlist(docs))
  
  # Create a new corpus and return it
  new.corpus <- Corpus(VectorSource(docs))
  return(new.corpus)
}


################################################## ################################################## ########
###### DATE - MINUTES OF THE COPOM (Monetary Policy Committee of the Central Bank of Brazil) #######
################################################## ################################################## ########

# In this case, the minutes are in pdf format and the steps below show how to download the
# pdfs and then transform them into textual format to create corpus that will be used in the sentiment
# analysis.

#####
## DISCOVER URL'S OF ALL MINUTES AVAILABLE AT THE CENTRAL BANK WEBSITE
#####

main.page = read_html(x = "http://www.bcb.gov.br/?MINUTES")

# Get the text of the links(in this case the urls)
urls = main.page%>% # feed the `main.page` to the next step
  html_nodes("# chronoAno a")%>% # get the CSS nodes. Here I use http://selectorgadget.com/to get the rule "#cronoAno a"
  html_attr("href") # extract the text of the link

# Get the text of the link(in this case the year)
links = main.page%>%
  html_nodes("# chronoAno a")%>% # get the CSS nodes
  html_text() # extract the text of the link(the year)

for(i in 1:length(urls)) {
  urls[i] = paste("http://www.bcb.gov.br", urls[i], sep = '')
}

# Merge "link" and "urls" into a data.frame
yearly_page = data.frame(links = links, urls = urls, stringsAsFactors = FALSE)
head(yearly_page)

# Extraction of url's from each minute of each year
main.page.yearly = list()
urls.yearly = list()
links.yearly = list()

for (i in 1:length(urls)) {# change "urls" to "yearly_page$urls" if apply temporal filter
  main.page.yearly = read_html(x = urls[i])
  # Get the text of the link (in this case the urls) for each year
  urls.yearly[[i]] = main.page.yearly%>%
    html_nodes("# cronoGrupoMes a ")%>% # get the CSS nodes
    html_attr("href") # extract the text of the link
  
  # Get the text of the link(in this case the year) for each year
  links.yearly[[i]] = main.page.yearly%>%
    html_nodes("#cronoGrupoMes a") %>% # get the CSS nodes
    html_text() # extract the the text of the link(the year)
}

for(i in 1:length(urls.yearly)) {
  for(j in 1:length(urls.yearly[[i]])) {
    urls.yearly[[i]][j] = paste("http://www.bcb.gov.br", urls.yearly[[i]][j], sep = '')
  }
}

# Merge "link" and "urls" into a data.frame
atas = data.frame(reuniao = unlist(links.yearly), urls = unlist(urls.yearly), stringsAsFactors = FALSE)
# atas(minutes of Copom in Portuguese)
atas = atas[-c(170,171),] # remove minutes that are from 1999 or double publication of the first minute in 2000

atas[2,"reuniao"] = "210th" # Change minute with wrong name

# rename the column "reuniao"(meeting in Portuguese) with the numbers of the minutes to make it easier to save the files
for (i in 1:108) {
  atas$reuniao[i] = sub("Copom Minutes", "", atas$reuniao[i])
  atas$reuniao[i] = sub('.*(?=.{6}$)', '', atas$reuniao[i], perl = T)
  atas$reuniao[i] = gsub(" ", "", atas$reuniao[i], fixed = TRUE)
}

for (i in 109:112) {
  atas$reuniao[i] = sub("Copom minutes", "", atas$reuniao[i])
  atas$reuniao[i] = sub('.*(?=.{6}$)', '', atas$reuniao[i], perl = T)
  atas$reuniao[i] = gsub(" ", "", atas$reuniao[i], fixed = TRUE)
}

for (i in 113:169) {
  atas$reuniao[i] = sub("Copom minutes", "", atas$reuniao[i])
  atas$reuniao[i] = sub('.*(?=.{5}$)', '', atas$reuniao[i], perl = T)
  atas$reuniao[i] = gsub(" ", "", atas$reuniao[i], fixed = TRUE)
}

#####
## COLLECT THE DATE OF EACH COPOM MINUTE
#####

dates = c("06-12-2017", "25-10-2017", "06-09-2017", 
          "26-07-2017", "31-05-2017", "12-04-2017", "22-02-2017", "11-01-2017", "30-11-2016", "19-10-2016", "31-08-2016",
          "20-07-2016", "08-06-2016", "27-04-2016", "02-03-2016", "20-01-2016", "25-11-2015", "21-10-2015", "02-09-2015", 
          "29-07-2015", "03-06-2015", "29-04-2015", "04-03-2015", "21-01-2015", "03-12-2014", "29-10-2014", "03-09-2014",
          "16-07-2014", "28-05-2014", "02-04-2014", "26-02-2014", "15-01-2014", "27-11-2013", "09-10-2013", "28-08-2013",
          "10-07-2013", "29-05-2013", "17-04-2013", "06-03-2013", "16-01-2013", "28-11-2012", "10-10-2012", "29-08-2012", 
          "11-07-2012", "30-05-2012", "18-04-2012", "07-03-2012", "18-01-2012", "30-11-2011", "19-10-2011", "31-08-2011",
          "20-07-2011", "08-06-2011", "20-04-2011", "02-03-2011", "19-01-2011", "08-12-2010", "20-10-2010", "01-09-2010",
          "21-07-2010", "09-06-2010", "28-04-2010", "17-03-2010", "27-01-2010", "09-12-2009", "21-10-2009", "02-09-2009",
          "22-07-2009", "10-06-2009", "29-04-2009", "11-03-2009", "21-01-2009", "10-12-2008", "29-10-2008", "10-09-2008",
          "23-07-2008", "04-06-2008", "16-04-2008", "05-03-2008", "23-01-2008", "05-12-2007", "17-10-2007", "05-09-2007",
          "18-07-2007", "06-06-2007", "18-04-2007", "07-03-2007", "24-01-2007", "29-11-2006", "18-10-2006", "30-08-2006", 
          "19-07-2006", "31-05-2006", "19-04-2006", "08-03-2006", "18-01-2006", "14-12-2005", "23-11-2005", "19-10-2005", 
          "14-09-2005", "17-08-2005", "20-07-2005", "15-06-2005", "18-05-2005", "20-04-2005", "16-03-2005", "16-03-2005", 
          "19-01-2005", "15-12-2004", "17-11-2004", "20-10-2004", "15-09-2004", "18-08-2004", "21-07-2004", "16-06-2004", 
          "19-05-2004", "14-04-2004", "17-03-2004", "18-02-2004", "21-01-2004", "17-12-2003", "19-11-2003", "22-10-2003", 
          "17-09-2003", "20-08-2003", "23-07-2003", "18-06-2003", "21-05-2003", "23-04-2003", "19-03-2003", "19-02-2003", 
          "22-01-2003", "18-12-2002", "20-11-2002", "14-10-2002", "23-10-2002", "18-09-2002", "21-08-2002", "17-07-2002", 
          "19-06-2002", "22-05-2002", "17-04-2002", "20-03-2002", "20-02-2002", "23-01-2002", "19-12-2001", "21-11-2001", 
          "17-10-2001", "19-09-2001", "22-08-2001", "18-07-2001", "20-06-2001", "23-05-2001", "18-04-2001", "21-03-2001", 
          "14-02-2001", "17-01-2001", "20-12-2000", "22-11-2000", "18-10-2000", "20-09-2000", "23-08-2000", "19-07-2000", 
          "20-06-2000", "24-05-2000", "19-04-2000", "22-03-2000", "16-02-2000", "19-01-2000")


date = as.Date(dates, format = "%d-%m-%Y")
atas = data.frame(atas, data = date, stringsAsFactors = FALSE)

# Aggregate the location where each minute is saved

for (i in 1:nrow(atas)) {
  atas$path[i] = paste0(mydir, "/Codes/papers/Sentiment_Analysis/data/text/pdf/", atas$reuniao[i], ".pdf", sep = '')
}

#####
## SAVE THE PDF'S FROM EACH MINUTE IN A PROJECT DIRECTORY AND CREATE THE CORPUS OF THE MINUTES
#####

# This only needs to be done once because it is the download of the minutes. If you want to run, uncomment the lines below the "for".
for (i in 1:length(atas$urls)) {
  pdf.url = atas$urls[i]
  pdf.name = paste0(mydir, "/Codes/papers/Sentiment_Analysis/data/text/pdf/", atas$reuniao[i], ".pdf", sep = '')
  download.file(pdf.url, pdf.name, method = 'wininet', quiet = FALSE, mode = "wb", cacheOK = TRUE, extra = getOption("download.file.extra"))
}


# Take the place where each of the minutes (in pdf) is saved
files = atas$path[1:length(atas$urls)]

# Applying the "readerPDF" function to read the PDF and transform into a text file
notes <- lapply(files, readerPDF)

# Renaming each document.
names(notes) <- atas$reuniao[1:length(atas$urls)]

# Creating the corpus
docs <- Corpus(VectorSource(notes))

#####
## CLEANING THE DATA OF "PROBABLE IMPURITIES"
#####

# ensuring that the document is a plain text.
docs = tm_map(docs, content_transformer(tolower))

# Converting all letters to lowercase letters
docs = tm_map(docs, content_transformer(tolower))

# removing repeated words that do not help in the analysis
docs = tm_map(docs, removeWords, stopwords("english"))

# stopwords("english")
# "i"          "me"         "my"         "myself"     "we"         "our"        "ours"       "ourselves" 
# "you"        "your"       "yours"      "yourself"   "yourselves" "he"         "him"        "his"       
# "himself"    "she"        "her"        "hers"       "herself"    "it"         "its"        "itself"    
# "they"       "them"       "their"      "theirs"     "themselves" "what"       "which"      "who"       
# "whom"       "this"       "that"       "these"      "those"      "am"         "is"         "are"       
# "was"        "were"       "be"         "been"       "being"      "have"       "has"        "had"       
# "having"     "do"         "does"       "did"        "doing"      "would"      "should"     "could"     
# "ought"      "i'm"        "you're"     "he's"       "she's"      "it's"       "we're"      "they're"   
# "i've"       "you've"     "we've"      "they've"    "i'd"        "you'd"      "he'd"       "she'd"     
# "we'd"       "they'd"     "i'll"       "you'll"     "he'll"      "she'll"     "we'll"      "they'll"   
# "isn't"      "aren't"     "wasn't"     "weren't"    "hasn't"     "haven't"    "hadn't"     "doesn't"   
# "don't"      "didn't"     "won't"      "wouldn't"   "shan't"     "shouldn't"  "can't"      "cannot"    
# "couldn't"   "mustn't"    "let's"      "that's"     "who's"      "what's"     "here's"     "there's"   
# "when's"     "where's"    "why's"      "how's"      "a"          "an"         "the"        "and"       
# "but"        "if"         "or"         "because"    "as"         "until"      "while"      "of"        
# "at"         "by"         "for"        "with"       "about"      "against"    "between"    "into"      
# "through"    "during"     "before"     "after"      "above"      "below"      "to"         "from"      
# "up"         "down"       "in"         "out"        "on"         "off"        "over"       "under"     
# "again"      "further"    "then"       "once"       "here"       "there"      "when"       "where"     
# "why"        "how"        "all"        "any"        "both"       "each"       "few"        "more"      
# "most"       "other"      "some"       "such"       "no"         "nor"        "not"        "only"      
# "own"        "same"       "so"         "than"       "too"        "very"      

# removing "/", "@" e "|"
docs = tm_map(docs, toSpace, "/|@|\\|")

# removing "the"
docs = tm_map(docs, toSpace, "the|\003|â???|\023")

# Remove numbers from text. I still do not know if it's worth, it may or may not be useful
docs = tm_map(docs, removeNumbers)

# Remove the punctuation. Provides grammatical context that supports understanding. We ignore
# for initial analysis, but then we use it to extract meanings
docs = tm_map(docs, removePunctuation)

# remove whitespace
docs = tm_map(docs, stripWhitespace)

# remove common words at the end of sentences

# docs = tm_map(docs, stemDocument, language = "english")
#####
## DATA MATRIX THAT WILL BE USED IN ANALYSIS
#####

dtm = DocumentTermMatrix(docs)
dimnames(dtm)$Docs = names(notes) # rename the documents(columns) with the name of the minutes
dtm

# << DocumentTermMatrix(documents:, terms:) >>
# Non-/sparse entries:
# Sparsity: 95%
# Maximal term length:  
# Weighting: term frequency(tf)

# You can remove sparse terms with the "removeSparseTerms()" function. We need to specify a number between
# zero and one where the higher the number, the greater the percentage of "Sparsity" in the matrix. Thus, with 157 documents,
# specifying 0.95 as the sparsity number, the resulting array should have words that occurred at least
# in 150 documents, as follows:

dtm2 = removeSparseTerms(dtm, 0.90)

# find words that occur at least 100 times
table = findFreqTerms(dtm2, 400)

# Extract the latex format to insert into the article
table = matrix(table[1:150], nrow = 30, ncol = 5, byrow = TRUE)
xtable(table)

# find the association of a word with dtm("demais")
findAssocs(dtm, "behavior", corlimit = 0.5)

freq = colSums(as.matrix(dtm2))
ord = order(-freq)

wordcloud(names(freq), freq, min.freq = 100, scale = c(3, .5), colors = brewer.pal(6, "Dark2"), max.words = 30)

#####
## ACQUIRE AND PROCESS LEXICON
#####

# Upload Sentiment lexicon. Saved in project directory as csv file.
eng.lex = read.csv(paste0(mydir,'/Codes/papers/Sentiment_Analysis/data/text/lexico/inquirerbasic.csv'), sep = ";", encoding = "UTF-8", stringsAsFactors = FALSE)

# Remove tags # 1
eng.lex$Entry = gsub("# 1", "", eng.lex$Entry)

# Remove rows that are still with #
eng.lex = eng.lex[! grepl("#", eng.lex$Entry),]

# Extract the positive and negative words from lexicon. Here, we also guarantee that all the letters are in lowercase
neg.lex = tolower(eng.lex$Entry[eng.lex$Negativ != ""])
pos.lex = tolower(eng.lex$Entry[eng.lex$Positiv != ""])

# Extract the terms from the Terms x Documents array. So, I have all the terms used in the writing of the minutes
terms = colnames(dtm)

# Finding positive and negative terms using Lexicon
neg.terms = terms[terms %in% neg.lex]
pos.terms = terms[terms %in% pos.lex]

# Calculate the positive and negative scores of the minutes
neg.scores = rowSums(as.matrix(dtm[, neg.terms])) # sum the number of negative terms in the rows(each array document)
pos.scores = rowSums(as.matrix(dtm[, pos.terms]))

# Calculate minute scores (document scores)
document.scores = pos.scores - neg.scores
scores = data.frame(document.scores, data = atas$data[1:nrow(atas)], reuniao = atas$reuniao[1:nrow(atas)], stringsAsFactors = FALSE)

##########################
###### AUXILIARY DATA #####
##########################

# Data is collected from the project quandl (public data platform from around the world).
# Here, we use data from the Central Bank of Brazil extracted from quandl.

data.inicio = "2000-01-19" # beginning date
data.fim = "2016-07-20" # ending date
tipo = "ts" # type

Quandl.api_key('xvSrAztygUphvYp9q1bs')

# BCB/13522 IS THE IPCA IN 12 MONTHS - MONTHLY
# BCB/13521 IS THE ANNUAL INFLATION TARGET - ANNUAL
# BCB/4189 IS THE SELIC RATE ACCUMULATED IN THE MONTH IN ANNUAL TERMS - MONTHLY

ipca.m = Quandl("BCB/13522", type = type, collapse = "monthly", start_date = date.inicio, end_date = data.fim)
ipca.meta = Quandl("BCB/13521", type = type, collapse = "annual", start_date = date.inicio, end_date = data.fim)
selic.m = Quandl("BCB/4189", type = type, collapse = "monthly", start_date = date.inicio, end_date = data.fim)

##########################
#### FIGURES ####
##########################

# Comparison of the sentiment index with macroeconomic variables
par(mfrow = c(2,2))
plot(x = scores$data, y = scores$document.scores, type = "l", xlab = "", ylab = "Sentiment Score")
plot(selic.m, type = "l", xlab = "", ylab = "Cumulative annual rate in month")
plot(ipca.m, type = "l", xlab = "", ylab = "IPCA in 12 months")
plot(ipca.meta, type = "l", xlab = "", ylab = "Annual Inflation Target")

# Positive and negative word clouds presented in the text

par(mfrow = c(1,1))
wordcloud(pos.terms, colSums(as.matrix(dtm[ , pos.terms])), min.freq = 1, scale = c(4,0.7), color = brewer.pal(n = 9, "Blues")[6:9])
wordcloud(neg.terms, colSums(as.matrix(dtm[ , neg.terms])), min.freq = 1, scale = c(4,0.7), color = brewer.pal(n = 9, "Reds")[6:9])