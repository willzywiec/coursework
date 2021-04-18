# q10.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q10data = read.table("q10data.csv", header=TRUE, sep=",")

cor(q10data[, 1:4])

q10pca = prcomp(q10data[, 1:4])
q10pca
summary(q10pca)

q10pca1 = prcomp(q10data[1:50, 1:4])
q10pca1
summary(q10pca1)

q10pca2 = prcomp(q10data[51:100, 1:4])
q10pca2
summary(q10pca2)

q10pca3 = prcomp(q10data[101:150, 1:4])
q10pca3
summary(q10pca3)