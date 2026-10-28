library(rvest)

wc_wiki <- "https://en.wikipedia.org/wiki/World%27s_fair#List_of_expositions" |>
  read_html() |>
  html_nodes("table")

library(purrr)
library(dplyr)

wf_data_expos <- wc_wiki |>
  purrr::pluck(1) |>
  html_table() |>
  mutate(ExpoType = "World Expo")

wf_data_exposspecial <- wc_wiki |>
  purrr::pluck(2) |>
  html_table() |>
  mutate(ExpoType = "Specialized Expo")

wf_data_exposhorticulture <- wc_wiki |>
  purrr::pluck(3) |>
  html_table() |>
  mutate(ExpoType = "Horticultural Expo")

expos <- rbind(wf_data_expos, wf_data_exposspecial, wf_data_exposhorticulture)
str(expos)
