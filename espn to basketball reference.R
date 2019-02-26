setwd("~/analytics/recruiting project")
library(tidyverse)

library(readr)
#rankings.espn <- read_csv(file = 'rankings.espn.csv')

# rankings.247 <- read_csv(file = 'rankings.247.csv')
# 
# 
# espn.247 <- full_join(rankings.espn, rankings.247, by = "player.id", 
#                       suffix = c(".espn", ".247"))
# 
# 

#ask Dr Mario what to do


espn.247 <- read_csv(file = 'espn.top.state.2017.csv')

espn.247$School <- ifelse(substr(espn.247$School, 
                                 nchar(espn.247$School)-1, 
                                 nchar(espn.247$School)) == 'St', 
                          gsub(" St", " State", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'N ', 
                          gsub("N ", "North ", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'E ', 
                          gsub("E ", "East ", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'W ', 
                          gsub("W ", "West ", espn.247$School), espn.247$School)

espn.247$School <- ifelse(substr(espn.247$School, 
                                 1, 
                                 2) == 'S ', 
                          gsub("S ", "South ", espn.247$School), espn.247$School)
 
espn.247$School <- gsub("North Carolina", "UNC", espn.247$School)

espn.247$School <- gsub("S Carolina", "South Carolina", espn.247$School)


espn.247$School <- gsub("Miss. St", "Mississippi State", espn.247$School)

espn.247$School <- gsub("W Kentucky", "Western Kentucky", espn.247$School)

espn.247$School <- gsub("W Kentucky", "Western Kentucky", espn.247$School)

espn.247$School <- gsub("Oklahoma St", "Oklahoma State", espn.247$School)




unique(espn.247$School)



rownames(espn.247) <- NULL
colnames(espn.247) <- paste(colnames(espn.247), 'espn', sep = ".")

colnames(espn.247) <- gsub("School.espn", "School", colnames(espn.247))

library(tidyverse)
#View(espn.247)

source("~/analytics/recruiting project/basketball reference win share scraper.R")

espn.247 <- espn.247 %>% filter(!is.na(Name.espn) & School != 'unknown')

basketballdata <- wsscraper(data = espn.247)

write.csv(basketballdata, file = 'successfull.scrapes.2.csv', row.names = F)
