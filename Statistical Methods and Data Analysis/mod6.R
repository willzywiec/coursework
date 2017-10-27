# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 6 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows
par(font.lab = 2)		# bold axis labels

par(mfrow = c(2, 2))	# 4 graphs arranged in 2 rows and 2 columns

plot.new()
mtext("Module 6", font = 2, line = -5, side = 3, outer = FALSE)
mtext("Additional", font = 2, line = -7, side = 3)
mtext("Problems", font = 2, line = -9, side = 3)

# Problem 1
i <- 0
j <- 0
poisson_Matrix <- matrix(c(0:1:100), nrow = 10, ncol = 100)

for(i in 0:9) {
	i <- i + 1
	for(j in 0:99) {
		j <- j + 1
		poisson_Matrix[i, j] <- rpois(1, lambda = 4)
	}
}

hist(poisson_Matrix, breaks = 10, main = "Poisson Random Values", xlab = "Value")
mean_Pois <- mean(poisson_Matrix)
sd_Pois <- sd(poisson_Matrix)
cat("Mean (Poisson):", mean_Pois, "/n")
cat("Standard Deviation (Poisson):", sd_Pois, "/n")

# Problem 2
k <- 0
l <- 0
exponential_Matrix <- matrix(c(0:1:100), nrow = 10, ncol = 100)

for(i in 0:9) {
	i <- i + 1
	for(j in 0:99) {
		j <- j + 1
		exponential_Matrix[i, j] <- rexp(1, rate = 5)
	}
}

hist(exponential_Matrix, breaks = 20, main = "Exponential Random Values", xlab = "Value")
mean_Exp <- mean(exponential_Matrix)
sd_Exp <- sd(exponential_Matrix)
cat("Mean (Exponential):", mean_Exp, "/n")
cat("Standard Deviation (Exponential):", sd_Exp, "/n")

# Problem 3
m <- 0
n <- 0
normal_Matrix <- matrix(c(0:1:500), nrow = 10, ncol = 500)

for(m in 0:10) {
	m <- m + 1
	for(n in 0:499) {
		n <- n + 1
		normal_Matrix[m, n] <- rnorm(1, mean = 50, sd = 10)
	}
}

hist(normal_Matrix, breaks = 40, main = "Normal Random Values", xlab = "Value")

error <- qnorm(0.975) * 10 / sqrt(10)		# qnorm(1 - 0.05 / 2) * sd / n
left_CI <- 50 - error						# mean - error
right_CI <- 50 + error						# mean + error

p <- 0
q <- 0

for(p in 0:499) {
	p <- p + 1
	if(mean(normal_Matrix[, p]) > left_CI & mean(normal_Matrix[, p]) < right_CI) {
		q <- q + 1
	}
}

interval_Mean <- q / 500

cat("The 95% confidence interval is between", left_CI, "and", right_CI, "\n")
cat("The calculated proportion of mean values within the interval is", interval_Mean, "\n")
