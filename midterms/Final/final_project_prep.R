## maybe have another test set be artists that aren't the 5 
## original artists and then see how their algorithm classifies
## each song.

devtools::install_github('charlie86/spotifyr')
library(spotifyr)

Sys.setenv(SPOTIFY_CLIENT_ID = '3f628be65fbf4592a340ceab1d145268')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '450eee5474464d66b5b9d686b2f0b707')

access_token <- get_spotify_access_token()
killers <- get_artist_audio_features('the killers')
library(tidyverse)

test <- get_artist_audio_features('luke combs')
test2 <- get_artist_audio_features('queen')
test3 <- get_artist_audio_features('BTS')
test4 <- get_artist_audio_features('Vampire Weekend')
test5 <- get_artist_audio_features('Lana Del Rey')
test6 <- get_artist_audio_features('bleachers')
test7 <- get_artist_audio_features('Post Malone')

song10 <- test7 %>% filter(track_name == "Circles") %>% slice(1)
song9 <- test6 %>% filter(track_name == "Don't Take The Money")
song8 <- test5 %>% filter(track_name == "Video Games - Remastered") %>%
  slice(1)

song7 <- test4 %>% filter(track_name == "Campus") %>% slice(1)
song6 <- test3 %>% filter(track_name == "Dynamite")

song5 <- test2 %>% filter(track_name == "We Are The Champions") %>% slice(1)

song4 <- test %>% filter(track_name == "Beer Never Broke My Heart") %>% slice(1)
song1 <- killers %>% filter(track_name == "Mr. Brightside") %>% slice(1)
song2 <- lady_gaga %>% filter(track_name == "Bad Romance") %>% slice(1)
song3 <- drake %>% filter(track_name == "Toosie Slide") %>% slice(1)

newsongs_df <- bind_rows(song1, song2, song3, song4, song5, song6, song7, song8,
          song9, song10) %>% select(-c(album_images,
                                       available_markets,
                                       artists))
write.csv(newsongs_df, "new_artists.csv", row.names = FALSE)



lady_gaga <- get_artist_audio_features('lady gaga')
tswift <- get_artist_audio_features('taylor swift')
beyonce <- get_artist_audio_features('beyonce')
drake <- get_artist_audio_features('drake')

View(lady_gaga)
## has duplicates and dialogue
View(tswift)
## has karaoke version and commentary version that should be removed
View(beyonce)
## has live 
View(killers)
## has live
View(drake)
## has explicit and non-explicit versions (which ones to keep)?
all_songs <- bind_rows(lady_gaga, tswift, beyonce, killers, drake)
all_songs <- all_songs %>% select(-c(album_images, artists))
all_songs <- all_songs %>% select(-available_markets)
write.csv(all_songs, "all_songs.csv", row.names = FALSE)
