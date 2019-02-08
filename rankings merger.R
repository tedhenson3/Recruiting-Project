setwd("~/analytics/recruiting project")
library(tidyverse)

library(readr)
rankings.espn <- read_csv(file = 'rankings.espn.csv')

rankings.247 <- read_csv(file = 'rankings.247.csv')


espn.247 <- full_join(rankings.espn, rankings.247, by = "player.id", 
                      suffix = c(".espn", ".247"))


espn.247$School <- gsub("N Carolina", "UNC", espn.247$School)

espn.247$School <- gsub("Miss. St", "Mississippi State", espn.247$School)

espn.247$School <- gsub("W Kentucky", "Western Kentucky", espn.247$School)

espn.247$School <- gsub("W Kentucky", "Western Kentucky", espn.247$School)




rownames(espn.247) <- NULL

#View(espn.247)

source("~/analytics/recruiting project/basketball reference win share scraper.R")

espn.247 <- espn.247 %>% filter(!is.na(Name.espn) & School != 'unknown')
data <- wsscraper(data = espn.247)

#write.csv(data, file = 'successfull.scrapes.csv', row.names = F)
