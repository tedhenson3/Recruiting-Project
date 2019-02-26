
library(rvest)
library(tidyverse)

library(readr)
setwd("~/analytics/recruiting project")
preps = read_csv(file = 'prep.circuit.teams.16-17.csv')
preps = preps$x
for(i in 1:length(preps)){
  img.actual = preps[i]
  
  
  print(i / 127 * 100)

#img.actual <- 'https://www.prepcircuit.com/page/show/2126352?subseason=245525&tab=content'
stats = img.actual %>%
  readLines()

test = grep('remote-tool-tab', stats)

if(length(test) != 0){
  
  



new.stats = stats[test]
player.stat.link <- grep('Player Stats', new.stats)
player.stats <- new.stats[player.stat.link]


player.stats = strsplit(player.stats, 'href=\"')



player.stats = player.stats[[1]][2]

player.stats = strsplit(player.stats, '\"')

player.stats = player.stats[[1]][1]


player.stats = gsub("&amp;", "&", player.stats, fixed = T)

player.stats = paste('https://www.prepcircuit.com', player.stats, sep = '')

team.stat.tables = player.stats %>% 
  read_html() %>%       html_table()




for(e in 1:length(team.stat.tables)){
  
  colnames(team.stat.tables[[e]])[colnames(team.stat.tables[[e]]) == 'GP'] <-  paste('gp', e, sep = '.')
  if(e == 1){
    
    finish = team.stat.tables[[e]]
    

  }
  else{
    
    
  
other.table = team.stat.tables[[e]]




other.table = other.table[,2:ncol(other.table)]


  finish = full_join(x = finish, y = other.table,
                     by = 'Name')
  
  #print(finish)
  }
  
 
  
}
if(exists("players") == T){
  
  ted = finish
  #print(ted)
  #ted = as.data.frame(team.stat.tables[[1]])
  library(plyr)
  players = rbind.fill(players, ted)
  #View(players)
  #print(players)
  
}

else{
  
  

players = finish
#players = as.data.frame(team.stat.tables[[1]])


}


}

}





write.csv(players, file = 'prep.circuit.players.stats.16-17.csv', row.names = FALSE)

