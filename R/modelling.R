model_vgsales <- function(df, formula = Total_Sales ~ Country * Year) {
  lm(data = df, formula = formula)
}
