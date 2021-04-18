# q5.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q5data = read.table("q5data.csv", header=TRUE, sep=",")

hist(q5data$ObsFreq)
pr1 = c(rep(1/8, 8))

chisq.test(q5data$ObsFreq)
chisq.test(q5data$ObsFreq, p=pr1)