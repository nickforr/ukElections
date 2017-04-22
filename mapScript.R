
#https://cran.r-project.org/doc/contrib/intro-spatial-rl.pdf
#http://amsantac.co/blog/en/r/2015/08/11/leaflet-R.html
#https://github.com/Robinlovelace/Creating-maps-in-R/blob/master/intro-spatial.Rmd
#https://rstudio.github.io/leaflet/shapes.html

attribution <- "Contains OS data © Crown copyright and database right 2017"

library(tidyverse)
library(readxl)
library(raster)
library(leaflet)

constituencyShapefile <- 
  shapefile("/Users/nick/Documents/bdline_essh_gb/Data/GB/westminster_const_region.shp") %>%
  spTransform(CRS("+init=epsg:4326"))

leaflet(data = constituencyShapefile) %>% 
  addTiles() %>% 
  addPolygons(fill = FALSE, stroke = TRUE, color = "#03F")








