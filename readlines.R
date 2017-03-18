library(XML) 
library(RCurl)
Sys.setenv(http_proxy="http://10.3.100.207:8080")

char <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(char)
close(char)

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])
