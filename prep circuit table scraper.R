

# t <- remDr$findElements(using = 'xpath', value = player.tag)
# 
# players1=list()
# players1=sapply(t, function(x){x$getElementText()})
# head(players1)


library(rvest)


#prep.circuit <- 'https://www.prepcircuit.com/stats/league_instance/58521?subseason=412391'

prep <- c("https://www.prepcircuit.com/stats/league_instance/34558?subseason=245525")


library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(prep)


# table.tag <- 'td , #player-sm-basketball_scoring-table a , .ajax_sort'
# 
# 
# player.tag <- '.statPlayer a'

next.tag <- '.paginationElement:nth-child(1) a:nth-child(14)'
# 
# roster.tag <- 'roster_players'
# 
# 
# class.name <- 'statPlayer '

team.tag <- '.teamName'




t <- remDr$findElements(using = 'css selector', value = team.tag)

players1=c()
players1=sapply(t, function(x){x$getElementText()})
teams <- c(players1)


score <- remDr$findElement(using = 'css selector', value = next.tag)

score$clickElement()


t <- remDr$findElements(using = 'css selector', value = team.tag)

players1=c()
players1=sapply(t, function(x){x$getElementText()})
teams2 <- c(players1)


players1=c()
players1=sapply(t, function(x){x$getElementText()})
teams <- c(players1)





t <- remDr$findElements(using = 'css selector', value = table.tag)

players1=c()
players1=sapply(t, function(x){x$getElementText()})
teams2 <- c(players1)
teams2



table.tag <- '#player-sm-basketball_player-table a'

team.class <- 'teamName'
# 

#?remDr$executeScript
# player.class <- 'even'
# 


odd.tag <- "odd"
t <- remDr$findElements(using = 'class name', value = team.class)

#t$getElementAttributes('href')


odd.players=c()
odd.players=sapply(t, function(x) {x$getElementAttribute('href')})
View(odd.players)