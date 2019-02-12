library(readr)

maxpreps <- read_csv(file = "maxpreps.16-17.csv")


espn <- read_csv(file = "espn.top.state.2017.csv")


test <- inner_join(maxpreps, espn, by = "Name")

