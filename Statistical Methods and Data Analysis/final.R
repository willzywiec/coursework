# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Final Exam

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows

# Problem 3
weight <- c(4082, 3686, 4111, 3686, 3175, 4139, 3686, 3430, 3289, 3657, 4082)
sum.weight <- sum(weight)
sum.weight.sq <- sum(weight^2)

# Problem 4
# a
ball.a <- c(265, 272, 246, 260, 274, 263, 255, 258, 276, 274, 274, 269, 244, 212, 235, 254, 224)
ball.b <- c(252, 276, 243, 246, 275, 246, 244, 245, 259, 260, 267, 267, 251, 222, 235, 255, 231)
t.test(ball.a, ball.b, paired = TRUE)
# b
diff <- ball.a - ball.b
c <- 0
for (i in 1:17) {
	if (diff[i] > 0) {
		c = c + 1
	}
}
binom.test(c, i)

# Problem 6
2 * pt(-abs(-0.8783), df = 27)

# Problem 7
# a)
alpha.a <- 1 - ppois(7, 4)
# b)
alpha.b1 <- 1 - ppois(7, 6)
alpha.b2 <- 1 - ppois(7, 8)
alpha.b3 <- 1 - ppois(7, 10)
alpha.b4 <- 1 - ppois(7, 12)
alpha.b5 <- 1 - ppois(7, 14)
alpha.b6 <- 1 - ppois(7, 16)
lambda <- c(0.5, 0.75, 1, 1.25, 1.5, 1.75, 2)
power.curve <- c(alpha.a, alpha.b1, alpha.b2, alpha.b3, alpha.b4, alpha.b5, alpha.b6)
lines(lambda, power.curve, main = 'Power Curve', xlab = 'Lambda', ylab = 'Test Values')

# Problem 8
gpa <- matrix(c(8, 9, 10, 4, 5, 11, 15, 11, 6, 7, 20, 14, 3, 5, 22, 23, 1, 3, 11, 12), ncol = 4, byrow = TRUE)
colnames(gpa) <- c('Under 2.00', '2.00-2.69', '2.70-3.19', '3.20-4.00')
rownames(gpa) <- c('1', '2', '3', '4', '5')
chisq.test(gpa)

# Problem 10
prior <- rgamma(20, shape = 2, scale = 20)
mle <- 0.5 * mean(prior)
lambda <- rgamma(200, shape = 2, scale = mle)
mle.2 <- 0.5 * mean(lambda)
lambda.2 <- rgamma(2000, shape = 2, scale = mle.2)
mle.3 <- 0.5 * mean(lambda.2)