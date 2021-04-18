# q6.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q6data = read.table("q6data.csv", header=TRUE, sep=",")

plot(q6data$NormalStress, q6data$ShearResistance)
abline(lm(q6data$ShearResistance ~ q6data$NormalStress))

q6reg = lm(q6data$ShearResistance ~ q6data$NormalStress)
summary(q6reg)

CI_intercept = 6.5065 * 2
upper_intercept = 42.5818 + CI_intercept
upper_intercept
lower_intercept = 42.5818 - CI_intercept
lower_intercept

CI_slope = 0.2499 * 2
upper_slope = -0.6861 + CI_slope
upper_slope
lower_slope = -0.6861 - CI_slope
lower_slope

plot(q6data$NormalStress, q6reg$residuals)
abline(0, 0)