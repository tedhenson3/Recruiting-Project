sexton <- c("https://www.sports-reference.com/cbb/players/theo-pinson-1.html")


library(tidyverse)
library(rvest)
css_tags <- '.p3 div+ div .poptip , .p3 div+ div p'

stats = sexton %>% readLines


table.indices <- grep('<div id="all_players_', stats)

c = stri_replace_all_regex(str = table.name, pattern = '\" class', replacement = '" class')


# 
# for(i in 1:length(table.indices)){
#   start <- table.indices[io]
#   end  <- table.indices[i+1]
#   
# }

sub.tables <- c('per_game" class', 'totals" class', 'per_min" class', 'per_poss" class', 'advanced" class', 'per_game_conf" class', 'totals_conf" class', 'per_min_conf" class', 'per_poss_conf" class', 'advanced_conf" class')
for(k in 1:length(sub.tables)-1){
  
  table.name <- sub.tables[k]
}
  

for(j in 2015:2018){
  
  
  c = stri_replace_all_regex(str = table.name, pattern = '\" class', replacement = '" class')
  
  test.start <- paste('<div id="all_players_', c, sep = "")

test.start.index <- grep(test.start, stats)

# test.year <- paste('<tr id="players_', c, '.',  j, sep  = '')
# test.year = stri_replace_all_regex(str = test.year, pattern = '\" class', replacement = '" class')
# test.year = stri_replace_all_regex(str = test.year, pattern = '\"players', replacement = '"players')
# 

test.year.index <- grep(test.year, stats)
# 
# start.index <- grep(start, stats)
start <- grep('<div id="all_players_advanced_conf"', stats)
year <- paste('<tr id="players_advanced_conf.', j, sep = '')


end <- grep(year, stats)


advanced <- as.character(stats[start:end])


table <- advanced[length(advanced)]


stat.split <- strsplit(table, "data-stat=")

next.split <- strsplit(stat.split[[1]], '>', fixed = T)


print(next.split)

#career.data <- data.frame()
mydata <- data.frame()

flipped.data <- data.frame()
for(i in 5:length(next.split)){
  
  
  mystat <- next.split[[i]][2]
  
  stat.name <- next.split[[i]][1]
  
  stat.name <- gsub('"', '', stat.name, fixed = T)
  
  stat.name <- gsub(" ", "", stat.name, fixed = T)
  
  
  colval1 <- paste('value.', j, sep = '')
  
  colval2 <- paste('stat.', j, sep = '')
  
  stat.name <- paste(stat.name, j, sep = '')
    
  
  value <- as.numeric(gsub("</td", "", mystat, fixed = T))
  mydata[i-4, colval1] <- value
  
  mydata[i-4, colval2] <- stat.name
  
 flipped.data[1, stat.name] <- value
  
row.names(flipped.data) <- NULL

}
}
#print(mydata)
print(flipped.data)