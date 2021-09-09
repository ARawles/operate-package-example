#' Tidy the `vgsales` data
#'
#' Pivots the ..._Sales columns
#'
#' @eval doc_vgsales()
tidy_sales <- function(df) {
  df %>%
    tidyr::pivot_longer(cols = tidyselect::ends_with("_Sales"),
                        names_to = c("Country", NA), values_to = "Sales", names_sep = "_"
    )
}
