
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CVriskMX

<!-- badges: start -->

<!-- badges: end -->

The `CVriskMX` package includes a set of functions to optimize
cardiovascular risk prediction for Mexican adults. This package
currently contains a function to estimate recalibrated risk for fatal
cardiovascular disease using Globorisk (The Lancet Regional Health -
Americas, 2026).

## Authors

Omar Yaxmehen Bello-Chavolla, Daniel Ramírez-García, Neftali Eduardo
Antonio-Villa <https://bellolab.org>

Instituto Nacional de Geriatría, Mexico City, Mexico Instituto Nacional
de Cardiología Ignacio Chávez, Mexico City, Mexico

------------------------------------------------------------------------

## Installation

You can install the development version of `CVriskMX` from Github

``` r
# install.package("remotes")   #In case you have not installed it.
remotes::install_github("oyaxbell/CVriskMX")
```

Alternatively, you will soon be able install the released version of
`CVriskMX` from [CRAN](https://CRAN.R-project.org) with:

``` r
# not approved yet
# install.packages("CVriskMX")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(CVriskMX)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" alt="" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
