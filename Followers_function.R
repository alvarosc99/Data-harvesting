# Listas de años: 

tens <-  "37i9dQZF1DX5Ejj0EkURtP" 
zeros <- "37i9dQZF1DX4o1oenSJRJd"
nineties <-  "37i9dQZF1DXbTxeAdrVG2l" 
eighties <-  "37i9dQZF1DX4UtSsGT1Sbe"
seventies <- "37i9dQZF1DWTJ7xPn4vNaz" 
sixties <- "37i9dQZF1DXaKIA8E7WcJj"

# Playlists 

API_playlist = "https://api.spotify.com/v1/playlists/"
years = c(sixties, seventies, eighties, nineties, zeros, tens)

# The function 


followers = function(x) { 
  rt_spotify = paste0(API_playlist, x)
  
  resp_output = 
    rt_spotify %>% 
    request() %>% 
    req_auth_bearer_token(mytoken) %>% 
    req_perform() %>% 
    resp_body_json()
  
  resp_followers = 
    resp_output %>% 
    enframe() %>% 
    filter(name == "followers") %>% 
    unnest(cols = value) %>% 
    filter(!value == "NULL") %>% 
    select(-name) %>% 
    rename("followers" = "value")
  
  resp_name = resp_output %>% 
    enframe() %>% 
    filter(name == "name") %>% 
    unnest(cols = value) %>% 
    select(-name) %>% 
    rename("playlist" = "value")
    
  df = cbind(resp_name, resp_followers)
  }


followers_list = lapply(years, followers) 

followers_df = do.call(rbind, followers_list) %>% 
  transmute(
    playlist = as.character(list), 
    followers = as.numeric(followers)
  ) 

hp = ggplot(followers_df)+
  aes(playlist, followers)+
  geom_col()

hp






























































































