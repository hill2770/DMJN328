#start my assignment here 
#You can uncomment this line now that it is installed
#install.packages('cancensus')
library(cancensus)
library(viridis)
library(tidyverse)
library(ggplot2)

#file.edit(file.path('~/.Rprofile'))
#options(cancensus.api_key='CensusMapper_059bce0f73d8e517369463bbb52c2412')
#options(cancensus.cache_path="~")

#Getting the inital map
hamilton <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c(), labels="detailed", geo_format="sf", level='CT')

#Plotting empty map
ggplot(hamilton, aes(geometry=geometry))+geom_sf()

#Testing fill with population
ggplot(hamilton, aes(geometry=geometry, fill=Population))+geom_sf()

#Importing university BA vector
hamilton2 <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c("v_CA16_5081"), labels="detailed", geo_format="sf", level='DA')
#names(hamilton2)

hamilton2 <- rename(hamilton2, "TotalBA"="v_CA16_5081: Bachelor's degree")
#names (hamilton2)

ggplot(hamilton2, aes(geometry=geometry, fill=TotalBA))+geom_sf()


#Male and Female
hamilton3 <- get_census(dataset='CA16', regions=list(CD="3525"), vectors=c("v_CA16_5081", "v_CA16_5082","v_CA16_5083"), labels="detailed", geo_format="sf", level='CT')
#names(hamilton3)

hamilton4 <- rename (hamilton3, "TotalBA"="v_CA16_5081: Bachelor's degree", "Female"= "v_CA16_5083: Bachelor's degree", "Male"="v_CA16_5082: Bachelor's degree")
#names(hamilton4)

ggplot(hamilton4, aes(geometry=geometry, fill=TotalBA)) +geom_sf()

hamilton5 <- gather(hamilton4, Sex, Number, Female, Male)

#FinalPlot
ggplot(hamilton5, aes(geometry=geometry, fill=Number)) +
  geom_sf()+
  facet_wrap(~Sex)+
  scale_fill_gradient(low="dodgerblue3", high="red")+
  theme_minimal()+
  theme(text=element_text(size=16, family="Calibri Light"))+
  labs(title="Hamilton Residents with Bachelor's Degrees", caption="Source: censusmapper.ca")+
  theme(
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text = element_blank())
 

# Hi Jonnica, I think it might be useful to plot this as a percentage, rather than as the raw numbers. 
# Great work!! I love the red and blue, it works as a great contrast!

hamilton5 %>% 
  mutate(percent=(Number/Population)*100) %>% 
ggplot(., aes(geometry=geometry, fill=percent)) +
  geom_sf()+
  facet_wrap(~Sex)+
  scale_fill_gradient(low="dodgerblue3", high="red")+
  theme_minimal()+
  #theme(text=element_text(size=16, family="Calibri Light"))+
  labs(title="Hamilton Residents with Bachelor's Degrees", caption="Source: censusmapper.ca")+
  theme(
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.text = element_blank())


