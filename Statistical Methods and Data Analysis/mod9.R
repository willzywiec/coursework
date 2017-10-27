# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 9 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows


# 6.2.8 a)
mu <- 120
y.bar <- 114
sd <- 18
n <- 25
z <- (y.bar - mu) / (sd / sqrt(n))
p.a <- pnorm(-abs(z))


# 6.2.8 b)
mu <- 42.9
y.bar <- 45.1
sd <- 3.2
n <- 16
z <- (y.bar - mu) / (sd / sqrt(n))
p.b <- 2 * pnorm(-abs(z))


# 6.2.8 c)
mu <- 14.2
y.bar <- 15.8
sd <- 4.1
n <- 9
z <- (y.bar - mu) / (sd / sqrt(n))
p.c <- pnorm(-abs(z))


# 6.4.4
mu <- 60
mu.guess <- seq(50, 70, 0.5)
sd <- 4
n <- 16
p <- c(0:40)

z.left <- -1.96
z.right <- 1.96
y.bar.left <- z.left * (sd / sqrt(n)) + mu
y.bar.right <- z.right * (sd / sqrt(n)) + mu

z.left.new <- c(0:40)
z.right.new <- c(0:40)

for(i in 0:40) {
	i <- i + 1
	z.left.new[i] <- (y.bar.left - mu.guess[i]) / (sd / sqrt(n))
	z.right.new[i] <- (y.bar.right - mu.guess[i]) / (sd / sqrt(n))
	p[i] <- 1 - (pnorm(z.right.new[i]) - pnorm(z.left.new[i]))
}

plot(mu.guess, p, type = "n", main = "Power Curve", xlab = expression(mu), ylab = expression(1 - beta))
lines(mu.guess, p, col = "blue", lwd = 2)


# 6.4.12 a)
# alpha.a <- (choose(6, 2) * choose(4, 1) / choose(10, 3)) + (choose(6, 3) * choose(4, 0) / choose(10, 3))
# beta.a <- (choose(6, 0) * choose(4, 3) / choose(10, 3)) + (choose(6, 1) * choose(4, 2) / choose(10, 3))
alpha.a <- dhyper(2, 6, 4, 3) + dhyper(3, 6, 4, 3)
beta.a <- dhyper(0, 6, 4, 3) + dhyper(1, 6, 4, 3)


# 6.4.12 b)
alpha.b <- dhyper(2, 7, 3, 3) + dhyper(3, 7, 3, 3)
beta.b <- dhyper(0, 7, 3, 3) + dhyper(1, 7, 3, 3)


cat("6.2.8 a) P = ", p.a, "\n", "6.2.8 b) P = ", p.b, "\n", "6.2.8 c) P = ", p.c, "\n", sep = "")
cat("6.4.12 a) alpha = ", alpha.a, ", beta = ", beta.a, "\n", "6.4.12 b) alpha = ", alpha.b, ", beta = ", beta.b, sep = "")
