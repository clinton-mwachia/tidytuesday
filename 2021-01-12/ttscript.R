# loading packages
library(tidytuesdayR)
library(tidyverse)
library(DataExplorer)

# getting the data
ttdata <- tt_load('2021-01-12')

###### artwork data set
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
na_perc <- (colSums(is.na(artworkdata)) / nrow(artworkdata)) * 100
round(na_perc ,1)

# plot NA percentages
plot_missing(artworkdata)

# PREPROCESSING
# artist with more work
artworkdata %>%
  count(artist, sort = TRUE) %>%
  view()

# artist with more work
artworkdata %>%
  count(artist, sort = TRUE) %>%
  filter(n > 500) %>%
  mutate(artist = reorder(artist, n)) %>%
  ggplot(aes(artist, n)) +
  geom_col(fill="red") +
  xlab(NULL) +
  ggtitle("artists work count") +
  coord_flip()

# removing ? (?)

###### artists data set
artistsdata <- ttdata$artists
