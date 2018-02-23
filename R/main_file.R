

get <- function() {
  library(rvest)
  library(stringr)
  library(RSelenium)
  uname_bio_df <- NULL
  username_commented_df<- NULL
  username_tagged_df <- NULL

  rD <- rsDriver()
  remDr <- rD[["client"]]


  remDr$navigate("https://www.instagram.com/p/BY8VHzVhc6Z/?taken-by=kolayfit")

  webElem1 <- remDr$findElement(using = "xpath", "//li[@class='_56pd5']")
  webElem1$clickElement()


  for(i in 2:77)
  {
    webElem2 <- remDr$findElement(using = "xpath",paste("//*[@id='react-root']/section/main/div/div/article/div[2]/div[1]/ul/li[",i,"]/a",sep=""))
    Sys.sleep(1)
    username_commented <- webElem2$getElementText()[[1]][1]
    username_commented_df <- rbind(username_commented_df,username_commented)
  }

  for(j in 2:77)
  {
    webElem3 <- remDr$findElement(using = "xpath",paste("//*[@id='react-root']/section/main/div/div/article/div[2]/div[1]/ul/li[",j,"]/span/a",sep=""))
    Sys.sleep(1)
    username_tagged<- webElem3$getElementText()[[1]][1]
    username_tagged_df <- rbind(username_tagged_df,username_tagged)
  }

  all_users <- data.frame(username_commented_df,username_tagged_df)

  all_users_new <- all_users[- grep("karatekeserkan", all_users$username_commented_df),]
  all_users_new <- all_users_new[- grep("karatekeserkan", all_users$username_tagged_df),]

  n <- dim(all_users_new[1])
  selected_number<- sample(1:n[1],1,replace=T)


  selected_users_commented <- as.matrix(all_users_new$username_commented_df[selected_number])
  selected_users_tagged<- as.matrix(all_users_new$username_tagged_df[selected_number])
  selected_users <- as.matrix(all_users_new[selected_number,])


  rD[["server"]]$stop()




}
