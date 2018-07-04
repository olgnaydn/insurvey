# insuRvey: An R package for Instagram Based Surveys/Raffles/Campaigns


As all of us know that most of the companies have started to make some surveys to make people pay attention to their Instagram pages and make them follow their Instagram pages. People can attend these surveys just with adding comments and mentioning their friends to survey related posts. 
insuRvey library has been built to provide solution to Instagram Surveys. The library which has been built by using R,  first of all navigates the url of survey related post, and collects comments, parses comments to detect users who put comments and users who are mentioned. At final step thanks to random sampling techniques, there is a chance to find the lucky person.


presented in whyR2018: http://whyr2018.pl/


# Installation process

To install the package kindly use command below.
If you havent installed devtools yet, please install it before running following command

```
devtools::install_github("olgnaydn/insurvey")
```

To get the users who have been mentioned from the post:

```
get_ment_users(url_of_post)
```


To get the users who mentioned to the post:

```
get_users_ment(url_of_post)
```

To exclude spesific users who mentioned to the post:

```
exclude_users(mentioned_user_df,user_mentioned_df,excluded_users)
```

To select the luckiest user:

```
random_sampling(all_users_new) 
```



Please feel free to write to us and contribute the package.

Let us know, if you have any questions, recommendation related to package

Olgun AYDIN, olgunaydinn@gmail.com , info@olgunaydin.com
