goal_table <- function(year){
  
  require(rvest)
  
  url <- paste0("http://wosoindependent.com/college/", year, "/?game&recs")
  webpage <- read_html(url)
  
  datalist <- as.data.frame(html_text(html_nodes(webpage, 'td')))
  
  teams.df <- as.data.frame(datalist[-1,])
  
  teams <- teams.df[seq(1, nrow(teams.df), 17), ]
  conf <- teams.df[seq(2,nrow(teams.df),17), ]
  gf <- as.numeric(teams.df[seq(9,nrow(teams.df),17), ])
  ga <- as.numeric(teams.df[seq(10,nrow(teams.df),17), ])
  season <- year
  
  gt <- data.frame(teams, conf, gf, ga, season)
  
  
  return(gt)
}

