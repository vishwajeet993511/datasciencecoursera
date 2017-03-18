
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","housing.csv")
data <- read.csv("housing.csv")
data <- data[which(data$ACR==3 & data$AGS==6),]