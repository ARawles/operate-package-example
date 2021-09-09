
# operate.package.example

<!-- badges: start -->
<!-- badges: end -->

This package is an example of utilising the R package structure and tools for your analysis project. This project was developed alongside the [opeRate](https://operate.arawles.co.uk) book.

The analysis is based on a [Kaggle dataset](https://www.kaggle.com/gregorut/videogamesales) of video game sales over the last 40 years.

## Installation

You can install the package directly from GitHub with:

``` r
remotes::install_github("arawles/operate.package.example")
```

## Analysis

The package contains two main analyses:

* A descriptive analysis of the top publisher sales over the last 40 years by region
* An inferential analysis of how genre and region affects sales 

To see the methodology and outcome of each analyses, read the respective vignette with

``` r
vignette("descriptive-analysis", package = "operate.package.example")
vignette("model-analysis", package = "operate.package.example")
```

