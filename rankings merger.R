espn.247 <- full_join(rankings.espn, rankings.247, by = "player.id", 
                      suffix = c(".espn", ".247"))


rownames(espn.247) <- NULL

#View(espn.247)

source("~/analytics/recruiting project/basketball reference win share scraper.R")


data <- wsscraper(data = espn.247)

