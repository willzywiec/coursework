# Will Zywiec
# EMSE 6760
# Midterm Exam
# Question 3

rm(list=ls())
gc()
# setwd("C:/Users/Will/Desktop")

# burgers = total number of burgers
# cost = total cost of preparing burgers ($)
# p = burger price ($)

# SimulationData = data frame
# 	Price = price per burger; charged to customer ($)
#	Profit = revenue - cost; average of 100 simulations ($)

burgers = 400
cost = burgers * 2

SimulationData <- data.frame(Price=as.numeric(), Profit=as.numeric())

for (p in seq(from=2.25, to=25, by=0.25)) {

	profit.tally <- NA

	# 100 simulations
	for (i in 1:100) {
		demand <- 550 - 100 * sqrt(p)

		# demand cannot exceed the total number of burgers
		if (demand > burgers) {
			demand = 400
		}

		profit <- round(demand * p - cost, 2)
		if (i == 1) {
			profit.tally = profit
		} else {
			profit.tally = c(profit.tally, profit)
		}

	}

	SimulationData[nrow(SimulationData) + 1, ] = c(p, round(mean(profit.tally), 2))

}

# calculates maximum profit
max.profit <- max(SimulationData$Profit)
max.profit

# burger price that corresponds to maximum profit
for (i in 1:length(SimulationData$Profit)) {
	if (SimulationData$Profit[i] == max.profit) {
		optimal.price <- SimulationData$Price[i]
	}
}

optimal.price

plot(SimulationData$Price, SimulationData$Profit, type="l", xlab="Price ($)", ylab="Profit ($)", main="Burger Sales", col="blue")
