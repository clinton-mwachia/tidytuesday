# loading packages
library(tidytuesdayR)
library(tidyverse)

# getting the data
ttdata <- tt_load('2021-01-12')

# artwork data set
artworkdata <- ttdata$artwork

# analysis of the data
glimpse(artworkdata)
summary(artworkdata)

# convert character to factors
artworkdata %>% 
  #select_if(is.character) %>%
  mutate_if(is.character, as.factor) %>%
  #glimpse()
  summary()
  #str()

# percentage of na columns
artworkdata %>% 
  colSums(is.na())



# artists data set
artistsdata <- ttdata$artists
