
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
  

