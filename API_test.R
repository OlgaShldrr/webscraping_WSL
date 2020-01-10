#' Send information about the person with a specific rank in World Surf League tour
#' @param rank The rank of the person to have information
#' @get /WSL_rank

function(rank=""){
  source("WSL_webscraping.R")
  list(msg = paste0("Here are some up-to-date stats about World Surf League Women's Championship Tour's rank #", rank,": ", "name: ", data[data$ranking==rank,]$name, "; earnings: $", data[data$ranking==rank,]$earnings, "; represents: ", data[data$ranking==rank,]$country))
}



