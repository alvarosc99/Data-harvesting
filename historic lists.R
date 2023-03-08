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

playlist_tens = paste0('https://api.spotify.com/v1/playlist/', tens) 

playlist_zeros = paste0('https://api.spotify.com/v1/playlist/', zeros) 

playlist_nineties = paste0('https://api.spotify.com/v1/playlist/', nineties) 

playlist_eighties = paste0('https://api.spotify.com/v1/playlist/', eighties) 

playlist_seventies = paste0('https://api.spotify.com/v1/playlist/', seventies) 

playlist_sixties = paste0('https://api.spotify.com/v1/playlist/', sixties)
