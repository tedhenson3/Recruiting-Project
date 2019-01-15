base.player <- c("https://www.sports-reference.com/cbb/players/trevon-duval-1.html")

for(i in 1:length(clean.data$Name)){
  
  player <- clean.data[i, 'Name']
  
  lower.player <- tolower(player)
  
  lower.player <- gsub(" jr.", "jr", lower.player, fixed = T)
  lower.player <- gsub(" sr.", "sr", lower.player, fixed = T)
  
  lower.player <- gsub(" iii", "iii", lower.player, fixed = T)
  lower.player <- gsub(" ii", "ii", lower.player, fixed = T)
  lower.player <- gsub(" iv", "iv", lower.player, fixed = T)
  
  
  lower.player <- gsub(".", "", lower.player, fixed = T)
  first.last <- strsplit(lower.player, ' ')
  
  #print(first.last)
  
  player.id <- paste(first.last[[1]][1:length(first.last[[1]])], collapse = "-")
  #print(player.id)
  #print(lower.player)
  
  
  player.ref = paste("https://www.sports-reference.com/cbb/players/", player.id, "-1.html",
                     sep = "")
  
  
  # test = readLines(player.ref)
  # 
  
  
 biodata <-  wsscraper(player.ref)
 
 print(biodata)
  
  
  
  
}


