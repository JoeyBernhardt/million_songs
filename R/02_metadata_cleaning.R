## looking at the metadata


library(tidyverse)
library(dbplyr)
library(RSQLite)
library(stencila)

# read in the metadata ----------------------------------------------------


metadata <- src_sqlite("~/Documents/track_metadata.db")

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
  # filter(artist_hotttnesss < 0.7, duration < 6) %>% 
  head(n = 1000) %>% 
  collect()


### keep some of the songs of year 0, just for fun

write_csv(subset1000, "data-processed/subset1000.csv")

## let's take a few more rows
subset_100k_top <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>%
  head(n = 100000) %>% 
  collect() %>% 
  sample_n(1000)

write_csv(subset_100k_top, "data-processed/subset_1000_top.csv")


#### Let's try a more purposeful subset of the data

year_songs <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>%
  filter(year > 0) %>% 
  collect()


subset_years <- year_songs %>% 
  sample_n(size = 1000, replace = FALSE)

year0 <- songs %>%
  select(track_id, title, song_id, release, artist_id, artist_name, year, duration, artist_hotttnesss, artist_familiarity) %>%
  filter(year == 0) %>% 
  collect()

## now let's pull out some rows with a 0 for year
year0_sub <- year0 %>% 
  sample_n(size = 100)

### let's glue the two data subsets together

songs_subset <- bind_rows(subset_years, year0_sub)

write_csv(songs_subset, "data-processed/songs_subset.csv")

