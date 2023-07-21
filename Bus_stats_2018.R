
library("readxl")
library(ggplot2)
Bus_stats_2018 <- read_excel("Bus_stats_2018.xls",skip = 10)
head(Bus_stats_2018)
str(Bus_stats_2018)
max(Bus_stats_2018$MID_SEM)
min(Bus_stats_2018$MID_SEM)
round(mean(Bus_stats_2018$MID_SEM),0)