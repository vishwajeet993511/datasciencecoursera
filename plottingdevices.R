library(datasets)
pdf(file= "plot1new.pdf")
with(airquality,plot(Solar.R,Temp))
dev.off()