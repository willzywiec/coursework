# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 11 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows

# Problem 9.2.8
f <- c(52, 69, 73, 88, 87, 56)
m <- c(72, 88, 87, 74, 78, 70, 78, 93, 74)
f.mean <- mean(f)
m.mean <- mean(m)
f.sd <- sd(f)
m.sd <- sd(m)

# Problem 9.3.2
x <- c(5.5, 5.5, 5.25, 5.125, 5.875, 5.625, 5.25, 4.875)
y <- c(3.875, 5.125, 5, 4.75, 4.375)
x.mean <- mean(x)
y.mean <- mean(y)
x.sd <- sd(x)
y.sd <- sd(y)
xy.sq.div <- (x.sd^2)/(y.sd^2)

# Problem 9.3.6
al <- c(-2, 16, 7, -27, -22, -20, -30, -8, -2, -3, -39, -24)
nl <- c(-49, -4, -18, -27, -15, -16, -10, -1, 34, -9, -28, -10, -45, -14)
al.mean <- mean(al)
nl.mean <- mean(nl)
al.sd <- sd(al)
nl.sd <- sd(n1)