library(magrittr)
library(purrr)
files <- list.files()
files %<>% .[grepl(.,pattern = ".Rmd")]
walk(files, rmarkdown::render)
