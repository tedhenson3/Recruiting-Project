setwd("~/analytics/recruiting project")

library(readr)

library(readr)
prep <- read_csv("prep.circuit.players.stats.16-17.csv")


library(readr)
espn <- read_csv("espn.top.state.2017.csv")

library(tidyverse)

espn$Name <- trimws(espn$Name,  which = 'both')

prep$Name <- trimws(prep$Name, which = 'both')


lower.player <- tolower(espn$Name)

lower.player <- gsub(" jr.", "jr", lower.player, fixed = T)
lower.player <- gsub(" sr.", "sr", lower.player, fixed = T)

lower.player <- gsub(" iii", "iii", lower.player, fixed = T)
lower.player <- gsub(" ii", "ii", lower.player, fixed = T)
lower.player <- gsub(" iv", "iv", lower.player, fixed = T)



lower.player <- gsub(".", "", lower.player, fixed = T)

lower.player <- gsub(",iii", "iii", lower.player, fixed = T)
lower.player <- gsub("'", "", lower.player, fixed = T)

lower.player = gsub("\\s+", "-", lower.player)

# first.last <- strsplit(lower.player, ' ')
# 
# #print(first.last)
# 
# player.id <- paste(first.last[[1]][1:length(first.last[[1]])], collapse = "-")

espn$player.id = lower.player



lower.player <- tolower(prep$Name)

lower.player <- gsub(" jr.", "jr", lower.player, fixed = T)
lower.player <- gsub(" sr.", "sr", lower.player, fixed = T)

lower.player <- gsub(" iii", "iii", lower.player, fixed = T)
lower.player <- gsub(" ii", "ii", lower.player, fixed = T)
lower.player <- gsub(" iv", "iv", lower.player, fixed = T)



lower.player <- gsub(".", "", lower.player, fixed = T)

lower.player <- gsub(",iii", "iii", lower.player, fixed = T)
lower.player <- gsub("'", "", lower.player, fixed = T)

library(stringr)
lower.player = gsub("\\s+", "-", lower.player)
#first.last <- strsplit(lower.player, ' ')

#print(first.last)

#player.id <- paste(first.last[[1]][1:length(first.last[[1]])], collapse = "-")

prep$player.id = lower.player

fresh <- inner_join(espn, prep,
                   by = 'player.id')


nrow(fresh)
nrow(espn)

weird = prep[which(grepl('porterjr', prep$player.id)),]
print(weird$player.id)

espn_top_state_2017 <- read_csv("espn.top.state.2017.csv")

test = read_csv(file = "bball.ref.data.part2.csv")




