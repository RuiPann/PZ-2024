# Introduction (updated 2024/03/22)
# 
# 1. R program used to replicate the results in "Goods-market Desirability of Minimum Wages" by Rui Pan and Dao-Zhi Zeng
# Software:  version 4.3.1 (2023-06-16 ucrt) -- "Beagle Scouts"
#Copyright (C) 2023 The R Foundation for Statistical Computing
#Platform: x86_64-w64-mingw32/x64 (64-bit)
# 
# 2. The minimum wage data is compiled by the authors themselves from Japanese Ministry of Health, Labour, and Welfare and Prefectural Labor Bureaus websites.
#
# 3. The manufactural sector data (2000-2020) is compiled from  Annual Census of Manufacture (Japanese Ministry of Economy, Trade, and Industry)
# 
# 4. packages("plm") should be installed to run panel regressions with fixed effects. 
# https://cran.r-project.org/web/packages/plm/plm.pdf
# 
# 5. All rights reserved. Only for personal, academic, or educational use.

#Load the data
library(readxl)
dataPZ <- read_excel("Your local data path./dataPZ.xlsx")

#Install package("plm")
install.packages("plm")
library("plm")

#Install and load the 'stargazer' package for producing well-formatted tables.
#See Hlavac, Marek (2022). stargazer: Well-Formatted Regression and Summary Statistics Tables.
install.packages("stargazer")
library(stargazer)

# Calculate the markup variable
dataPZ$markup<-(dataPZ$R)/((dataPZ$Wage)+(dataPZ$Inter))

######################################################################
#Table 1: Regressions with nominal minimum wages
Ref1<-plm(log(Nfirm)~log(mw_yen),data=dataPZ, index=c("prefecture","year"), model="within")
ReL1<-plm(log(L)~log(mw_yen),data=dataPZ, index=c("prefecture","year"), model="within")
ReM1<-plm(log(markup)~log(mw_yen),data=dataPZ, index=c("prefecture","year"), model="within")

#Generate tables using stargazer 
stargazer(Ref1, ReL1, ReM1,
title = "Results1",
type = "text",
omit.stat = c("f"),
single.row = FALSE,
out = "Table 1.txt")

#####################################################################
#Table 2: Regressions with Relative Minimum Wages

# 1. Calculate average annual wage
dataPZ$awgy<-(dataPZ$Wage)/(dataPZ$L)

#2. Calculate average hourly wage
dataPZ$awgh<-dataPZ$awgy/(dataPZ$Whours)

#3. Calculate relative minimum wage
dataPZ$mwr<-dataPZ$mw_yen/(dataPZ$awgh)

# Regressions using relative minimum wage
Ref2<-plm(log(Nfirm)~log(mwr),data=dataPZ, index=c("prefecture","year"), model="within")
ReL2<-plm(log(L)~log(mwr),data=dataPZ, index=c("prefecture","year"), model="within")
ReM2<-plm(log(markup)~log(mwr),data=dataPZ, index=c("prefecture","year"), model="within")

# Generate tables using stargazer
stargazer(Ref2, ReL2, ReM2,
          title = "Results2",
          type = "text",
          omit.stat = c("f"),
          single.row = FALSE,
          out = "Table 2.txt")
