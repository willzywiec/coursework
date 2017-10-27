# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 8 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows
par(font.lab = 2)		# bold axis labels

sd <- 4

rnorm.column.1 <- rnorm(1000, mean = 20, sd = sd)
rnorm.column.2 <- rnorm(1000, mean = 20, sd = sd)
rnorm.column.3 <- rnorm(1000, mean = 20, sd = sd)

u1 <- (0.25 * rnorm.column.1) + (0.5 * rnorm.column.2) + (0.25 * rnorm.column.3)
u2 <- (1/3 * rnorm.column.1) + (1/3 * rnorm.column.2) + (1/3 * rnorm.column.3)

u1.sd <- sd(u1)
u2.sd <- sd(u2)

boxplot(u1, u2, col = c("red", "blue"), horizontal = TRUE, names = c("u1", "u2"))

u1.var <- var(u1)
u2.var <- var(u2)

rel.eff <- u1.var / u2.var

calc.u1.var <- 3 * sd^2 / 8
calc.u2.var <- 3 * sd^2 / 9

calc.rel.eff <- calc.u1.var / calc.u2.var

cat("u1 Variance Estimate (Sample Data / Theoretical Value):", round(u1.var, 3), "/", round(calc.u1.var, 3), "\n")
cat("u2 Variance Estimate (Sample Data / Theoretical Value):", round(u2.var, 3), "/", round(calc.u2.var, 3), "\n")
cat("Relative Efficiency (Sample Data / Theoretical Value):", round(rel.eff, 3), "/", round(calc.rel.eff, 3), "\n")
