

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


table.tag <- 'td , #player-sm-basketball_scoring-table a , .ajax_sort'


player.tag <- '.statPlayer a'

t <- remDr$findElements(using = 'css selector', value = player.tag)

players1=list()
players1=sapply(t, function(x){x$getElementText()})
length(players1)
View(players1)