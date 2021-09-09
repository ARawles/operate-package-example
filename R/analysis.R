#' Analyse the publisher sales
#'
#' Plots the top 5 publisher sales in the specified regions
#'
#' @eval doc_vgsales()
#' @param regions character; the regions to include in the plot
analyse_publisher_sales <- function(df = vgsales, region = c("Global", "NA", "EU", "JP", "Other")) {
  df %>%
    clean_sales() %>%
    tidy_sales() %>%
    dplyr::filter(Country %in% region) %>%
    summarise_vgsales() %>%
    plot_vgsales()
}
