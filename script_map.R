##%######################################################%##
#                                                          #
####                     RussiaMaps                     ####
#                                                          #
##%######################################################%##


# Installing pacman =====================================================================
install.packages("pacman") 

# Loading/installing required packages ==================================================
pacman::p_load(tidyverse, 
               rgdal,
               geojsonio,
               downloader,
               broom,
               rgeos,
               sp,
               viridis)

# Setting the link of the geoJSON from Kreozot's repo
russiaJSONlink <- "https://raw.githubusercontent.com/Kreozot/russian-geo-data/master/geo.json"

# Downloading the geoJSON
downloader::download(russiaJSON, destfile = "russia.geo.json")

# Reading the file with readOGR
russiaJSON <- readOGR(dsn = "russia.geo.json")

# Correcting the problem with fortify/tidy: "TopologyException: input geom 0 is invalid"
russia <- gBuffer(russiaJSON, byid=TRUE, width=0) 

# Chukotka has negative coordinates. Thanks for the hint, @Sobach! (https://github.com/Sobach/R.rus.map.zoom) 
for(i in 1:length(russia@polygons)){
  for(j in 1:length(russia@polygons[[i]]@Polygons)){
    russia@polygons[[i]]@Polygons[[j]]@coords[,1]<- sapply(russia@polygons[[i]]@Polygons[[j]]@coords[,1], function(x){
      if(x < 0){
        x<-359.999+x
      }
      else{x}
    })
  }
}

# Tidying it
russiaDF <- tidy(russia, region = "NAME_1")

# Creating the map with only paths
map <- ggplot(russiaDF, aes(x = long, y = lat, group = group)) # Criando o mapa base
map_path <- map + 
  geom_path() + 
  theme_bw()

map_path

# Creating the map with polygons (filling with Viridis palette)
map_poly <- map +
  geom_polygon(aes(fill = as.factor(id)), show.legend = F)+
  scale_fill_viridis(discrete = T)

map_poly





