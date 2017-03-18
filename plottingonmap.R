data <- read.csv("EAPdist_coList.csv")
str(data)

png(filename="plot.png",width =600,height = 480)
library(ggplot2)

dev.off()
library(ggplot2)
ggplot(data, aes(x = X1, y = X2, colour = X0, fill = col ),scale("column")) + 
  geom_tile()

#dev.off()

ggplot(data, aes(x = c(X1,X3), y = c(X2,X4))) + 
  geom_point() + 
  stat_density2d(aes(fill=..density..), geom = "tile", contour = FALSE) +
  scale_fill_gradient2(low = "white", high = "red")

heatmap(as.matrix(data),scale = "column", col= heat.colors(256),main = "lat and long"
        ,Rowv = NA,Colv = NA)

ggplot(data,aes(x=X1,y=X2)) + stat_binhex()


ggplot(data,aes(x=X1,y=X2)) + 
  geom_point(colour="blue", alpha=0.2) + 
  geom_density2d()


ggplot(data, aes(x=X1, y=X2)) +
  geom_point(shape=1, aes(color = factor(cond))) +
  geom_subplot2d(aes(X1, X2,
                     subplot = geom_bar(aes(cond, ..count.., fill = cond))),
                 bins = c(15,15), ref = NULL, width = rel(0.8), ply.aes = FALSE)



require(MASS)
dens <- kde2d(data$X1, data$X2)  #overrode default bandwidth
filled.contour(dens)


ggmap(tartu_map, extent = "device") + geom_point(aes(x = lon, y = lat), colour = "red", 
                                                 alpha = 0.1, size = 2, data = tartu_housing_xy_wgs84_a)


ggmap(tartu_map, extent = "device") + geom_point(aes(x = data$X1, y = data$X2), colour = "red", 
                                                 alpha = 0.1, size = 2, data = data)



tartu_map_g_str <- get_map(location = "tartu", zoom = 13)

usa_center = as.numeric(geocode("California"))
USAMap = ggmap(get_googlemap(center=usa_center, scale=2, zoom=4), extent="normal")

mv_num_collisions = data.frame(data$X0, data$X1, data$X2)

colnames(mv_num_collisions) = c('collisions','lon','lat')
png(filename="plot3.png",width =600,height = 480)
USAMap + 
  geom_point(aes(x=lon, y=lat), data=mv_num_collisions, 
    col="orange", alpha=0.4, size=mv_num_collisions$collisions*4*4) +  
  scale_size_continuous(range=range(mv_num_collisions$collisions))

dev.off()









