# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 5 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows
par(font.lab = 2)		# bold axis labels

par(mfrow = c(2, 2))	# 4 graphs arranged in 2 rows and 2 columns


# Columns 1-5 of random exponential values with mean 10 (mean = 1 / rate)
exp1 <- rexp(500, rate = 0.1)
exp2 <- rexp(500, rate = 0.1)
exp3 <- rexp(500, rate = 0.1)
exp4 <- rexp(500, rate = 0.1)
exp5 <- rexp(500, rate = 0.1)

exp6 <- 0
i <- 0

# Column 6 (Exponential)
for(i in 0:499) {
	i <- i + 1
	if(i == 1) {
		exp6 <- (exp1[i] + exp2[i] + exp3[i] + exp4[i] + exp5[i])
	}
	if(i > 1) {
		exp6 <- c(exp6, exp1[i] + exp2[i] + exp3[i] + exp4[i] + exp5[i])
	}
}

# Column 6 Histogram (Exponential)
hist(exp6, breaks = 30, col = "dodgerblue2", main = "Exponential", prob = TRUE, sub = "Column 6", xlab = "Value", xlim = c(0, 150), ylim = c(0, 0.025))

# Column 7 Histogram (Exponential)
exp7 <- rnorm(n = 500, mean = mean(exp6), sd = sd(exp6))
hist(exp7, breaks = 30, col = "darkorange", main = "Random Normal (Exponential)", prob = TRUE, sub = "Column 7", xlab = "Value", xlim = c(0, 150), ylim = c(0, 0.025))


# Columns 1-5 of random binomial values
binom1 <- rbinom(500, size = 10, prob = 0.2)
binom2 <- rbinom(500, size = 10, prob = 0.2)
binom3 <- rbinom(500, size = 10, prob = 0.2)
binom4 <- rbinom(500, size = 10, prob = 0.2)
binom5 <- rbinom(500, size = 10, prob = 0.2)

binom6 <- 0
j <- 0

# Column 6 (Binomial)
for(j in 0:499) {
	j <- j + 1
	if(j == 1) {
		binom6 <- (binom1[j] + binom2[j] + binom3[j] + binom4[j] + binom5[j])
	}
	if(j > 1) {
		binom6 <- c(binom6, binom1[j] + binom2[j] + binom3[j] + binom4[j] + binom5[j])
	}
}

# Column 6 Histogram (Binomial)
hist(binom6, breaks = 20, col = "darkorchid", main = "Binomial", prob = TRUE, sub = "Column 6", xlab = "Value", xlim = c(0, 20), ylim = c(0, 0.2))

# Column 7 Histogram (Binomial)
binom7 <- rnorm(n = 500, mean = mean(binom6), sd = sd(binom6))
hist(binom7, breaks = 20, col = "gold", main = "Random Normal (Binomial)", prob = TRUE, sub = "Column 7", xlab = "Value", xlim = c(0, 20), ylim = c(0, 0.2))


# Problem 4.3.2
rm(list = ls())			# clear objects
graphics.off()			# close graphics windows

par(mfrow = c(2, 3))	# 5 (+1) graphs arranged in 2 rows and 3 columns

plot.new()
mtext("Module 5", font = 2, line = -7, side = 3, outer = FALSE)
mtext("Problem 4.3.2", font = 2, line = -9, side = 3)
mtext("Graphs", font = 2, line = -11, side = 3)

cord.x1 <- c(0, seq(0, 2.7, 0.01), 2.7)
cord.y1 <- c(0, dnorm(seq(0, 2.7, 0.01)), 0)
curve(dnorm(x, 0, 1), main = "a)", xlim = c(-3, 3))
polygon(cord.x1, cord.y1, col = "skyblue")

cord.x2 <- c(-0.64, seq(-0.64, -0.11, 0.01), -0.11)
cord.y2 <- c(0, dnorm(seq(-0.64, -0.11, 0.01)), 0)
curve(dnorm(x, 0, 1), main = "b)", xlim = c(-3, 3))
polygon(cord.x2, cord.y2, col = "skyblue")

cord.x3 <- c(-1.06, seq(-1.06, 3, 0.01), 3)
cord.y3 <- c(0, dnorm(seq(-1.06, 3, 0.01)), 0)
curve(dnorm(x, 0, 1), main = "c)", xlim = c(-3, 3))
polygon(cord.x3, cord.y3, col = "skyblue")

cord.x4 <- c(-3, seq(-3, -2.33, 0.01), -2.33)
cord.y4 <- c(0, dnorm(seq(-3, -2.33, 0.01)), 0)
curve(dnorm(x, 0, 1), main = "d)", xlim = c(-3, 3))
polygon(cord.x4, cord.y4, col = "skyblue")

cord.x5 <- c(4.61, seq(4.61, 6, 0.01), 6)
cord.y5 <- c(0, dnorm(seq(4.61, 6, 0.01)), 0)
curve(dnorm(x, 0, 1), main = "e)", xlim = c(-6, 6))
polygon(cord.x5, cord.y5, col = "skyblue")
