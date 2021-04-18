# q4.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q4data = read.table("q4data.csv", header=TRUE, sep=",")

q4reg = lm(q4data$Conduc ~ q4data$Na)
summary(q4reg)

q4reg1 = lm(q4data$Conduc ~ q4data$P + q4data$Ca + q4data$Mg + q4data$K + q4data$Na)
summary(q4reg1)

cor(q4data[, 1:5])

q4pca = prcomp(q4data[, 1:5], scale.=TRUE)
q4pca
summary(q4pca)