# q8.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q8data = read.table("q8data.csv", header=TRUE, sep=",")

q8type = q8data[, 2]
q8var = cbind(q8data$income, q8data$education, q8data$prestige)
aggregate(q8var, by=list(q8type), FUN=mean)

q8fit = manova(q8var ~ q8type)
q8fit
summary(q8fit)