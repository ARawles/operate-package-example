#' Summarise the `vgsales` dataset
#'
#' Summarises the dataset by the Publisher, Year, and Country to return the total number of sales in the
#' regions specified.
#'
#' @eval doc_vgsales()
summarise_vgsales <- function(df, grouped_by = c(Publisher, Year, Country), lump_publishers = TRUE, lump_n = 5) {
  df %>%
    dplyr::group_by(dplyr::across({{ grouped_by }})) %>%
    dplyr::summarise(Total_Sales = sum(Sales), .groups = "drop")
}

lump_vgsales <- function(df, col, w = Total_Sales, grouped_by = c(Publisher, Year, Country), n = 5) {
  dplyr::mutate(df, {{ col }} := forcats::fct_lump_n({{ col }}, n = n, w = {{ w }})) %>%
    dplyr::group_by(dplyr::across({{ grouped_by }})) %>%
    dplyr::summarise(Total_Sales = sum(Total_Sales), .groups = "drop")
}
