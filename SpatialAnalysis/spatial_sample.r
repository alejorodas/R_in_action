library(rgdal)
library(tmap)
library(leaflet)
Output.Areas <- readOGR("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/Camden_oa11/Camden_oa11.shp")
#plot(Output.Areas)

Census.Data <-read.csv("/Users/alejandrorodas/Documents/Libros/R/R_ejercicios/R_in_action/SpatialAnalysis/practicaldata.csv")

#head(Output.Areas@data)
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")
#plot(OA.Census)

tm_shape(OA.Census) + 
  
tm_fill("Qualification", palette = "Greens", style = "quantile", n = 5,
         title = "% with a Qualification") + 

tm_compass() +

tm_layout(title = "Camden, London", legend.text.size = 1.1,
          legend.title.size = 1.4, legend.position = c("right", "top"), 
          frame = FALSE)
