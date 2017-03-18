
  temp = list.files(pattern="*.csv")
  for (i in 1:length(temp)) {assign(temp[i], read.csv(temp[i]))}
  
   for (i in 70:72)
    s[i] <- mean(read.csv(temp[i],header= TRUE)[,"nitrate"],na.rm=TRUE)
   
   mean(c(s[70],s[71],s[72]))