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
    lump_vgsales(col = Publisher) %>%
    plot_vgsales()


}


analyse_country_sales <- function(df = vgsales) {

  df <- df %>%
    clean_sales() %>%
    tidy_sales() %>%
    dplyr::filter(Year >= 1980 & Year <= 2000) %>%
    summarise_vgsales(grouped_by = c(Country, Year)) %>%
    dplyr::filter(Country != "Global")

  model <- df %>%
    model_vgsales()

  plot <- df %>%
    plot_country_sales()

  list(model = model,
       plot = plot)
}


analyse_genre_sales <- function(df = vgsales, n = 7) {

    df <- df %>%
      clean_sales() %>%
      tidy_sales() %>%
      dplyr::filter(Year >= 1980 & Year <= 2000,
                    Country == "Global") %>%
      summarise_vgsales(grouped_by = c(Genre, Year)) %>%
      lump_vgsales(col = Genre, grouped_by = c(Genre, Year), n = n)

    model <- df %>%
      model_vgsales(formula = Total_Sales ~ Year * Genre)

    plot <- df %>%
      plot_genre_sales()

    list(model = model,
         plot = plot)
}
