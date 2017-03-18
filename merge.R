library(dplyr)

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv","gdpdata.csv")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv","edudata.csv")

gdpdata <- read.csv("gdpdata.csv")
edudata <- read.csv("edudata.csv")

gdpdata <- rename(gdpdata, CountryCode = X, rankingGDP=X.1, Long.Name=X.3, gdp=X.4)
datanew <- merge(gdpdata,edudata, all= TRUE, by="CountryCode")
sum(!is.na(unique(datanew$rankingGDP)))

