# Will Zywiec
# 
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 1 Assignment

# 2.2.2
red <- 0
blue <- 0
green <- 0
A <- integer()
for (red in 0:5) {
	red <- red + 1
	for (blue in 0:5) {
		blue <- blue + 1
		for (green in 0:5) {
			green <- green + 1
			if (red + blue + green == 5) {
				dieRoll <- c(red, blue, green)
				dieRoll <- paste(dieRoll, collapse = "-")
				dieRoll <- paste(shQuote(dieRoll))
				A <- c(A, dieRoll)
			}
		}
	}
}
cat("Possible sequences of Event A:", A, "\n")

# 2.2.7
a <- 0
b <- 0
P <- integer()
for (a in 0:4) {
	a <- a + 1
	for (b in 0:4) {
		b <- b + 1
		if (a^2 + b^2 == 25) {
			sides <- c(a, b)
			sides <- paste(sides, collapse = "-")
			sides <- paste(shQuote(sides))
			P <- c(P, sides)
		}
	}
}
cat("Possible values of 'a' and 'b':", P, "\n")

# 2.2.13
dieOne <- 0
dieTwo <- 0
total <- integer()
for (dieOne in 0:5) {
	for (dieTwo in 0:5) {
		total <- c(total, dieOne + dieTwo)
	}
}
cat()

# 2.2.17
library(rootSolve) # load 'rootSolve' package
funOne <- function (x) x^2 + 2*x - 8 = 0
funTwo <- function (x) x^2 + x - 6 = 0
funOneRoot <- uniroot.all(funOne, c(-10, 10))
funTwoRoot <- uniroot.all(funTwo, c(-10, 10))
cat("A n B:", funTwoRoot)
cat("A u B:", funeOneRoot)

Values <- c(1.01, -0.15, -0.45, 1.69, -0.23, -0.76, -1.10, -0.73,  1.90, -1.70, 1.52, -2.13, -1.08, -0.50, 1.11, -0.44, -1.92, -1.50, -1.06, 0.20)
hist(Values)
