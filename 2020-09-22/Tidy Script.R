library(tidytuesdayR)
library(tidyverse)

data <- tt_load("2020-09-22")

peaks <- data$peaks
members <- data$members
expeditions <- data$expeditions

#### PEAKS DATA SET
str(peaks)
peaks1 <- peaks %>%
  mutate_if(is.character, as.factor)
str(peaks1)
summary(peaks1)

#### MEMBERS DATA SET
str(members)
members1 <- members %>%
  mutate_if(is.character, as.factor)
str(members1)

#### EXPEDITIONS DATA SET
str(expeditions)
expeditions1 <- expeditions %>%
  mutate_if(is.character, as.factor)
str(expeditions1)
