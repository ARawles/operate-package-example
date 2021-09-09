library(readr)
vgsales <- readr::read_csv("data-raw/vgsales.csv", col_types = "dccdccddddd")

usethis::use_data(vgsales, overwrite = TRUE)
