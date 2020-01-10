library(rvest)
library(tidyverse)
library(robotstxt)

robotstxt::paths_allowed("https://www.worldsurfleague.com/athletes/tour/wct")
webpage <- read_html("https://www.worldsurfleague.com/athletes/tour/wct")

names <- webpage %>%
  html_nodes(".athlete-name") %>%
  html_text() %>% 
  as.data.frame()

country <- webpage %>%
  html_nodes(".athlete-country-name") %>%
  html_text() %>%  
  as.data.frame()

earnings <- webpage %>%
  html_nodes(".athlete-prize-money") %>%
  html_text() %>% 
  gsub(pattern="\\$", replacement = "") %>%
  gsub(pattern="\\,", replacement = "") %>% 
  as.numeric() %>%
  na.omit() %>% 
  as.data.frame()

data <- names %>% 
  cbind(., country) %>% 
  cbind(., earnings) %>% 
  rowid_to_column("ranking") %>% 
  magrittr::set_colnames(c("ranking", "name", "country", "earnings"))


