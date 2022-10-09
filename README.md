
<!-- README.md is generated from README.Rmd. Please edit that file -->

# goto

I had too many friends so I made the {goto} package

## Installation

You can install the development version of goto like so:

``` r
devtools::install_github("moodymudskipper/goto")
```

## Example

``` r
library(goto)
foo <- function() {
  print("a")
  goto("my label")
  print("b")
  ("my label")
  print("c")
}
foo()
#> [1] "a"
#> [1] "c"
```
