API_playlist = 'https://api.spotify.com/v1/playlists/'
years = c(sixties, seventies, eighties, nineties, zeros, tens)

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
    filter(name == 'followers') %>% 
    unnest(cols = value) %>% 
    filter(!value == 'NULL') %>% 
    select(-name) %>% 
    rename('followers' = 'value')
  
  resp_name = resp_output %>% 
    enframe() %>% 
    filter(name == 'name') %>% 
    unnest(cols = value) %>% 
    select(-name) %>% 
    rename('list' = 'value')
    
  df = cbind(resp_name, resp_followers)
  }


df_followers = lapply(years, followers) 


df = as.data.frame(df_followers)
































































































