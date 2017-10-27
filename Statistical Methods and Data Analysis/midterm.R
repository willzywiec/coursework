# Will Zywiec

# Johns Hopkins University
# Statistical Methods and Data Analysis
# Mid-Term Exam

# Problem 6c
ci <- dbinom(15, size = 20, prob = 0.8)
cii <- sum(dbinom(16:20, size = 20, prob = 0.8))
ciii <- sum(dbinom(1:15, size = 20, prob = 0.8))

cat("P(X = 15) =", ci, "\n")
cat("P(X > 15) =", cii, "\n")
cat("P(X <= 15) =", ciii, "\n")
