

setwd("C:/Users/tedhe/Onedrive/Documents/recruiting project")
thing <- c("https://www.sports-reference.com/cbb/players/gary-trentjr-1.html")

#notes on weird player tags for sports reference url#
#1 Marvin Bagley III = marvin-bagleyiii-1
#2 Gary Trent Jr. = gary-trentjr-1
#3 M.J. Walker = mj-walker-1
#4 Silvio De Sousa = silvio-desousa-1
#5 Shai Gilgeous-Alexander = shai-gilgeous-alexander-1
#6 Nickeil Alexander-Walker = nickeil-alexander-walker-1


wsscraper <- function(url){
  print(url)
  library(tidyverse)
  library(rvest)
  
  link <- try(readLines(url))
  if(class(link) == "try-error"){
    
    player.ref <- gsub('-1.html', '-2.html', url)
    
      
  }
  
  else{
    
    player.ref <- url
    
  }
  

  css_tags <- 'p , h1'
  stats = player.ref %>%
    read_html() %>%
    html_nodes(css=css_tags) %>% html_text()
  print(stats)
  
  # if(is.na(bio.end)){
  #   
  #   url <- gsub('-1.html', '-2.html', url)
  #   stats = url %>%
  #     read_html() %>%
  #     html_nodes(css=css_tags) %>% html_text()
  #   
  #   print(stats)
  #   
  #   end <- grepl('School:', stats)
  #   
  #   real.end <- which(end == T)
  #   bio.end <- real.end[2]
  #   
  # }
  
  print(stats)
  
end <- grepl('School:', stats)

real.end <- which(end == T)
bio.end <- real.end[2]
if(!is.na(bio.end)){
  
  



}

else{
  
  url <- gsub('-1', 'jr-1', url)

  stats = url %>%
    read_html() %>%
    html_nodes(css=css_tags) %>% html_text()
  
  print(stats)
  
  end <- grepl('School:', stats)
  
  real.end <- which(end == T)
  bio.end <- real.end[2]
  
  
}



bio <- stats[1:bio.end]

#View(bio)

bio <- gsub("\n", "", bio, fixed = T)


end <- grepl('Position:', bio)

real. <- which(end == T)
bio.end <- real.end[2]

player.data <- data.frame("Name" = bio[1], "Position" = bio[2], "Height.Weight" = bio[3],
                 "Hometown" = bio[4], "High.School" = bio[5],
                 "College" = bio[length(bio)])

player.data$Position = gsub("Position:", "", player.data$Position)
player.data$Hometown = gsub("Hometown:", "", player.data$Hometown)
player.data$High.School = gsub("High School:", "", player.data$High.School)

player.data$College = gsub("School:", "", player.data$College)
#player.data$RSCI.Rating = gsub("School:", "", player.data$College)


return(player.data)

}
data <- wsscraper(thing)

print(data)