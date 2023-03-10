library(tidyverse)
library(httr2)
library(httr)
library(ggplot2)
library(jsonlite)
library(xml2)


# Authenticate 

library(httr) #replace this with yours


response = POST(
  "https://accounts.spotify.com/api/token",
  accept_json(),
  authenticate(client_ID, client_secret),
  body = list(grant_type = 'client_credentials'),
  encode = 'form',
  verbose()
)

response
mytoken = content(response)$access_token
HeaderValue = paste0("Bearer ", mytoken)


# Spoty API Web 

APIweb = 'https://api.spotify.com/v1/'


# Listas de años: 

tens = '37i9dQZF1DX5Ejj0EkURtP' 
zeros = '37i9dQZF1DX4o1oenSJRJd'
nineties = '37i9dQZF1DXbTxeAdrVG2l' 
eighties = '37i9dQZF1DX4UtSsGT1Sbe'
seventies = '37i9dQZF1DWTJ7xPn4vNaz' 
sixties = '37i9dQZF1DXaKIA8E7WcJj'


# Getting playlist 

playlist_tens = paste0('https://api.spotify.com/v1/playlists/', tens) 
playlist_zeros = paste0('https://api.spotify.com/v1/playlists/', zeros) 
playlist_nineties = paste0('https://api.spotify.com/v1/playlists/', nineties) 
playlist_eighties = paste0('https://api.spotify.com/v1/playlists/', eighties) 
playlist_seventies = paste0('https://api.spotify.com/v1/playlists/', seventies) 
playlist_sixties = paste0('https://api.spotify.com/v1/playlists/', sixties)


# Request for the 60's

req_60 = request(playlist_sixties) %>% 
  req_auth_bearer_token(mytoken) %>% 
  req_perform() %>% 
  resp_body_json(simplifyVector = T)

resp_60_followers = req_60 %>% 
  enframe() %>% 
  filter(name == 'followers') %>% 
  unnest(cols = value) %>% 
  filter(!value == 'NULL') %>% 
  select(-name) %>% 
  rename('followers' = 'value')
  
resp_60_name = req_60 %>% 
  enframe() %>% 
  filter(name == 'name') %>% 
  unnest(cols = value) %>% 
  select(-name) %>% 
  rename('list' = 'value')

binded = cbind(resp_60_name, resp_60_followers)  



# 70s 

req_70 = request(playlist_seventies) %>% 
  req_auth_bearer_token(mytoken) %>% 
  req_perform()

body70 = req_70 %>% 
  resp_body_json() 

followers_70 = body70$followers$total

# 80s 

req_80 = request(playlist_eighties) %>% 
  req_auth_bearer_token(mytoken) %>% 
  req_perform()

body80 = req_80 %>% 
  resp_body_json() 

followers_80 = body80$followers$total

# 90s 

req_90 = request(playlist_nineties) %>% 
  req_auth_bearer_token(mytoken) %>% 
  req_perform()

body90 = req_90 %>% 
  resp_body_json() 

followers_90 = body90$followers$total

# 00s 

req_00 = request(playlist_zeros) %>% 
  req_auth_bearer_token(mytoken) %>% 
  req_perform()

body00 = req_00 %>% 
  resp_body_json() 

followers_00 = body00$followers$total

# 10s 

req_10 = request(playlist_tens) %>% 
  req_auth_bearer_token(mytoken) %>% 
  req_perform()

body10 = req_10 %>% 
  resp_body_json() 

followers_10 = body10$followers$total

# Creating a dataframe 

decades = c("60s", '70s', '80s', '90s', '00s', '10s')
followers = c(followers_60, followers_70, followers_80,
              followers_90, followers_00, followers_90)
df = data.frame(decades, followers)

ggplot(df) +
  aes(decades, followers)+
  geom_col()
