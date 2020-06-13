library(tidyverse)

# data in data-raw/WaterYearType.csv comes from http://cdec.water.ca.gov/cgi-progs/iodir/WSIHIST
# needs to be manually updated annually

water_year_type <- read.csv("data-raw/WaterYearType.csv") %>%
  gather(key = "Valley", value = "WYT", SAC:SJR) %>%
  left_join(tibble(WYT = c("W", "AN", "BN", "D", "C"),
                   WaterYearType = c("Wet", "Above Normal", "Below Normal", "Dry", "Critical"))) %>%
  mutate(WYT = factor(WYT, levels = c("C", "D", "BN", "AN", "W")),
                      WaterYearType = factor(WaterYearType, levels = c("Critical", "Dry", "Below Normal", "Above Normal", "Wet")))
usethis::use_data(water_year_type, overwrite = TRUE)

