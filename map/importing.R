#start my assignment here 

install.packages('cancensus')

library(cancensus)

file.edit(file.path('~/.Rprofile'))

options(cancensus.api_key='CensusMapper_059bce0f73d8e517369463bbb52c2412')

options(cancensus.cache_path="~")

hamilton <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c(), labels="detailed", geo_format="sf", level='DA')

library(tidyverse)

glimpse(hamilton)

library(ggplot2)

ggplot(hamilton, aes(geometry=geometry))+geom_sf()

ggplot(hamilton, aes(geometry=geometry, fill=Population))+geom_sf()

hamilton2 <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c("v_CA16_5078"), labels="detailed", geo_format="sf", level='DA')

glimpse(hamilton2)

names(hamilton2)

hamilton3 <- rename(hamilton2, University = "v_CA16_5078: University certificate, diploma or degree at bachelor level or above")

ggplot(hamilton3, aes(geometry=geometry, fill=University))+geom_sf()
