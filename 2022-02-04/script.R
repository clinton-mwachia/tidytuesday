# efficient R
# testing common R operations

# loading the libraries
library(tidyverse)
library(tidytuesdayR)
library(imager)

# loading the data
bt_url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/breed_traits.csv'
td_url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/trait_description.csv'
bra_url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-02-01/breed_rank.csv'

breed_traits <- read_csv(bt_url)
trait_description <- read_csv(td_url)
breed_rank_all <- read_csv(bra_url)

# checking NA values
colSums(is.na(breed_traits))

colSums(is.na(breed_rank_all))

# plotting the dogs
par(mfrow=c(1,1))
for (i in 1:5) {
  load.image(breed_rank_all$Image[i]) %>%
    plot(main=paste('Breed: ',breed_rank_all$Breed[i],', 2020 Rank', breed_rank_all$`2020 Rank`[i]))
}
