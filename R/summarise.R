#' Summarise the `vgsales` dataset
#'
#' Summarises the dataset by the Publisher, Year, and Country to return the total number of sales in the
#' regions specified.
#'
#' @eval doc_vgsales()
#' @param lump_publishers logical; whether to lump publishers not in the top `n` together to an "Other" group. Default is TRUE.
#' @param lump_n numeric; the number of top publishers to keep before lumping the others together
summarise_vgsales <- function(df, lump_publishers = TRUE, lump_n = 5) {
  df %>%
    dplyr::group_by(Publisher, Year, Country) %>%
    dplyr::summarise(Total_Sales = sum(Sales), .groups = "drop") %>% {
      if (lump_publishers) {
        dplyr::mutate(., Publisher = forcats::fct_lump_n(Publisher, n = lump_n, w = Total_Sales)) %>%
          dplyr::group_by(Publisher, Year, Country) %>%
          dplyr::summarise(Total_Sales = sum(Total_Sales), .groups = "drop")
      } else {
        .
      }
    }
}
