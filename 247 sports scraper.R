

# url_247 <- c("https://247sports.com/Season/2018-Football/CompositeCompositeRecruitRankings/?InstitutionGroup=highschool")
# 
# 
# library(tidyverse)
# library(rvest)
# rankings_2018 = url_247 %>%
#   read_html() %>%
#   html_nodes(css=".primary , .metrics , .score , 
# .hw , .position , .pos , 
# .rankings-page__list-item--header
#              .rank , .name , 
#              .rankings-page__name-link") %>% html_text()
# 
# clean.data <- data.frame(col1 = 0, col2 = 0, col3 = 0, col4 = 0, col5 = 0)
# 
# colnames(clean.data) <- rankings_2018[1:5]
# 
# 
# rankings_2018 <- rankings_2018[6:length(rankings_2018)]




pg_url_247 <- c("https://247sports.com/Season/2017-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool&Position=PG")


library(tidyverse)
library(rvest)

css_tags <- '.score , .other , .position , .rank , .sttrank , .posrank , .natrank , .hw , .rankings-page__name-link , .meta , .metrics , .pos , .name'
rankings_2018 = pg_url_247 %>%
  read_html() %>%
  html_nodes(css=css_tags) %>% html_text()

#View(rankings_2018)

#mycolnames <- rankings_2018[1:5]


rankings_2018 <- rankings_2018[6:length(rankings_2018)]
View(rankings_2018)


indices <- seq(from = 1, to = length(rankings_2018), by = 10)



clean.data <- data.frame(matrix(ncol = 10, nrow = 0))


for(i in 1:c(length(indices)-1)){
  
  start <- indices[i]
  

  end <- indices[i+1] - 1

  row <- rankings_2018[start:end]
  
  
  
  clean.data[i,] <- row
  
}


colnames(clean.data) <- c("Previous.Nartional.Ranking", "Name", "Hometown", "Position", 
                          "Height.Weight", "Rating", "All Ratings", "National.Ranking",
                          "Position.Ranking", "State.Ranking")

View(clean.data)


poslist <- c("PG", "SG", "CG", "SF", "PF", "C")


#colnames(clean.data) <- mycolnames

#pg.clean.data <- clean.data[-c(1),]





#View(clean.data)


# pg_url_247 <- c("https://247sports.com/Season/2018-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool&Position=SG")
# 
# 
# library(tidyverse)
# library(rvest)
# rankings_2018 = pg_url_247 %>%
#   read_html() %>%
#   html_nodes(css=".primary , .metrics , .score , 
#              .hw , .position , .pos , 
#              .rankings-page__list-item--header
#              .rank , .name , 
#              .rankings-page__name-link") %>% html_text()
# 
# 
# mycolnames <- rankings_2018[1:5]
# 
# 
# rankings_2018 <- rankings_2018[6:length(rankings_2018)]
# 
# 
# 
# indices <- seq(from = 1, to = length(rankings_2018), by = 5)
# 
# 
# 
# clean.data <- data.frame(col1 = 0, col2 = 0, col3 = 0, col4 = 0, col5 = 0)
# 
# for(i in 1:c(length(indices)-1)){
#   
#   start <- indices[i]
#   
#   end <- indices[i+1] - 1
#   
#   row <- rankings_2018[start:end]
#   
#   print(row)
#   
#   clean.data <- rbind(clean.data, row)
#   
# }
# 
# colnames(clean.data) <- mycolnames
# 
# sg.clean.data <- clean.data[-c(1),]
# 
# View(sg.clean.data)
# 
# 
# 
# pg_url_247 <- c("https://247sports.com/Season/2018-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool&Position=SF")
# 
# 
# library(tidyverse)
# library(rvest)
# rankings_2018 = pg_url_247 %>%
#   read_html() %>%
#   html_nodes(css=".primary , .metrics , .score , 
#              .hw , .position , .pos , 
#              .rankings-page__list-item--header
#              .rank , .name , 
#              .rankings-page__name-link") %>% html_text()
# 
# 
# mycolnames <- rankings_2018[1:5]
# 
# 
# rankings_2018 <- rankings_2018[6:length(rankings_2018)]
# 
# 
# 
# indices <- seq(from = 1, to = length(rankings_2018), by = 5)
# 
# 
# 
# clean.data <- data.frame(col1 = 0, col2 = 0, col3 = 0, col4 = 0, col5 = 0)
# 
# for(i in 1:c(length(indices)-1)){
#   
#   start <- indices[i]
#   
#   end <- indices[i+1] - 1
#   
#   row <- rankings_2018[start:end]
#   
#   print(row)
#   
#   clean.data <- rbind(clean.data, row)
#   
# }
# 
# colnames(clean.data) <- mycolnames
# 
# sf.clean.data <- clean.data[-c(1),]
# 
# View(sf.clean.data)
# 
# 
# 
# pg_url_247 <- c("https://247sports.com/Season/2018-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool&Position=CG")
# 
# 
# library(tidyverse)
# library(rvest)
# rankings_2018 = pg_url_247 %>%
#   read_html() %>%
#   html_nodes(css=".primary , .metrics , .score , 
#              .hw , .position , .pos , 
#              .rankings-page__list-item--header
#              .rank , .name , 
#              .rankings-page__name-link") %>% html_text()
# 
# 
# mycolnames <- rankings_2018[1:5]
# 
# 
# rankings_2018 <- rankings_2018[6:length(rankings_2018)]
# 
# 
# 
# indices <- seq(from = 1, to = length(rankings_2018), by = 5)
# 
# 
# 
# clean.data <- data.frame(col1 = 0, col2 = 0, col3 = 0, col4 = 0, col5 = 0)
# 
# for(i in 1:c(length(indices)-1)){
#   
#   start <- indices[i]
#   
#   end <- indices[i+1] - 1
#   
#   row <- rankings_2018[start:end]
#   
#   print(row)
#   
#   clean.data <- rbind(clean.data, row)
#   
# }
# 
# colnames(clean.data) <- mycolnames
# 
# cg.clean.data <- clean.data[-c(1),]
# 
# View(cg.clean.data)
# 
# 
# pg_url_247 <- c("https://247sports.com/Season/2018-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool&Position=PF")
# 
# 
# library(tidyverse)
# library(rvest)
# rankings_2018 = pg_url_247 %>%
#   read_html() %>%
#   html_nodes(css=".primary , .metrics , .score , 
#              .hw , .position , .pos , 
#              .rankings-page__list-item--header
#              .rank , .name , 
#              .rankings-page__name-link") %>% html_text()
# 
# 
# mycolnames <- rankings_2018[1:5]
# 
# 
# rankings_2018 <- rankings_2018[6:length(rankings_2018)]
# 
# 
# 
# indices <- seq(from = 1, to = length(rankings_2018), by = 5)
# 
# 
# 
# clean.data <- data.frame(col1 = 0, col2 = 0, col3 = 0, col4 = 0, col5 = 0)
# 
# for(i in 1:c(length(indices)-1)){
#   
#   start <- indices[i]
#   
#   end <- indices[i+1] - 1
#   
#   row <- rankings_2018[start:end]
#   
#   print(row)
#   
#   clean.data <- rbind(clean.data, row)
#   
# }
# 
# colnames(clean.data) <- mycolnames
# 
# pf.clean.data <- clean.data[-c(1),]
# 
# View(pf.clean.data)
# 
# pg_url_247 <- c("https://247sports.com/Season/2018-Basketball/CompositeRecruitRankings/?InstitutionGroup=highschool&Position=C")
# 
# 
# library(tidyverse)
# library(rvest)
# rankings_2018 = pg_url_247 %>%
#   read_html() %>%
#   html_nodes(css=".primary , .metrics , .score , 
#              .hw , .position , .pos , 
#              .rankings-page__list-item--header
#              .rank , .name , 
#              .rankings-page__name-link") %>% html_text()
# 
# 
# mycolnames <- rankings_2018[1:5]
# 
# 
# rankings_2018 <- rankings_2018[6:length(rankings_2018)]
# 
# 
# 
# indices <- seq(from = 1, to = length(rankings_2018), by = 5)
# 
# 
# 
# clean.data <- data.frame(col1 = 0, col2 = 0, col3 = 0, col4 = 0, col5 = 0)
# 
# for(i in 1:c(length(indices)-1)){
#   
#   start <- indices[i]
#   
#   end <- indices[i+1] - 1
#   
#   row <- rankings_2018[start:end]
#   
#   print(row)
#   
#   clean.data <- rbind(clean.data, row)
#   
# }
# 
# colnames(clean.data) <- mycolnames
# 
# c.clean.data <- clean.data[-c(1),]
# 
# View(c.clean.data)

