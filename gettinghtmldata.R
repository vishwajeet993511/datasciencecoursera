library(XML) 
library(RCurl) 
Sys.setenv(http_proxy="http://10.3.100.207:8080")
fileXML <- "http://www.unitedstateszipcodes.org/90650/"

xData <- getURL(fileXML) # This allows us to use https
doc <- htmlTreeParse(xData,useInternalNodes = TRUE)
content <-getNodeSet(doc,"//tbody//tbody")
content
#density <- xpathSApply(doc,"//tbody",xmlValue)

