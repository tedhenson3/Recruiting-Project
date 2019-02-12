prep <- c("https://www.prepcircuit.com/stats/league_instance/34558?subseason=245525")





library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(prep)



# t <- remDr$findElements(using = 'css selector', value = css.tags)
# 
# players=list()
# players=sapply(t, function(x){x$getElementText()})
# head(players)

next.tag <- 'a:nth-child(14)'

scoring.tag <- '#sm-basketball_scoring a'

test <- remDr$findElement(using = 'css selector', value = scoring.tag)
#resHeaders <- unlist(lapply(test, function(x){x$getElementText()}))
test$clickElement()


css.tags <- "td , #player-sm-basketball_scoring-table a , .ajax_sort"

css.tags <- ".NginTableScroll , td , #player-sm-basketball_scoring-table a"

x.path = '//*[contains(concat( " ", @class, " " ), concat( " ", "statPlayer", " " ))]//a'

t <- remDr$findElements(using = 'xpath', value = x.path)

players2=list()
players2=sapply(t, function(x){x$getElementText()})
length(players2)

next.tag <- '.current+ a'


test <- remDr$findElement(using = 'css selector', value = next.tag)
#resHeaders <- unlist(lapply(test, function(x){x$getElementText()}))
test$clickElement()



x.path = '//*[contains(concat( " ", @class, " " ), concat( " ", "statPlayer", " " ))]//a'

t <- remDr$findElements(using = 'xpath', value = x.path)

players2=list()
players2=sapply(t, function(x){x$getElementText()})
length(players2)



test <- remDr$findElement(using = 'css selector', value = next.tag)
#resHeaders <- unlist(lapply(test, function(x){x$getElementText()}))
test$clickElement()



x.path = '//*[contains(concat( " ", @class, " " ), concat( " ", "statPlayer", " " ))]//a'

t <- remDr$findElements(using = 'xpath', value = x.path)

players2=list()
players2=sapply(t, function(x){x$getElementText()})
players[[1]]


