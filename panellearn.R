xyplot(Ozone~Wind | Month,data = airquality,layout= c(5,1),
    panel = function(x,y,...)
      { panel.xyplot(x,y,...)  
      panel.abline(h=median(x),lty=2)
      panel.lmline(x,y,col="red")
      }  )