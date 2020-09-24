library(tidytuesdayR)
library(tidyverse)
library(DataExplorer)

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


#### DEALING WITH NA
plot_missing(peaks1,title = 'Peaks data')
plot_missing(members1,title = 'Members data')
plot_missing(expeditions1,title = 'Expeditions data')

## DROPPING COLUMNS WITH EXTREME NA VAL
peaks1 <- peaks1 %>%
  select(-peak_alternative_name)

members1 <- members1 %>%
  select(-c(injury_type,death_cause,death_height_metres,injury_height_metres))


### DATA VIZ FOR PEAS
# climbing status vs the height
# to identify how height affects the climbing status
ggplot(data = peaks1, aes(x=climbing_status,y=height_metres)) +
  geom_boxplot(outlier.color = 'red') +
  geom_jitter(width = 0.2)
hist(peaks1$height_metres)

ggplot(data = peaks1, aes(x=climbing_status,y=height_metres)) +
  geom_violin() +
  geom_jitter(width = 0.2) 


