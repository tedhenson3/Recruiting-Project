sexton <- c("https://www.sports-reference.com/cbb/players/theo-pinson-1.html")


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

sub.tables <- c('per_game"', 
                'totals"', 'per_min"', 'per_poss"',
                'advanced"', 'per_game_conf"', 
                'totals_conf"', 'per_min_conf"', 
                'per_poss_conf"', 
                'advanced_conf')

data <- data.frame('start.index' = c(0))

for(k in 1:length(sub.tables)){

  table.name <- sub.tables[k]




  
  
  test.start = stri_replace_all_regex(str = sub.tables[k], pattern = '\"', replacement = '"')
  
  test.start <- paste('<div id="all_players_', test.start, sep = "")
  
  test.start = stri_replace_all_regex(str = test.start, pattern = '\"', replacement = '"')
  

start.index <- grep(test.start, stats)

data[k, 'start.index'] <- start.index

need <- stats[start.index:length(stats)]
for(j in 2015:2018){

# end <- strsplit(test.start, "all_")
  

end <- paste(".", j, sep = "")
# end = stri_replace_all_regex(str = end, pattern = '\"', replacement = '"')
end.index <- grep(end, need)


advanced <- as.character(need[1:end.index[1]])


table <- advanced[length(advanced)]


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
}
#print(mydata)
print(flipped.data)