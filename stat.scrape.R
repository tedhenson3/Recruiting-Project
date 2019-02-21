#sexton <- c("https://www.sports-reference.com/cbb/players/luke-maye-1.html")

setwd("~/analytics/recruiting project")

library(readr)
players <- read_csv(file = "successfull.scrapes.2.csv")
for(y in 1:length(players$link)){
  
  
  sexton <- players$link[y]


library(tidyverse)
library(rvest)
library(stringi)

css_tags <- '.p3 div+ div .poptip , .p3 div+ div p'

stats = sexton %>% readLines


# table.indices <- grep('<div id="all_players_', stats)
# 
# 
# 
# 
# for(i in 1:length(table.indices)){
#   start <- table.indices[io]
#   end  <- table.indices[i+1]
# 
# }



data <- data.frame('start.index' = c(0))

if(length(grep("per_game", stats)) != 0){
  
  
  

if(length(grep("per_game_conf", stats)) == 0){
  
  sub.tables <- c('per_game', 
                  'totals', 'per_min', 'per_poss',
                  'advanced')
  
}

else{
  sub.tables <- c('per_game', 
                  'totals', 'per_min', 'per_poss',
                  'advanced', 'per_game_conf', 
                  'totals_conf', 'per_min_conf', 
                  'per_poss_conf',  'advanced_conf')
  
}



for(k in 1:length(sub.tables)){

  table.name <- sub.tables[k]




  
  
  test.start = stri_replace_all_regex(str = sub.tables[k], pattern = '\"', replacement = '"')
  
  test.start <- paste('<div id="all_players_', test.start, sep = "")
  
  test.start = stri_replace_all_regex(str = test.start, pattern = '\"', replacement = '"')
  

start.index <- grep(test.start, stats)

start.index <- start.index[1]

data[k, 'start.index'] <- start.index

need <- stats[start.index:length(stats)]

my.string = stri_replace_all_regex(str = table.name, pattern = '\"', replacement = '"')

my.ends <- paste('<tr id="players_', my.string, '.', sep = '')

my.ends = stri_replace_all_regex(str = my.ends, pattern = '\"', replacement = '"')

my.end.indices <- grep(my.ends, need)


my.end.indices2 <- my.end.indices[which(my.end.indices < 100)]


#fresh <- 1

for(j in 1:length(my.end.indices2)){

# end <- strsplit(test.start, "all_")
  

# end <- paste(".", j, sep = "")
# final.table.name <- paste(table.name, end, sep = "")
# 
# final.table.name <- stri_replace_all_regex(pattern = '".20', replacement =  '.20', str = final.table.name)
# 
#  end = stri_replace_all_regex(str = end, pattern = '\"', replacement = '"')
# end.index <- grep(end, need)

  end <- my.end.indices2[j]
advanced <- as.character(need[1:end])



table <- advanced[length(advanced)]


year <- strsplit(table, ".", fixed = T)

season <- strsplit(year[[1]][2], '\"', fixed = T)

my.season <- season[[1]][1]




stat.split <- strsplit(table, "data-stat=")

next.split <- strsplit(stat.split[[1]], '>', fixed = T)



#career.data <- data.frame()
mydata <- data.frame()

flipped.data <- data.frame()

for(i in 5:length(next.split)){
  
  mystat <- next.split[[i]][2]
  
  stat.name <- next.split[[i]][1]
  
  stat.name <- gsub('"', '', stat.name, fixed = T)
  
  stat.name <- gsub(" ", "", stat.name, fixed = T)
  
  # if(y == 1){
  #   
  #   print(stat.name)
  # }
  # 
  # stat.name <- paste(stat.name, table.name, sep = ".")
  
  # colval1 <- paste('value.', my.season, sep = '')
  # 
  # 
  # colval2 <- paste('stat.', my.season, sep = '')
  
  #stat.name <- paste(stat.name, my.season, sep = '.')
    
  if(grepl("conf", table.name) == T){
    #colnames(flipped.data) <- paste("conf", colnames(flipped.data), sep = ".")
    stat.name <- paste(stat.name, "conf", sep = ".")
    
  }
  
  value <- as.numeric(gsub("</td", "", mystat, fixed = T))
  # mydata[i-4, colval1] <- value
  # 
  # mydata[i-4, colval2] <- stat.name
  
 flipped.data[1, stat.name] <- value
 

row.names(flipped.data) <- NULL




flipped.data <- as.data.frame(flipped.data)
# flipped.data$Name <- players$Name[y]
# flipped.data$Season <- my.season
flipped.data$Season <- as.numeric(my.season)
# flipped.data$Name <- players$link[y]



#see <- nest(flipped.data)


final.table.name <- paste(table.name, my.season, sep = "")
assign(final.table.name, flipped.data)
#overall.data[j,k] <- as.data.frame(see)



#colnames(overall.data)[k] <- table.name


}


if(j == 1){
  all.seasons <- flipped.data
  

}

if(j > 1){
  
  all.seasons <- rbind(flipped.data, all.seasons)
 
 

}

}
# if(k > 1 & j == 1){
#   #newrow <- cbind(overall.data[1,], flipped.data)
#   first.data <- flipped.data
# }
# 
# if(k > 1 & j < nrow(overall.data)){
#   
#   first.data <- rbind(flipped.data, first.data)
# }
# 
# if(k > 1 & j == nrow(overall.data)){
#   
#   overall.data <- cbind(overall.data, first.data)
#   overall.data$Name <- players$Name.espn[y]
#   View(overall.data)
#   
# }

if(k == 1){
  #newrow <- cbind(overall.data[1,], flipped.data)
  overall.data <- all.seasons
  
  
}

if(k > 1){

  
  overall.data <- cbind(overall.data, all.seasons)
}


}

  
  overall.data <- overall.data[, !duplicated(colnames(overall.data))]
  
  overall.data$Name <- players$Name[y]
  

  
if(y == 1){
  
  college.stats <- overall.data

  
}

else {

  
  library(plyr)
  college.stats <- rbind.fill(college.stats, overall.data)
  
  college.stats <- college.stats %>% select(Name, Season, everything())
  


  
  
  
}
}


}


write.csv(college.stats, file = 'bball.ref.data.part2.csv')
View(college.stats)
