
library(XML) 
library(RCurl)
Sys.setenv(http_proxy="http://10.3.100.207:8080")
x <- read.csv("data.csv")

l <- c()
url <-paste("http://www.unitedstateszipcodes.org/",x[,1],"/",sep="")
#url <- paste("http://www.unitedstateszipcodes.org/90650/")

for(i in 2:10)
{
  
  appData <- getURL(url[i], ssl.verifypeer = FALSE)
  doc <- htmlParse(appData)
  appData <- doc['//table[@class="yfnc_datamodoutline1"]']
  
#classes <- c("character","integer")
poptable <- readHTMLTable(getURL(url[i]),which = c(2), stringsAsFactors=F)
#print(as.numeric(gsub(",","",poptable$V2[2],fixed=TRUE)))

#l <- c(l,as.numeric(gsub(",","",poptable$V2[2],fixed=TRUE)))
l <- c(l,as.numeric(gsub(",","",poptable$V2[2],fixed=TRUE)))
}