library(purrr)
library(rmarkdown)

## render quizzes
files <- list.files("quizzes", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("quizzes/", files), render)

## render checklists
files <- list.files("checklists", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("checklists/", files), render)

## render handouts
files <- list.files("handouts", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("handouts/", files), render)

## render about me
files <- list.files("About_Me", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("About_Me/", files), render)

## render participation
files <- list.files("participation_feedback", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("participation_feedback/", files), render)

## render projects
files <- list.files("Projects/MP1_F2021", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("Projects/MP1_F2021/", files), render)
files <- list.files("Projects/MP2_F2021", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("Projects/MP2_F2021/", files), render)
files <- list.files("Projects/MP3_F2021", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("Projects/MP3_F2021/", files), render)

## render presentations
files <- list.files("Projects/MP_Presentations", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("Projects/MP_Presentations/", files), render)

## render midterms
files <- list.files("midterms/Midterm1/Fall_2020", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("midterms/Midterm1/Fall_2020/", files), render)
files <- list.files("midterms/Midterm1/Fall_2021", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("midterms/Midterm1/Fall_2021/", files), render)
files <- list.files("midterms/Midterm1/Practice_StudyGuide", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("midterms/Midterm1/Practice_StudyGuide/", files), render)
