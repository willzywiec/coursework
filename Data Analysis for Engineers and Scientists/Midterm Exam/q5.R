# Will Zywiec
# EMSE 6765
# Midterm Exam
# Question 5

rm(list=ls())
gc()

FieldA <- c(8.53, 8.52, 8.01, 7.99, 7.93, 7.89, 7.85, 7.82, 7.8)
FieldB <- c(7.85, 7.73, 7.58, 7.4, 7.35, 7.3, 7.27, 7.27, 7.23)

t.test(FieldA, FieldB, conf.level=0.95)

