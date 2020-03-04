
spotify_tidy

library(ggplot2)

ggplot(spotify_tidy, aes(x=Song, y=Danceability, fill=Speechiness)) + 
  geom_col(position="dodge", stat="identity") + scale_fill_gradient(low="chartreuse", high="darkgreen")+
  labs(title="Danceability and Speechiness of Spotify's 2019 Top 10", caption="Source: https://www.kaggle.com/prasertk/spotify-global-2019-moststreamed-tracks/metadata")

