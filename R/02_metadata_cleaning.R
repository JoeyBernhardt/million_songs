## looking at the metadata


library(tidyverse)
library(dbplyr)
library(RSQLite)

# read in the metadata ----------------------------------------------------


metadata <- src_sqlite("/Users/jbernhar/Documents/track_metadata.db")

metadata


songs <- tbl(metadata, "songs")


# pull out some subsets to start ------------------------------------------


year_2010 <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>% 
  filter(year > 2010) %>% 
  collect()


write_csv(year_2010, "data-processed/metadata_snippet_2010.csv")


subset1000 <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>%
  head(n = 1000) %>% 
  collect()

write_csv(subset1000, "data-processed/subset1000.csv")

## let's take a few more rows
subset_100k_top <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>%
  head(n = 100000) %>% 
  collect()

write_csv(subset_100k_top, "data-processed/subset_100k_top.csv")


