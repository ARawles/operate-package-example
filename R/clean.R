#' Clean the vgsales dataset
#'
#' Removes entries with a `NA` year value
#'
#' @eval doc_vgsales()
clean_sales <- function(df){
  df %>%
    dplyr::filter(!is.na(Year))
}
