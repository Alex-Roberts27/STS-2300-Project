library(rvest)
wc_wiki <- "https://en.wikipedia.org/wiki/World%27s_fair#List_of_expositions" |>
  read_html() |>
  html_nodes("table")

library(purrr)
library(dplyr)

wf_data_expos <- wc_wiki |>
  purrr::pluck(1) |>
  html_table()
wf_data_expos <- wf_data_expos |>
  mutate(ExpoType = "WorldExpo")

wf_data_exposspecial <- wc_wiki |>
  purrr::pluck(2) |>
  html_table()
wf_data_exposspecial <- wf_data_exposspecial |>
  mutate(ExpoType = "SpecialisedExpo")

wf_data_exposhorticulture <- wc_wiki |>
  purrr::pluck(3) |>
  html_table()
wf_data_exposhorticulture <- wf_data_exposhorticulture |>
  mutate(ExpoType = "HorticulturalExpo")

expos <- rbind(wf_data_expos, wf_data_exposspecial, wf_data_exposhorticulture)
str(expos)
