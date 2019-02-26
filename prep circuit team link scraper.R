prep.15.16 <- c("https://www.prepcircuit.com/stats/league_instance/34558?subseason=245525")

prep <- c("https://www.prepcircuit.com/stats/league_instance/47994?subseason=336137")


library(RSelenium)
rD <- rsDriver(browser = 'firefox')
remDr <- rD[["client"]]

remDr$navigate(prep)


team.class <- 'teamName'


next.class  <- '.paginationElement:nth-child(1) .current+ a'


prep.teams <- data.frame(link = c(0))

i <- 1
while(i < 31){

if(i > 1){
  
  

score <- remDr$findElement(using = 'css selector', value = next.class)

score$clickElement()


Sys.sleep(time = 2)

}

t2 <- remDr$findElements(using = 'class name', value = team.class)

#t$getElementAttributes('href')

#Sys.sleep(time = 4)


odd.players2=c()
odd.players2=sapply(t2, function(x) {x$getElementAttribute('href')})

new.teams <- odd.players2[which(odd.players2 != "")]


new.teams <- do.call( rbind, new.teams)[,1]

if(i == 1){
  
  all.teams <- new.teams
}


else{
  
  all.teams <- c(new.teams, all.teams)
}


i = i + 1



}


unique.teams <- unique(all.teams)


write.csv(unique.teams, file = 'prep.circuit.teams.16-17.csv', row.names = F)
