# Will Zywiec
# EMSE 6765
# Midterm Exam
# Question 1

rm(list=ls())
gc()

library(car)

setwd("C:/Users/Will/Desktop")

stock.data <- read.table("q1.txt", header=FALSE)

qqPlot(stock.data)