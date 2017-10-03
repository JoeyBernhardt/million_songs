
library(tidyverse)

singer_locations <- read_csv("data-processed/singer_locations.csv")
save(singer_locations, file="data-processed/singer_locations.RData")
