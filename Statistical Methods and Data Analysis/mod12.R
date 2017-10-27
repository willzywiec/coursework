# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 12 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows

par(mfrow = c(2, 2))	# 4 graphs arranged in 2 rows and 2 columns

# Problem 11.2.2
age <- c(0, 0.5, 1, 2, 3, 4, 5, 6, 7, 8)
proof <- c(104.6, 104.1, 104.4, 105, 106, 106.8, 107.7, 108.7, 110.6, 112.1)
plot(age, proof, main = 'Aging of Whisky in Charred Oak Barrels', xlab = 'Age (years)', ylab = 'Proof')
fit.2.2 <- lm(proof ~ age)
abline(fit.2.2, col = 'red')

# Problem 11.2.7
spending <- c(10, 10.2, 10.2, 10.3, 10.3, 10.8, 11, 11, 11.2, 11.6, 12.1, 12.3, 12.6, 12.7, 12.9, 13, 13.9, 14.5, 14.7, 15.5, 16.4, 17.5, 18.1, 20.8, 22.4, 24)
graduation.rate <- c(88.7, 93.2, 95.1, 94, 88.3, 89.9, 67.7, 90.2, 95.5, 75.2, 84.6, 85, 94.8, 56.1, 54.4, 97.9, 83, 94, 91.4, 94.2, 97.2, 94.4, 78.6, 87.6, 93.3, 92.3)
plot(spending, graduation.rate, main = 'Student Performance in Massachusetts', xlab = 'Spending per Pupil (in $1000s)', ylab = 'Graduation Rate (%)', ylim = c(50, 100))
fit.2.7 <- lm(graduation.rate ~ spending)
abline(fit.2.7, col = 'red')
temp.res <- lsfit(spending, graduation.rate)
res <- temp.res$residuals
cat('Problem 11.2.7 Residuals:', res)

# Problem 11.2.20
days <- c(1, 1, 2, 2, 2, 3, 5, 6, 6, 7)
gold.concentration <- c(94.5, 86.4, 71, 80.5,81.4, 67.4, 49.3, 46.9, 42.3, 36.6)
plot(days, gold.concentration, main = 'Au-195 Injection Concentration', xlab = 'Days', ylab = 'Concentration (%)', ylim = c(30, 100))
exp.model <- lm(log(gold.concentration) ~ days)
day.values <- seq(1, 7, 1)
exp.fit <- exp(predict(exp.model, list(days = day.values)))
lines(day.values, exp.fit, col = 'red')
i <- which.min(abs(exp.fit - 50))									# find index of value closest to 50% (half-life)
x <- c(i, i + 1)													# linear interpolation x-values
y <- c(exp.fit[i], exp.fit[i + 1])									# linear interpolation y-values
li <- approx(x, y)													# default n = 50
i <- which.min(abs(li$y - 50))										# find index of value closest to 50% (half-life)
x.half.life <- li$x[i] 												# calculate approximate x-value (days)
cat('Problem 11.2.20 Approximate Half-Life:', x.half.life, 'days')

# Problem 11.3.16
weight <- c(17.1, 10.5, 13.8, 15.7, 11.9, 10.4, 15, 16, 17.8, 15.8, 15.1, 12.1, 18.4, 17.1, 16.7, 16.5, 15.1, 15.1)
volume <- c(16.7, 10.4, 13.5, 15.7, 11.6, 10.2, 14.5, 15.8, 17.6, 15.2, 14.8, 11.9, 18.3, 16.7, 16.6, 15.9, 15.1, 14.5)
plot(weight, volume, main = 'Object Weights and Volumes', xlab = 'Weight (kg)', ylab = expression(Volume ~ (dm^{3})))
fit.3.16 <- lm (volume ~ weight)
abline(fit.3.16, col = 'red')
d <- data.frame(weight = 14)
ci <- predict(fit.3.16, d, interval = 'confidence')					# default 95% confidence interval
pi <- predict(fit.3.16, d, interval = 'predict')					# default 95% prediction interval
cat('Problem 11.3.16.a 95% Confidence Interval:', ci[2], ci[3])
cat('Problem 11.3.16.b 95% Prediction Interval:', pi[2], pi[3])

# Problem 11.4.12
supply <- c(11.2, 11.8, 11.5, 10.6, 11.2, 12.8, 13.1, 12.6, 14.5, 13.8)
price <- c(1.7, 1.8, 2, 2.4, 2.5, 2.1, 2, 3, 4.2, 4.1)
r <- cor(price, supply)
cat('Problem 11.4.12 Sample Correlation Coefficient:', r)			# calculate sample correlation coefficient
