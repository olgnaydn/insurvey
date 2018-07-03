get_ment_users <- function(url_of_post) 
  
{
  #installing libraries
  library(rvest)
  library(stringr)
  library(RSelenium)
  
  #creating null dataframe
  mentioned_username_df<- NULL
  webElem2<-NULL

  #loading drivers and starting selenium
  rD <- rsDriver()
  remDr <- rD[["client"]]

  #navigate survey related url
  remDr$navigate(url_of_post)

  #webElem1 <- remDr$findElement(using = "xpath", "//li[@class='_56pd5']")
  #webElem1$clickElement()

  #collecting mentioned users
  for(j in 2:12)
  {
    webElem2 <- remDr$findElement(using = "xpath",paste("//*[@id='react-root']/section/main/div/div/article/div[2]/div[1]/ul/li[",j,"]/span",sep=""))
    mentioned_username_check<- webElem2$getElementText()[[1]][1]
    
  #checking if there is a mention or not   
     if(str_detect(mentioned_username_check,"@")==TRUE)
    {
      webElem2 <- remDr$findElement(using = "xpath",paste("//*[@id='react-root']/section/main/div/div/article/div[2]/div[1]/ul/li[",j,"]/span/a[1]",sep=""))
      mentioned_username<- webElem2$getElementText()[[1]][1]
    }else{
    mentioned_username<- ""
    }
    mentioned_username_df <- rbind(mentioned_username_df,mentioned_username)
    Sys.sleep(1)
  }

  #stopping selenium
  #rD[["server"]]$stop()
  return(mentioned_username_df)
}
