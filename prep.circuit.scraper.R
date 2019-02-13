prep <- c("https://www.prepcircuit.com/stats/league_instance/34558?subseason=245525")


library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(prep)

scoring.tag <- '#sm-basketball_scoring a'

next.tag <- '//*[contains(concat( " ", @class, " " ), concat( " ", "paginationElement", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]//a[(((count(preceding-sibling::*) + 1) = 14) and parent::*)]'

player.tag = '//*[contains(concat( " ", @class, " " ), concat( " ", "statPlayer", " " ))]//a'

rebounds.tag <- '#sm-basketball_rebounds a'

misc.tag <- '#sm-basketball_misc a'

score <- remDr$findElement(using = 'css selector', value = scoring.tag)

score$clickElement()

rebounds <- remDr$findElement(using = 'css selector', value = rebounds.tag)

rebounds$clickElement()



misc <- remDr$findElement(using = 'css selector', value = misc.tag)

misc$clickElement()


next.page <- remDr$findElement(using = 'css selector', value = '.pagination')
next.page$clickElement()

library(rMouse)
score$mouseMoveToLocation(x = 0, y = .00001, webElement = score)
score$click(buttonId = 0)


next.page$mouseMoveToLocation(x = 0, y = 0, webElement = next.page)
next.page$click(buttonId = 0)

#resHeaders <- unlist(lapply(test, function(x){x$getElementText()}))
test$clickElement()

t <- remDr$findElements(using = 'xpath', value = player.tag)

players1=list()
players1=sapply(t, function(x){x$getElementText()})
length(players1)
players1[[31]]


#figure out how to page through in a

test$clickElement()


# 
# 
# 
# 
# t <- remDr$findElements(using = 'xpath', value = player.tag)
# 
# players1=list()
# players1=sapply(t, function(x){x$getElementText()})
# length(players1)
# players1[[31]]
# 
# 
# 
# test <- remDr$findElement(using = 'css selector', value = next.tag)
# test$clickElement()
# 
# t <- remDr$findElements(using = 'xpath', value = player.tag)
# 
# players2=list()
# players2=sapply(t, function(x){x$getElementText()})
# length(players2)
# players2[[1]]
# 
# test <- remDr$findElement(using = 'css selector', value = next.tag)
# test$clickElement()
# 
# t <- remDr$findElements(using = 'xpath', value = player.tag)
# 
# players3=list()
# players3=sapply(t, function(x){x$getElementText()})
# length(players3)
# players3[[1]]
# 
