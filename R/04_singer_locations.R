

library(tidyverse)
library(stringr)


locations <- read_csv("data-processed/location_data.csv")
singer <- read_csv("data-processed/songs_subset.csv")


singer_locations <- left_join(singer, locations, by = c("artist_id" = "ID"))

write_csv(singer_locations, "data-processed/singer_locations.csv")

