source("importdata.R")

library(dplyr)
library(stringr)

spotify_tidy <- spotify_global %>%
  filter(Rank<11)


spotify_tidy %>%
  str_to_title(colnames)

