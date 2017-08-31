


# starting to look at the million songs data ------------------------------

library(tidyverse)
library(stringr)


# import data -------------------------------------------------------------

location_data_raw <- read_delim("data-raw/artist_location.txt", delim = "<SEP>", col_names = c("ID", "latitude", "longitude", "name", "city"))


# clean -------------------------------------------------------------------

location_data <- location_data_raw %>% 
  mutate(latitude = str_replace(latitude, "SEP>", ""),
         longitude = str_replace(longitude, "SEP>", ""),
         name = str_replace(name, "SEP>", ""),
         city = str_replace(city, "SEP>", "")) %>% 
  mutate(latitude = as.numeric(latitude)) %>% 
  mutate(longitude = as.numeric(longitude))


write_csv(location_data, "data-processed/location_data.csv")
