# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 3 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows

par(font.lab = 2)		# bold axis labels
par(mfrow = c(2, 2))	# 4 graphs arranged in 2 rows and 2 columns

# Binomial (10, 0.3)
x <- seq(0, 50, by = 1)
y <- dbinom(x, size = 10, prob = 0.3)
plot(x, y, main = "Binomial", type = "l")

# Hypergeometric (20, 8, 4)
y2 <- dhyper(x, 20, 8, 4)
plot(x, y2, main = "Hypergeometric", type = "l", ylab = "y")

# Exponential (3, 0)
y3 <- dexp(x, rate = 3)
plot(x, y3, main = "Exponential", type = "l", ylab = "y")

# Normal (10, 2)
y4 <- dnorm(x, mean = 10, sd = 2)
plot(x, y4, main = "Normal", type = "l", ylab = "y")

# Binomial, Hypergeometric P(X = 4)
y5 <- dbinom(4, size = 10, prob = 0.3)
y6 <- dhyper(4, 20, 8, 4)

# Exponential, Normal P(X < 8)
y7 <- pexp(8, rate = 3)
y8 <- pnorm(8, mean = 10, sd = 2, lower.tail = TRUE)

cat("Binomial P(X = 4) = ", y5)
cat("Hypergeometric P(X = 4) = ", y6)
cat("Exponential P(X < 8) = ", y7)
cat("Normal P(X < 8) = ", y8)
