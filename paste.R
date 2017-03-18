x <- read.csv("data.csv")
url <-paste("http://www.unitedstateszipcodes.org/",x[,1],"/",sep="")