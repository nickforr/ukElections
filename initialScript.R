

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
constituency <- read_excel("electionResults2015.xlsx", sheet = 2)

