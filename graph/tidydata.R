source("importdata.R")

library(dplyr)
library(stringr)

spotify_tidy <- spotify_global %>%
  filter(Rank<11)



spotify_tidy <- select(spotify_tidy, "Track Name", danceability, speechiness)

spotify_tidy <- rename(spotify_tidy, Danceability=danceability, Speechiness=speechiness, Song="Track Name")

