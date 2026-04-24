

<!-- README.md is generated from README.qmd. Please edit that file -->

# ggsegBrainnetome <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ggsegverse/ggsegBrainnetome/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegBrainnetome/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggseg.r-universe.dev/badges/ggsegBrainnetome.png)](https://ggseg.r-universe.dev/ggsegBrainnetome)
<!-- badges: end -->

This package contains the [Brainnetome](https://atlas.brainnetome.org/)
atlas for plotting with ggseg.

Fan L, Li H, Zhuo J, Zhang Y, Wang J, Chen L, Yang Z, Chu C, Xie S,
Laird AR, Fox PT, Eickhoff SB, Yu C, Jiang T (2016). The Human
Brainnetome Atlas: A New Brain Atlas Based on Connectional Architecture.
*Cerebral Cortex*, 26(8):3508-3526.

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggseg.r-universe.dev/ui#builds):

``` r
options(repos = c(
  ggseg = "https://ggseg.r-universe.dev",
  CRAN = "https://cloud.r-project.org"
))

install.packages("ggsegBrainnetome")
```

You can install this package from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ggsegverse/ggsegBrainnetome")
```

## Cortical atlas

``` r
library(ggseg)
library(ggsegBrainnetome)

plot(brainnetome())
```

<img src="man/figures/README-brainnetome-1.png" style="width:100.0%" />

## Subcortical atlas

``` r
plot(brainnetome_sub())
```

<img src="man/figures/README-brainnetome_sub-1.png"
style="width:100.0%" />

## Data source

Fan L, Li H, Zhuo J, Zhang Y, Wang J, Chen L, Yang Z, Chu C, Xie S,
Laird AR, Fox PT, Eickhoff SB, Yu C, Jiang T (2016). The Human
Brainnetome Atlas: A New Brain Atlas Based on Connectional Architecture.
*Cerebral Cortex*, 26(8):3508-3526.
[doi:10.1093/cercor/bhw157](https://doi.org/10.1093/cercor/bhw157)
