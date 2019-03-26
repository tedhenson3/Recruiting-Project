#ESPN to bball.ref merge#

library(readr)
setwd("~/analytics/recruiting project")
bball.ref.15 <- read_csv("bball.ref.data.15.csv")

bball.ref.16 <- read_csv("bball.ref.data.16.csv")

bball.ref.17 <- read_csv("bball.ref.data.17.csv")

library(plyr)
bball.ref.total  = rbind.fill(bball.ref.15, bball.ref.16, bball.ref.17)

espn.15 <- read_csv("successfull.scrapes.15.csv")

espn.16 <- read_csv("successfull.scrapes.16.csv")

colnames(espn.16) = colnames(espn.15)



espn.17 <- read_csv("successfull.scrapes.17.csv")


colnames(espn.17) = colnames(espn.15)

espn.total  = rbind.fill(espn.15, espn.16, espn.17)

id.fix = function(sexton){
  
  

player.id = strsplit(sexton, ".html")
player.id = strsplit(player.id[[1]][1], '/', fixed = T)
player.id = player.id[[1]][6]
return(player.id)

}

espn.total$player.id = sapply(espn.total$link, FUN = id.fix)

library(tidyverse)
total.data = merge(espn.total, bball.ref.total)


#total.data = total.data[sort(total.data$Rating, decreasing = F),]

total.data = total.data %>% arrange(desc(Rating))

total.data = total.data %>% select(Name, Rating, ws, ws.conf, ws_per_40, ws_per_40.conf,
                                   everything())


write.csv(total.data, file = 'recruit.college.15-17.csv', row.names = F)


# preview = total.data[1:30,]
# 
# View(preview)



length(unique(total.data$Name.x))

length(unique(espn.total$Name))



all.espn.15 <- read_csv("espn.top.state.2015.csv")

all.espn.16 <- read_csv("espn.top.state.2016.csv")

colnames(all.espn.16) = colnames(all.espn.15)



all.espn.17 <- read_csv("espn.top.state.2017.csv")


colnames(all.espn.17) = colnames(all.espn.15)

all.espn.total  = rbind.fill(all.espn.15, all.espn.16, all.espn.17)

all.espn.total = all.espn.total %>% filter(School != 'unknown')
length(unique(all.espn.total$Name))

total.conversion = length(unique(total.data$Name.x)) /  length(unique(all.espn.total$Name))

total.conversion