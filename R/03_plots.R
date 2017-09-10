
## some potential plots and exercises

library(tidyverse)



locations <- read_csv("data-processed/location_data.csv")
song_data <- read_csv("data-processed/subset1000.csv")


song_data %>% 
  ggplot(aes(x = artist_hotttnesss, y = artist_familiarity)) + geom_point()

song_data %>%
  filter(year > 1980) %>% 
  count(year) %>%
  plot