# Will Zywiec
# EMSE 6760
# Midterm Exam
# Question 1

rm(list=ls())
gc()
# setwd("C:/Users/Will/Desktop")

# a. Generate random customer arrival times for the first 50 customers
#    based on an exponential distribution with an average of 3 arrivals per minute.

# b. Assuming that service time follows a normal distribution with a mean of 20 seconds
#    and a standard deviation of 10 seconds, find the departure times for the first 50 customers.

# c. The airport security team wants to know how much longer each passenger will have to wait on average
#    if a more detailed search is conducted for every third passenger instead of the standard search.
#    A more detailed search follows a normal distribution with a mean service time of 40 seconds and a standard deviation of 15 seconds.

SimulationData <- data.frame(Arrival=as.numeric(), ServiceTime1=as.numeric(), ServiceTime2=as.numeric())

# t = time counter
# customers = total number of customer arrivals
# x = exponential distribution of customer arrival times
# norm.mean = 20 sec (normal service time)
# norm.sd = 10 sec (normal service time)
# detailed.mean = 40 sec (detailed search)
# detailed.sd = 15 sec (detailed search)

# SimulationData = data frame
# 	Arrival = arrival time of customer (min)
# 	ServiceTime1 = (normal) service time with a normal distribution (mean = 20 sec, sd = 10 sec)
# 	ServiceTime2 = (detailed search) service time with a normal distribution (mean = 40 sec, sd = 15 sec)
# 	NormalDepartureTime = (normal) departure time
# 	DetailedDepartureTime = (detailed search) departure time

i <- 0 # counter
t <- 0
customers <- 50
norm.mean <- 20/60
norm.sd <- 10/60
detailed.mean <- 40/60
detailed.sd <- 15/60


# generates random customer arrival times and service times
while(i < customers) {
	x <- rexp(1, rate=3) # <-- generates random customer arrival times
	t = t + x
	SimulationData[nrow(SimulationData) + 1,] = c(t, rnorm(1, mean=norm.mean, sd=norm.sd), rnorm(1, mean=detailed.mean, sd=detailed.sd))
	i = i + 1
}


j <- 0 # counter


# sets negative service times to 0
for (j in 1:length(SimulationData$Arrival)) {
	if (SimulationData$ServiceTime1[j] < 0) {
		SimulationData$ServiceTime1[j] = 0
	}
	if (SimulationData$ServiceTime2[j] < 0) {
		SimulationData$ServiceTime2[j] = 0
	}
	j = j + 1
}


# appends departure times to data frame for part b and part c
NormalDepartureTime <- NA
DetailedDepartureTime <- NA
SimulationData <- cbind(SimulationData, NormalDepartureTime, DetailedDepartureTime)
k <- 0 # counter


# calculates departure times for part b and part c
for (k in 1:length(SimulationData$Arrival)) {
	if (k == 1) {
		SimulationData$NormalDepartureTime[k] = SimulationData$Arrival[k] + SimulationData$ServiceTime1[k]
		SimulationData$DetailedDepartureTime[k] = SimulationData$Arrival[k] + SimulationData$ServiceTime1[k]
	} else {
		if (SimulationData$NormalDepartureTime[k-1] < SimulationData$Arrival[k]) {
			SimulationData$NormalDepartureTime[k] = SimulationData$Arrival[k] + SimulationData$ServiceTime1[k]
		} else {
			SimulationData$NormalDepartureTime[k] = SimulationData$NormalDepartureTime[k-1] + SimulationData$ServiceTime1[k]
		}
		if (SimulationData$DetailedDepartureTime[k-1] < SimulationData$Arrival[k]) {
			if (k %% 3 == 0) {
				SimulationData$DetailedDepartureTime[k] = SimulationData$Arrival[k] + SimulationData$ServiceTime2[k]
			} else {
				SimulationData$DetailedDepartureTime[k] = SimulationData$Arrival[k] + SimulationData$ServiceTime1[k]
			}
		} else {
			if (k %% 3 == 0) {
				SimulationData$DetailedDepartureTime[k] = SimulationData$DetailedDepartureTime[k-1] + SimulationData$ServiceTime2[k]
			} else {
				SimulationData$DetailedDepartureTime[k] = SimulationData$DetailedDepartureTime[k-1] + SimulationData$ServiceTime1[k]
			}
		}
	}
	k = k + 1
}


# calculates average extra waiting time per customer (in minutes) for part c
extra.waiting.time <- (sum(SimulationData$DetailedDepartureTime) - sum(SimulationData$NormalDepartureTime)) / 50
extra.waiting.time

plot(SimulationData$Arrival, SimulationData$NormalDepartureTime, xlab="Arrival Time (min)", ylab="Departure Time (min)", main="Airport Queue (Normal)", col="blue")
plot(SimulationData$Arrival, SimulationData$DetailedDepartureTime, xlab="Arrival Time (min)", ylab="Departure Time (min)", main="Airport Queue (Detailed Search)", col="red")
