# install.packages("tidytuesdayR")
# setwd('F:\\R\\Mycodes\\2020\\tidytuesday\\2020-09-01')
# getwd()

# loading the package and the data
library(tidytuesdayR)
library(tidyverse)
library(DataExplorer)

data <- tt_load("2020-09-01")

arable_land <- data$arable_land_pin
fertilizer <- data$cereal_crop_yield_vs_fertilizer_application
tractor <- data$cereal_yields_vs_tractor_inputs_in_agriculture
key_crop_yields <- data$key_crop_yields
land_use <- data$land_use_vs_yield_change_in_cereal_production

# data structure
glimpse(arable_land)
glimpse(fertilizer)
glimpse(tractor)
glimpse(key_crop_yields)
glimpse(land_use)


# na values
# percentage of na per column
col_na_percentage <- function(data){
  (colSums(is.na(data))/ nrow(data))
}
col_na_percentage(arable_land)
col_na_percentage(fertilizer)
col_na_percentage(tractor)
col_na_percentage(key_crop_yields)
col_na_percentage(land_use)


# joining the data
arable_land_comb_fetilizer <- arable_land %>%
  inner_join(fertilizer)

tractor$Year <- as.double(tractor$Year)
# one
arable_land_comb_fetilizer_comb_tractor <- arable_land_comb_fetilizer %>%
  inner_join(tractor)
  
# two
key_crop_yields_tractor_vs_one <- arable_land_comb_fetilizer %>%
  inner_join(key_crop_yields)

# three
two_comb_key_crop_yields <- key_crop_yields_tractor_vs_one %>%
  inner_join(key_crop_yields)

land_use$Year <- as.double(land_use$Year)
three_comb_land_use_vs_yield_change_in_cereal <- two_comb_key_crop_yields %>%
  inner_join(land_use)


data <- three_comb_land_use_vs_yield_change_in_cereal

col_na_percentage(data)
colnames(data1)

# rename the column names
data1 <- data %>%
  rename(
    `Arable land` = `Arable land needed to produce a fixed quantity of crops ((1.0 = 1961))`,
    `Nitrogen fertilizer (kg per hec)` = `Nitrogen fertilizer use (kilograms per hectare)`,
    `Cereal yield (ton per hec)` = `Cereal yield (tonnes per hectare)`,
    `Wheat (ton per hec` = `Wheat (tonnes per hectare)`,
    `Rice (ton per hec)` = `Rice (tonnes per hectare)`,
    `Maize (ton per hec` = `Maize (tonnes per hectare)`,
    `Soybeans (ton per hec` = `Soybeans (tonnes per hectare)`,
    `Beans (ton per hec` = `Beans (tonnes per hectare)`,
    `Peas (ton per hec)` = `Peas (tonnes per hectare)`,
    `Cassava (ton per hec)` = `Cassava (tonnes per hectare)`,
    `Barley (ton per hec)` = `Barley (tonnes per hectare)`,
    `Cocoa beans (ton per hec)` = `Cocoa beans (tonnes per hectare)`,
    `Bananas (ton per hec)` = `Bananas (tonnes per hectare)`,
    `land change due to cereal production since 1961` = `Change to land area used for cereal production since 1961`
  )

# plot missing
profile_missing(data1)
plot_missing(
  data1,
  title = 'Missing values by percentage',
  missing_only = TRUE
) +
  theme(legend.position = 'none') 
