
## replicating cm008 iteratively!

singer_locations <- read_csv("data-processed/singer_locations.csv")


singer_locations2 <- singer_locations %>% 
  filter(!is.na(artist_hotttnesss), !is.na(artist_familiarity), !is.na(artist_name), !is.na(city)) %>% 
  filter(artist_hotttnesss > 0, artist_familiarity > 0) 

singer_locations2 %>% 
  filter(city == "New York")


my_songs <- singer_locations2 %>% 
  mutate(artist_popularity = artist_hotttnesss*artist_familiarity) 


rihanna <- my_songs %>% 
  filter(artist_name == "Rihanna", title == "Disturbia")
  

length(unique(my_songs$track_id))

my_songs2 <- my_songs %>%
  mutate(rihanna_popularity = rihanna$artist_popularity,
         relative_popularity = artist_popularity / rihanna_popularity)


### sanity check, all the rows here should be 1
my_songs2 %>% 
  filter(artist_name == "Rihanna") %>% 
  select(artist_name, title,  relative_popularity)


summary(my_songs2$relative_popularity)


my_songs %>%
  arrange(artist_name, year) %>% View

