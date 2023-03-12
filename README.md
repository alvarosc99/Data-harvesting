# Final Project: Insert title 

## Spotify API 

### Obtaining the credentials. 

The first necessary conditions for obtaining the credentials for using the Spotify Web API is having a valid account for the [application](https://www.spotify.com). 

As a next step, we need to register an app in the [Spotify API](https://developer.spotify.com/). The API is called Spotify for Developers. There, we should go to the _dashboard_ tab, at the bottom of the screen. Once in the dashboard, we login  in with our Spotify Account and we click in the _create and app_ button. For a valid app, only a name and a description is necessary. This app serves as the monitor for the future request (un poco triple para explicar para que sirve). 

The most important things to consider about the app is the _client ID_ and the _client secret_. These two are the credentials needed to obtain the OAth 2.0 token. Again, in the dashboard tab, we find the Client ID at the left of the screen; below the name and the description. In order to see the secret, we have to click in _show client secret_. Finally, the token is obtained via a POST request to the API itself (detailed in the FinalRMD). Thus, the process can be summarised in: 

- Creating an account in Spotify
- Registering an app in Spotify for Developers 
- Obtaining the Client ID and Client secret.
- Post request to the API for the token. 
- Enjoy.  




















