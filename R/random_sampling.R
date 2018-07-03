random_sampling <- function(all_users_new) 
  
  {
  #applying random sampling
  n <- dim(all_users_new[1])
  selected_number<- sample(1:n[1],1,replace=T)

  #selecting lucky users
  selected_users_commented <- as.matrix(all_users_new$user_mentioned_df[selected_number])
  selected_users_tagged<- as.matrix(all_users_new$mentioned_user_df[selected_number])
  selected_users <- as.matrix(all_users_new[selected_number,])
  
  return(selected_users)
  }
