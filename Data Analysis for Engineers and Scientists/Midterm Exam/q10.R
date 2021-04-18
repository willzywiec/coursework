# Will Zywiec
# EMSE 6765
# Midterm Exam
# Question 10

rm(list=ls())
gc()

setwd("C:/Users/Will/Desktop")

deer.data <- read.table("q10.txt", header=TRUE, sep=",")

t.test(deer.data$Sample1, deer.data$Sample2, conf.level=0.95, alternative="two.sided", paired=TRUE, var.equal=FALSE)