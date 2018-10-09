library(rgdal)
library(tmap)
library(leaflet)
library("sp")
Output.Areas <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/Camden_oa11/Camden_oa11.shp")
#plot(Output.Areas)

Census.Data <-read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/practicaldata.csv")
houses <-read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/camdenhousesales15.csv")

#head(Output.Areas@data)
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")
#plot(OA.Census)

# tm_shape(OA.Census) +
# tm_fill("Qualification", palette = "Greens", style = "quantile", n = 5,
#          title = "% with a Qualification") +
# tm_compass() +
# tm_layout(title = "Camden, London", legend.text.size = 1.1,
#           legend.title.size = 1.4, legend.position = c("right", "top"),
#           frame = FALSE)

houses <- houses[,c(1,2,8,9)]


House.Points <-SpatialPointsDataFrame(houses[,3:4], houses,
                                      proj4string = CRS("+init=EPSG:27700"))

tm_shape(OA.Census) + tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_dots(col = "Price", palette = "Reds", style = "quantile")