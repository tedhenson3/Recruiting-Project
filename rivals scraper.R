url <- 'https://n.rivals.com/prospect_rankings/rivals150/2017?position=PG'

rivals.scraper <- function(url){
  
  library(tidyverse)
  library(rvest)
  css_tags <- '#articles .ng-binding.ng-scope'
  stats = url %>%
    read_html() %>%
    html_nodes(css=css_tags) %>% html_text()
  
  
  
  return(stats)
}

rivals.scraper(url)