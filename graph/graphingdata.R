spotify_tidy

library(ggplot2)

ggplot(danceability,
       aes (x="Track Name", y="dancability")) +
  geom_bar()
  