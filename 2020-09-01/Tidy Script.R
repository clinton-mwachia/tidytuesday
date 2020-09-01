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
# percentage of na per colum
(colSums(is.na(arable_land_pin)) / nrow(arable_land_pin)) * 100
(colSums(is.na(cereal_crop_yield_vs_fertilizer_application)) / nrow(cereal_yields_vs_tractor_inputs_in_agriculture)) * 100
(colSums(is.na(cereal_yields_vs_tractor_inputs_in_agriculture)) / nrow(cereal_yields_vs_tractor_inputs_in_agriculture)) * 100
(colSums(is.na(key_crop_yields)) / nrow(key_crop_yields)) * 100
(colSums(is.na(land_use_vs_yield_change_in_cereal_production)) / nrow(land_use_vs_yield_change_in_cereal_production)) * 100

# joining the data
arable_comb_cereal_crop_yield_vs_fetilizer <- arable_land_pin %>%
  inner_join(cereal_crop_yield_vs_fertilizer_application)

arabl
arable_comb_cereal_crop_yield_vs_fetilizer_comb_cereals_yield_vs_tractor_inputs <- arable_comb_cereal_crop_yield_vs_fetilizer %>%
  inner_join(cereal_yields_vs_tractor_inputs_in_agriculture)
  