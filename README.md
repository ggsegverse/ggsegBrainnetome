# ggsegBrainnetome

<!-- badges: start -->
[![R-CMD-check](https://github.com/ggsegverse/ggsegBrainnetome/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegBrainnetome/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggsegverse.r-universe.dev/badges/ggsegBrainnetome)](https://ggsegverse.r-universe.dev/ggsegBrainnetome)
<!-- badges: end -->

Brainnetome Atlas for the ggsegverse Ecosystem.

## Installation

``` r
# From r-universe
install.packages("ggsegBrainnetome", repos = "https://ggsegverse.r-universe.dev")

# From GitHub
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegBrainnetome")
```

## Usage

``` r
library(ggsegBrainnetome)
library(ggseg)

plot(brainnetome()) +
  theme_brain()
```

## Atlases

### brainnetome

Cortical parcellation with 105 regions per hemisphere based on connectional architecture (Fan et al., 2016).

![brainnetome](man/figures/brainnetome_snapshot.png)

### brainnetome\_sub

Subcortical parcellation with 36 subregions covering amygdala, hippocampus, thalamus, caudate, putamen, pallidum, and nucleus accumbens.

![brainnetome\_sub](man/figures/brainnetome_sub_snapshot.png)

## Data sources

| Atlas | Source | Reference | Date obtained |
|-------|--------|-----------|---------------|
| brainnetome | FreeSurfer fsaverage5 annotation | Fan et al. (2016) [doi:10.1093/cercor/bhw157](https://doi.org/10.1093/cercor/bhw157) | 2021-10-14 |
| brainnetome\_sub | Volumetric atlas from [atlas.brainnetome.org](http://atlas.brainnetome.org/download.html) | Fan et al. (2016) [doi:10.1093/cercor/bhw157](https://doi.org/10.1093/cercor/bhw157) | 2021-10-14 |
