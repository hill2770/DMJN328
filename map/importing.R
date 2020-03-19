#start my assignment here 

install.packages('cancensus')
library(cancensus)

file.edit(file.path('~/.Rprofile'))
options(cancensus.api_key='CensusMapper_059bce0f73d8e517369463bbb52c2412')
options(cancensus.cache_path="~")

#Getting the inital map
hamilton <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c(), labels="detailed", geo_format="sf", level='DA')

library(tidyverse)
library(ggplot2)
glimpse(hamilton)

#Plotting empty map
ggplot(hamilton, aes(geometry=geometry))+geom_sf()

#Testing fill with population
ggplot(hamilton, aes(geometry=geometry, fill=Population))+geom_sf()


#Importing university BA vector
hamilton2 <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c("v_CA16_5081"), labels="detailed", geo_format="sf", level='DA')
names(hamilton2)

hamilton2 <- rename(hamilton2, "TotalBA"="v_CA16_5081: Bachelor's degree")
names (hamilton2)

ggplot(hamilton2, aes(geometry=geometry, fill=TotalBA))+geom_sf()




#Male and Female
hamilton3 <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c("v_CA16_5081", "v_CA16_5082","v_CA16_5083"), labels="detailed", geo_format=NA, level='DA')
names(hamilton3)

hamilton4 <- rename (hamilton3, "TotalBA"="v_CA16_5081: Bachelor's degree", "FemaleBA"= "v_CA16_5083: Bachelor's degree", "MaleBA"="v_CA16_5082: Bachelor's degree")
names(hamilton4)

ggplot(hamilton4, aes(geometry=geometry, fill=TotalBA)) +geom_sf()
