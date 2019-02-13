library(readr)

maxpreps <- read_csv(file = "maxpreps.16-17.csv")


espn <- read_csv(file = "espn.top.state.2017.csv")


test <- inner_join(maxpreps, espn, by = "Name")



#football

library(readr)

maxpreps <- read_csv(file = "maxpreps.qb.stats.18.csv")


espn <- read_csv(file = "qb.rankings.247.csv")


library(tidyverse)
test <- inner_join(maxpreps, espn, by = "Name")

