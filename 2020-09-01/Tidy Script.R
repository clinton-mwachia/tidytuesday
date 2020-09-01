#install.packages("tidytuesdayR")
#setwd('F:\\R\\Mycodes\\2020\\tidytuesday\\2020-09-01')
# getwd()

# loading the package and the data
library(tidytuesdayR)
library(tidyverse)

data <- tt_load("2020-09-01")

arable_land_pin <- data$arable_land_pin
cereal_crop_yield_vs_fertilizer_application <- data$cereal_crop_yield_vs_fertilizer_application
cereal_yields_vs_tractor_inputs_in_agriculture <- data$cereal_yields_vs_tractor_inputs_in_agriculture
key_crop_yields <- data$key_crop_yields
land_use_vs_yield_change_in_cereal_production <- data$land_use_vs_yield_change_in_cereal_production

# data structure
glimpse(arable_land_pin)
glimpse(cereal_crop_yield_vs_fertilizer_application)
glimpse(cereal_yields_vs_tractor_inputs_in_agriculture)
glimpse(key_crop_yields)
glimpse(land_use_vs_yield_change_in_cereal_production)


# na values
# percentage of na per column
col_na_percentage <- function(data){
  (colSums(is.na(data))/ nrow(data))
}
col_na_percentage(arable_land_pin)
col_na_percentage(cereal_crop_yield_vs_fertilizer_application)
col_na_percentage(cereal_yields_vs_tractor_inputs_in_agriculture)
col_na_percentage(key_crop_yields)
col_na_percentage(land_use_vs_yield_change_in_cereal_production)


# joining the data
arable_comb_cereal_crop_yield_vs_fetilizer <- arable_land_pin %>%
  inner_join(cereal_crop_yield_vs_fertilizer_application)

cereal_yields_vs_tractor_inputs_in_agriculture$Year <- as.double(cereal_yields_vs_tractor_inputs_in_agriculture$Year)
# one
arable_comb_cereal_crop_yield_vs_fetilizer_comb_cereals_yield_vs_tractor_inputs <- arable_comb_cereal_crop_yield_vs_fetilizer %>%
  inner_join(cereal_yields_vs_tractor_inputs_in_agriculture)
  
# two
one_comb_cereal_yields_tractor <- arable_comb_cereal_crop_yield_vs_fetilizer_comb_cereals_yield_vs_tractor_inputs%>%
  inner_join(cereal_yields_vs_tractor_inputs_in_agriculture)

# three
two_comb_key_crop_yields <- one_comb_cereal_yields_tractor %>%
  inner_join(key_crop_yields)

land_use_vs_yield_change_in_cereal_production$Year <- as.double(land_use_vs_yield_change_in_cereal_production$Year)
three_comb_land_use_vs_yield_change_in_cereal <- two_comb_key_crop_yields %>%
  inner_join(land_use_vs_yield_change_in_cereal_production)


data <- three_comb_land_use_vs_yield_change_in_cereal

col_na_percentage(data)
