#' @title goal_table
#' @description returns dataframe of goals scored and allowed in a given season for each school
#' @param year season
#' @return dataframe
#' @details requires rvest
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname goal_table
#' @export 
goal_table <- function(year){
  
  url <- paste0("http://wosoindependent.com/college/", year, "/?game&recs")
  webpage <- rvest::read_html(url)
  
  datalist <- as.data.frame(rvest::html_text(rvest::html_nodes(webpage, 'td')))
  
  teams.df <- as.data.frame(datalist[-1,])
  
  teams <- teams.df[seq(1, nrow(teams.df), 17), ]
  conf <- teams.df[seq(2,nrow(teams.df),17), ]
  gf <- as.numeric(teams.df[seq(9,nrow(teams.df),17), ])
  ga <- as.numeric(teams.df[seq(10,nrow(teams.df),17), ])
  season <- year
  
  gt <- data.frame(teams, conf, gf, ga, season)
  
  
  return(gt)
}

