
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



download.file("http://www.electoralcommission.org.uk/__data/assets/excel_doc/0011/189623/2015-UK-general-election-data-results-WEB.xlsx", "electionResults2015.xlsx")

candidates <- read_excel("electionResults2015.xlsx", sheet = 2)
constituency <- read_excel("electionResults2015.xlsx", sheet = 3)
results <- read_excel("electionResults2015.xlsx", sheet = 4)
partyNames <- read_excel("electionResults2015.xlsx", sheet = 5)

allData <- 
  left_join(
    constituency, 
    dplyr::select(results, -one_of(names(results)[1:4], names(results)[6:9]))
  )






