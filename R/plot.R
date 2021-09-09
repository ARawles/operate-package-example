plot_vgsales <- function(df) {
  df %>%
  ggplot2::ggplot(mapping = ggplot2::aes(x = Year, y = Total_Sales)) +
    ggplot2::geom_line(mapping = ggplot2::aes(colour = Publisher)) +
    ggplot2::geom_smooth(method = "loess", formula = y ~ x) +
    ggplot2::scale_x_continuous(name = "Year") +
    ggplot2::scale_y_continuous(name = "Total Sales (Millions)", limits = c(0, NA)) +
    ggplot2::scale_colour_hue(name = "Publisher", l = 40, c = 30) +
    ggplot2::facet_wrap(~Country, scales = "free_y")
}
