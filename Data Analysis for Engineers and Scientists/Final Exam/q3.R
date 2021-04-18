# q3.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q3data = read.table("q3data.csv", header=TRUE, sep=",")

q3t = t.test(q3data$Violet, q3data$Green, paired=TRUE)
q3t