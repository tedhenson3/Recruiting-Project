maxpreps <- c("http://www.maxpreps.com/leaders/basketball-winter-16-17/,scoring/california/stat-leaders.htm?classyear=all&position=all")


#http://www.maxpreps.com/leaders/basketball-winter-16-17/,scoring/stat-leaders-10.htm?classyear=all&position=all
#each page only goes to 10 no matter what

#state.list <- c("california", "georgia", "alabama", ....)



library(tidyverse)
library(rvest)





stats = maxpreps %>%
  read_html() %>%
  html_table()

high.school <- as.data.frame(stats[[1]])

split <- strsplit(high.school$Name, ' - ')

for(i in 1:length(split)){
  
  
 high.school[i, 'Name'] <-  split[[i]][1]
 substring_list <- c("Sr", "Jr", "So", "Fr")
 junk <- split[[i]][2]
 j <- 1
while(j < 5){
  
  
  new.junk <- strsplit(junk, substring_list[j])
  
  if(length(new.junk[[1]]) == 2){
    
    high.school[i, 'Class'] <- substring_list[j]
    
    high.school[i, 'High.School'] <- new.junk[[1]][2]
    
    j <- 5
  }
  
  if(length(new.junk[[1]]) == 1){
 
  j <- j + 1
}
 
}
}
 View(high.school)
