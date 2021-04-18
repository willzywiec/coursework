# Will Zywiec
# EMSE 6765
# Midterm Exam
# Question 9

rm(list=ls())
gc()

setwd("C:/Users/Will/Desktop")

investment.data <- read.table("q9.txt", header=TRUE, sep=",")

M <- data.matrix(investment.data)

cov = cov(M)
cov

cor = cor(M)
cor
