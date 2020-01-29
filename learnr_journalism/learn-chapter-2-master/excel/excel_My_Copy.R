install.packages("readxl")

library(readxl)

df_xl <- read_excel("data/StatisticsSummary.xls", sheet=1)

View(df_xl)

df_xl <- read_excel("data/StatisticsSummary.xls", sheet=1, skip=2)

View(df_xl)

colnames(df_xl)

head(df_xl$`Other Cases`)

colnames(df_xl) <- make.names(colnames(df_xl))

View(df_xl)

colnames(df_xl)

library(dplyr)

df_xl <- rename(df_xl, Year=Fiscal.Year......7.1.6.30)

colnames(df_xl)

## If you don't have dplyr installed yet, uncomment the line below and run it
# install.packages("dplyr")
library(dplyr)
df_xl <- filter(df_xl, !is.na(Year))
