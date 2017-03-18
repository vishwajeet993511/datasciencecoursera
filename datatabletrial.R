library(data.table)
library(XML)

pages <- c(1:15)

urls <- rbindlist(lapply(pages,function(x) {
      url <- paste("http://www.unitedstateszipcodes.org/90650/",x,"/",sep="")
       data.frame(url)
  
}      ),fill = TRUE)



popdens <- rbindlist( apply(urls,1,function(url){
  doc1 <- htmlParse(url)
  popdensity <- getNodeSet(  doc1, "/html/body/div/div/div[4]/div/div[2]/div[1]/table/tbody/tr[2]/td[1]" )
  data.frame(sapply(popdensity,function(x) {xmlValue(x) }   ))
    
  
  
}) ,fill= TRUE)
