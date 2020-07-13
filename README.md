
<!-- README.md is generated from README.Rmd. Please edit that file -->

# miRminer

<!-- badges: start -->

[![R build
status](https://github.com/jvfe/miRminer/workflows/R-CMD-check/badge.svg)](https://github.com/jvfe/miRminer/actions)
<!-- badges: end -->

Scrapes disease-associated miRNA data.

Databases of miRNA-disease association, like
[HMDD](http://www.cuilab.cn/hmdd) or
[miRTarBase](http://mirtarbase.cuhk.edu.cn/php/), provide easily
downloadable data dumps, but no easy way to query it programmatically,
such as an API, this package exists to alleviate some of those issues.

## Installation

You can install the latest version of miRminer from Github with:

``` r
install.packages("remotes")

remotes::install_github("jvfe/miRminer")
```

## Example usage

If you want to get causality information from HMDD3:

``` r
library(miRminer)

sepsis_causal <- get_hmdd_causality("sepsis")
hm101_causal <- get_hmdd_causality("hsa-mir-101")
```

Or miRNA-target interaction networks:

``` r

silicosis_net <- get_hmdd_net("silicosis")
hm101_net <- get_hmdd_net("hsa-mir-101")
```

Or maybe miRNA-disease association from mirTarBase:

``` r

carcinoma_mirnas <- get_mirtar_disease("carcinoma")
```
