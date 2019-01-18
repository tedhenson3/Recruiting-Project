setwd("~/analytics/recruiting project")
rankings.espn <- read_csv(file = 'rankings.espn.csv')

rankings.247 <- read_csv(file = 'rankings.247.csv')


espn.247 <- full_join(rankings.espn, rankings.247, by = "player.id", 
                      suffix = c(".espn", ".247"))


rownames(espn.247) <- NULL

#View(espn.247)

source("~/analytics/recruiting project/basketball reference win share scraper.R")

espn.247 <- espn.247 %>% filter(!is.na(Name.espn))
data <- wsscraper(data = espn.247)

