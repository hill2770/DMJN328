#All of my code from import, cleaning and plotting

#Import my data

#source("importdata.R")

getwd()

library(readr)

spotify_global<-read_csv("data/spotify_global_2019_most_streamed_tracks_audio_features.csv")

#Clean my data 

source("importdata.R")

library(dplyr)
library(stringr)
library(tidyverse)

spotify_tidy <- spotify_global %>%
  filter(Rank<11)


spotify_tidy <- select(spotify_tidy, "Track Name", danceability, speechiness)

spotify_tidy <- rename(spotify_tidy, Danceability=danceability, Speechiness=speechiness, Song="Track Name")

spotify_tidy <- gather(spotify_tidy, key="Factor", value="Measurement", 2:3)

#Plot my data


spotify_tidy

library(ggplot2)
library(forcats)

ggplot(spotify_tidy, aes(x=Song, y=Measurement, fill=Factor)) + 
  geom_col(position="dodge") +
  labs(title="Danceability and Speechiness of Spotify's 2019 Top 10", caption="Source: https://www.kaggle.com/prasertk/spotify-global-2019-moststreamed-tracks") +
  scale_fill_manual(values=c("Darkgreen", "Chartreuse")) + theme_bw() + theme(
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(colour = "black"),
    plot.caption = element_text(hjust = 0))





