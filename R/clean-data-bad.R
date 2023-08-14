nlsy_cols <- c("glasses", "eyesight", "sleep_wkdy", "sleep_wknd",
							 "id", "nsibs", "samp", "race_eth", "sex", "region",
							 "income", "res_1980", "res_2002", "age_bir")

library(tidyverse)
setwd('/Users/chenyinxian/Library/CloudStorage/OneDrive-EmoryUniversity/EPI 590/epi590-r-in-class/data/raw')
nlsy <- read_csv("nlsy.csv",
								 na = c("-1", "-2", "-3", "-4", "-5", "-998"),
								 skip = 1, col_names = nlsy_cols)

library(dplyr)
#not always works for your computer
nlsy <- nlsy |>
	mutate(region_cat = factor(region, labels = c("Northeast", "North Central", "South", "West")),
				 sex_cat = factor(sex, labels = c("Male", "Female")),
				 race_eth_cat = factor(race_eth, labels = c("Hispanic", "Black", "Non-Black, Non-Hispanic")),
				 eyesight_cat = factor(eyesight, labels = c("Excellent", "Very good", "Good", "Fair", "Poor")),
				 glasses_cat = factor(glasses, labels = c("No", "Yes")))

nlsy <- na.omit(nlsy)

setwd("/Users/chenyinxian/Library/CloudStorage/OneDrive-EmoryUniversity/EPI 590/epi590-r-in-class/data/raw/clean/")
write_rds(nlsy, "nlsy-complete-cases.rds")
