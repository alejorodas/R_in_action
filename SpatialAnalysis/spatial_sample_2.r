library(sp)
library(rgdal)
library(tmap)
library(leaflet)

Output.Areas <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/Camden_oa11/Camden_oa11.shp")
Census.Data <-read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/practicaldata.csv")
houses <-read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/camdenhousesales15.csv")

OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")


houses_1 <- houses[,c(1,2,8,9)]
plot(houses_1$oseast1m, houses$osnrth1m)

House.Points <-SpatialPointsDataFrame(houses_1[,3:4], houses_1, proj4string = CRS("+init=EPSG:27700"))

tm_shape(OA.Census) + tm_borders(alpha=.4) + tm_shape(House.Points) + tm_dots(col = "Price", palette = "Reds", style = "quantile")

tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile",
                              palette = "Reds", legend.hist = TRUE)

tm_shape(OA.Census) + tm_fill("Qualification", style = "equal",
                              palette = "Reds", legend.hist = TRUE)