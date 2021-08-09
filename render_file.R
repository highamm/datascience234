library(purrr)
library(rmarkdown)

## render quizzes
files <- list.files("quizzes", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("quizzes/", files), render)

## render checklists
files <- list.files("Checklists", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("Checklists/", files), render)

## render handouts
files <- list.files("handouts", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("handouts/", files), render)

## render about me
files <- list.files("About_Me", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("About_Me/", files), render)

## render participation
files <- list.files("participation_feedback", pattern = "*.Rmd", include.dirs = TRUE)
map(paste0("participation_feedback/", files), render)

