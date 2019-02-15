prep <- c("https://www.prepcircuit.com/stats/league_instance/34558?subseason=245525")


library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(prep)


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


next.tag <- '.paginationElement:nth-child(1) a:nth-child(14)'


score <- remDr$findElement(using = 'css selector', value = next.tag)

score$clickElement()


t2 <- remDr$findElements(using = 'class name', value = team.class)

#t$getElementAttributes('href')

Sys.sleep(time = 4)



odd.players2=c()
odd.players2=sapply(t2, function(x) {x$getElementAttribute('href')})
View(odd.players2)



next.tag <- '.paginationElement:nth-child(1) a:nth-child(14)'


score <- remDr$findElement(using = 'css selector', value = next.tag)

score$clickElement()

#note, when you get to last child listed on initial page, it goes to the end)


t3 <- remDr$findElements(using = 'class name', value = team.class)

#t$getElementAttributes('href')

Sys.sleep(time = 2)



odd.players3=c()
odd.players3=sapply(t3, function(x) {x$getElementAttribute('href')})
View(odd.players3)