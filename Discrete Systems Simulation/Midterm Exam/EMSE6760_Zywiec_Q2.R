# Will Zywiec
# EMSE 6760
# Midterm Exam
# Question 2

rm(list=ls())
gc()
# setwd("C:/Users/Will/Desktop")

# $100,000 investment in Plan A
# annual return is a uniform distribution between 0-6%

# $100,000 investment in Plan B
# annual return is a Bernoulli random variable with P(4%)=0.5, P(2%)=0.3, P(0%)=0.2

# run 100 iterations to determine how many years it takes on average for the total capital to reach $500,000

# SimulationData = data frame
# 	Years = number of years to reach $500,000

SimulationData <- data.frame(Years=as.numeric())

# 100 iterations
for (i in 1:100) {

	PlanA <- 100000
	PlanB <- 100000
	t = 100000
	TotalCapital <- 500000
	TotalCapitalA <- PlanA
	TotalCapitalB <- PlanB

	j <- 0

	while (t < TotalCapital) {
		ReturnA <- 0.06*runif(1)
		B <- runif(1)
		if (B <= 0.5) {
			ReturnB <- 0.04
		} else {
			if (B > 0.5 && B <= 0.8) {
				ReturnB <- 0.02
			} else {
				if (B > 0.8 && B <= 1) {
					ReturnB <- 0.00
				}
			}
		}

		TotalCapitalA = TotalCapitalA * (1 + ReturnA)
		TotalCapitalB = TotalCapitalB * (1 + ReturnB)
		t = TotalCapitalA + TotalCapitalB
		j = j + 1

	}

	SimulationData[nrow(SimulationData) + 1, ] = c(j)

}

# calculates average number of years for total capital to reach $500,000
average.no.years <- mean(SimulationData$Years)
average.no.years

hist(SimulationData$Years, xlab="Years", main="Plan A & Plan B Investment (Number of Years to Reach $500,000)", col="blue")
