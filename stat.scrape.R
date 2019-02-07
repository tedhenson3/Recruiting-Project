sexton <- c("https://www.sports-reference.com/cbb/players/joel-berry-1.html")

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

overall.data <- data.frame()
sub.tables <- c('per_game', 
                'totals', 'per_min', 'per_poss',
                'advanced', 'per_game_conf', 
                'totals_conf', 'per_min_conf', 
                'per_poss_conf',  'advanced_conf')

data <- data.frame('start.index' = c(0))

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
#print(my.string)

my.ends <- paste('<tr id="players_', my.string, '.', sep = '')

my.ends = stri_replace_all_regex(str = my.ends, pattern = '\"', replacement = '"')
#print(my.ends)

my.end.indices <- grep(my.ends, need)
#print(my.end.indices)


my.end.indices2 <- my.end.indices[which(my.end.indices < 100)]



#fresh <- 1


for(j in my.end.indices2){
  need[my.end.indices2]

# end <- strsplit(test.start, "all_")
  

end <- paste(".", j, sep = "")
final.table.name <- paste(table.name, end, sep = "")

final.table.name <- stri_replace_all_regex(pattern = '".20', replacement =  '.20', str = final.table.name)

 end = stri_replace_all_regex(str = end, pattern = '\"', replacement = '"')
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

see <- nest(flipped.data)

assign(final.table.name, flipped.data)

overall.data[c(j-2014),k] <- see

colnames(overall.data)[k] <- table.name

}
}
}
View(overall.data)
#print(mydata)
