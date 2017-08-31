## looking at the metadata


library(tidyverse)
library(dbplyr)
library(RSQLite)
# read in the metadata ----------------------------------------------------


metadata <- src_sqlite("/Users/jbernhar/Documents/track_metadata.db")

metadata


songs <- tbl(metadata, "songs")


year_2010 <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>% 
  filter(year > 2010) %>% 
  collect()


write_csv(year_2010, "data-processed/metadata_snippet_2010.csv")
