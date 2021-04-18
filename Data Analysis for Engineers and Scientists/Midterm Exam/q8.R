# Will Zywiec
# EMSE 6765
# Midterm Exam
# Question 8

rm(list=ls())
gc()

setwd("C:/Users/Will/Desktop")

state.data <- read.table("q8.txt", header=TRUE, sep=",")

M <- data.matrix(state.data[, (2:4)])
c = cov(M)
s <- describe(M)
xbar <- s$mean
ma <- mahalanobis(M, xbar, c)
ma
