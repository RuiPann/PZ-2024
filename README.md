# Readme

## Files Available

1. `main.R`
2. `dataPZ.xlsx`

## R codes

1. `main.R` is the R program to replicate the results in "*Goods-market Desirability of Minimum Wages*" by Rui Pan and Dao-Zhi Zeng.

* Software: R version 4.3.1 (2023-06-16)
* Package `plm` is required for panel data regressions with fixed effects. Install it using: `install.packages("plm")`
* See reference for `plm`: https://cran.r-project.org/web/packages/plm/plm.pdf

## Data

1. `dataPZ.xlsx` contains prefecture-level data on Japanese manufacturing firms:
    * Nominal minimum wage (`MW_yen`): Japanese Yen (JPY)
    * Total number of firms (`Nfirms`): Number of firms
    * Total employment (`L`): Number of firms
    * Total wages and salaries (`Wage`): Japanese Yen (JPY)
    * Total intermediate inputs (`Inter`): Japanese Yen (JPY)
    * Total revenue (`R`): Japanese Yen (JPY)
    * Average annual hours worked (`Whours`): Hours per year

* Data sources:
    * Nominal minimum wage (`MW_yen`): collected from Japanese Ministry of Health, Labour, and Welfare and Prefectural Labor Bureaus websites.
    * Other variables (`Nfirms`, `L`, `WAGE`, `Inter`, `R`): Annual Census of Manufacture by Japanese Ministry of Economy, Trade, and Industry (https://www.meti.go.jp/english/statistics/tyo/census/index.html).
    * Average annual hours worked (`Whours`): OECD dataset (https://data.oecd.org/emp/hours-worked.htm).

2. Calculated variables:
    * Average annual wage: `WAGE / L`
    * Average hourly wage: `average annual wage / Whours`
    * Relative minimum wage (`MW_r`): `MW_yen / average hourly wage`
    * Markup: `R / (Inter+Wage)`
