espn <- c('http://www.espn.com/college-sports/basketball/recruiting/playerrankings/_/class/2017/order/true')

# css_tags <- 'td'
# rankings_2018 = espn %>%
#   read_html() %>%
#   html_nodes(css=css_tags) %>% html_text()

#View(rankings_2018)

library(rvest)
library(tidyverse)

css_tags.2 = 'td:nth-child(1) , .colhead td , .school-name , td:nth-child(8) , td:nth-child(6) , td:nth-child(5) , b , td:nth-child(4) , strong'
rankings_2018 = espn %>%
  read_html() %>%
  html_nodes(css=css_tags.2) %>% html_text()
#View(rankings_2018)

rankings_2018 <- rankings_2018[10:length(rankings_2018)]

# 
# my.names = as.numeric(rankings_2018)
# 
# my.starts = which(!is.na(my.names))
# 
# 
# indices <- seq(from = 1, to = length(my.starts), by = 4)

indices <- seq(from = 1, to = length(rankings_2018), by = 8)


clean.data <- data.frame(matrix(ncol = 8, nrow = 0))

colnames(clean.data) <- c("National.Ranking", "Name", "Position",
                          "Hometown.High.School", "Height",
                          "Weight", "Rating", "School")


for(i in 1:c(length(indices)-1)){
  
  start <- indices[i]
  

  
  end <- indices[i+1] - 1
  

    
  
  
  row <- rankings_2018[start:end]
  
  if(!is.na(as.numeric(row[[8]]))){
    
    row[8] <- 'unknown'
    indices[i+1:c(length(indices)-1)] <- indices[i+1:c(length(indices)-1)] - 1
  }

  
  
  
  
  clean.data[i,] <- row
  


}

espn.data <- clean.data


for(i in 1:length(espn.data$Name)){
  
  
lower.player <- tolower(espn.data[i, 'Name'])

lower.player <- gsub(" jr.", "jr", lower.player, fixed = T)
lower.player <- gsub(" sr.", "sr", lower.player, fixed = T)

lower.player <- gsub(" iii", "iii", lower.player, fixed = T)
lower.player <- gsub(" ii", "ii", lower.player, fixed = T)
lower.player <- gsub(" iv", "iv", lower.player, fixed = T)



lower.player <- gsub(".", "", lower.player, fixed = T)

lower.player <- gsub(",iii", "iii", lower.player, fixed = T)
lower.player <- gsub("'", "", lower.player, fixed = T)


first.last <- strsplit(lower.player, ' ')

#print(first.last)

player.id <- paste(first.last[[1]][1:length(first.last[[1]])], collapse = "-")

espn.data[i, 'player.id'] <- player.id
}

espn.data$bball.ref.link = paste("https://www.sports-reference.com/cbb/players/", espn.data$player.id, "-1.html",
                                  sep = "")


rankings.espn <- espn.data


espn.247 <- full_join(rankings.espn, rankings.247, by = "player.id", 
                      suffix = c(".espn", ".247"))

View(espn.247)
  

# if(espn.data[i, 'School'] != 'unknown'){
#   
#   
# 
# player.ref = paste("https://www.sports-reference.com/cbb/players/", player.id, "-1.html",
#                    sep = "")
# 
#   
#   
# if(i > 14){
#   
# 
# biodata <-  wsscraper(player.ref)
# }
# 
# print(biodata)
# }
# 
# 
# }






#poslist <- c("PG", "SG", "CG", "SF", "PF", "C")

