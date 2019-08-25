library(rtweet)
library(dplyr)
library(ggplot2)
library(stringr)

rtweet::search_tweets(q="panelaço", include_rts = FALSE,  type = "mixed",)

tweets <- search_tweets(q="#panelaço", n = 50000, include_rts = FALSE,  type = "mixed",retryonratelimit = TRUE)

tweets_panelaco<- tweets

glimpse(tweets)

tweets_rondonia <- search_tweets(q="#PrayForRondonia", n = 18000, include_rts = FALSE,  type = "mixed",retryonratelimit = TRUE)

NROW(unique(tweets_rondonia$user_id))

NROW(tweets_rondonia[!is.na(tweets_rondonia$media_url),])     


tweets_panelaco<- tweets_orig

2019-08-04
tweets_rondonia%>%
  ggplot() +
  geom_bar(aes(x=str_sub(created_at,1,10)))+
  theme_light()
  
  
  group_by(str_sub(created_at,1,10)) %>%
  summarise(
    contagem = n()
  ) 
  
  rtweet::save_as_csv(tweets_panelaco,file_name = "Data/tweets_panelaco.csv")
  
  rtweet::save_as_csv(tweets_rondonia,file_name = "Data/tweets_rondonia.csv")
             