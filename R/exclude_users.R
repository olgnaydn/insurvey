exclude_users<- function(mentioned_user_df,user_mentioned_df,excluded_users)

{  
  #creating data frame with using user mentioned and mentioned user dfs.
  all_users<- data.frame(mentioned_user_df,user_mentioned_df)
  
  #excluding the users from the final df
  all_users_new <- all_users[- grep(excluded_users, all_users$user_mentioned_df),]

  return(all_users_new)
}