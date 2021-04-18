# Will Zywiec
# EMSE 6760 Final Exam
# Question 3

rm(list = ls())
gc()

initial_capital = 50000
living_expenses = 40000
investment_capital = initial_capital - living_expenses

annual_revenue = NA

CumSimData <- NA
SimData <- data.frame(Year=as.numeric()) 

for (j in 1:30) {
	SimData[nrow(SimData)+1,] = c(j)
}

Investment.Capital <- NA
Operating.Cost <- NA
Annual.Revenue <- NA
Net.Income <- NA
SimData <- cbind(SimData, Investment.Capital, Operating.Cost, Annual.Revenue, Net.Income)

broke = 0 # how many times the farmer went broke

for (i in 1:100) {
	for (j in 1:30) {
		random = runif(1, min=0, max=1)
		if (random <= 0.3) {
			annual_revenue = 70000
		} else {
			if (random > 0.3 && random <= 0.7) {
				annual_revenue = 80000
			} else {
				if (random > 0.7 && random <= 0.9) {
					annual_revenue = 90000
				} else {
					annual_revenue = 100000
				}
			}
		}
		operating_cost = rnorm(1, mean=30000, sd=15000)
		if (operating_cost < 0) {
			operating_cost = 0
		}
		if (j == 1) {
			SimData$Investment.Capital[j] = investment_capital
			SimData$Operating.Cost[j] = operating_cost
			SimData$Annual.Revenue[j] = annual_revenue
			SimData$Net.Income[j] = investment_capital - operating_cost + annual_revenue
		} else {
			SimData$Investment.Capital[j] = SimData$Net.Income[j-1] - living_expenses
			SimData$Operating.Cost[j] = operating_cost
			SimData$Annual.Revenue[j] = annual_revenue
			SimData$Net.Income[j] = SimData$Investment.Capital[j] - operating_cost + annual_revenue
			if (SimData$Net.Income[j] < 0) {
				broke = broke + 1
			}
		}
	}
	if (i == 1) {
		CumSimData = SimData
	} else {
		CumSimData = rbind(CumSimData, SimData)
	}
}

broke
