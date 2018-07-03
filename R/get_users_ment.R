get_users_ment <- function(url_of_post) 
  
  {
  
  #loading required libraries
  library(rvest)
  library(stringr)
  library(RSelenium)
  
  #creating dataframes
  username_mentioned_df<- NULL

  #loading selenium drivers and starting selenium
  rD <- rsDriver()
  remDr <- rD[["client"]]

  #navigating survey related url
  remDr$navigate(url_of_post)

  #inspecting comments of the post
  #webElem1 <- remDr$findElement(using = "xpath", "//li[@class='_56pd5']")
  #webElem1$clickElement()

  #collecting mentioned usernames   
  for(j in 2:12)
  {
    webElem2 <- remDr$findElement(using = "xpath",paste("//*[@id='react-root']/section/main/div/div/article/div[2]/div[1]/ul/li[",j,"]/a",sep=""))
    Sys.sleep(1)
    username_mentioned<- webElem2$getElementText()[[1]][1]
    username_mentioned_df <- rbind(username_mentioned_df,username_mentioned)
  }
  
#stopping selenium
#rD[["server"]]$stop()


return(username_mentioned_df)

}
