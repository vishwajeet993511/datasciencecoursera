library(reshape2)
library(dplyr)
head(mtcars)
#nrow(mtcars)
mtcars$carname <- rownames(mtcars)
#carMelt <- melt(mtcars,id=c("carname","gear"),measure.vars=c("mpg","hp"))
#nrow(carMelt)

data <- mutate(mtcars,temp_con = ifelse(mpg>21,"more","less") )
more_less <- group_by(data,temp_con)
if(data$X.3=="")
  data$X.3="0"