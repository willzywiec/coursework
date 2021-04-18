# Will Zywiec
# EMSE 6760 Final Exam
# Question 1

rm(list = ls())
gc()

# Arrival: exponential distribution with an average of 1 arrival every 5 minutes
# Service: normal distribution with a mean of 4 minutes and a standard deviation of 2 minutes

# a. Create a model that determines the departure times for the
#    first 10 customers based on the arrival and service times.

# b. Simulate this process 100 times (10 customers each) to
#    determine the mean and standard deviation of the number of
#    customers who cannot receive service immediately after
#    arrival and need to wait for some time. Store all of the
#    simulated data from the 100 iterations in one data frame.

iteration = 1 # iteration counter
CumSimData <- data.frame() # stores all of the data from the 100 iterations
SubSimData <- data.frame()

for (j in 1:100) {
	c = 0 # customer counter
	tc = 10 # 10th customer	

	arrival_time = 0 # arrival time counter	

	SimData <- data.frame(Arrival=as.numeric(), Service=as.numeric()) # create empty data frame	

	# generate random arrival and service times
	while(c < tc) {	

		t = rexp(1, rate=0.2)
		# set t = 0 if t < 0
		if (t < 0) {
			t = 0
		}
		arrival_time = arrival_time + t	

		service_time = rnorm(1, mean=4, sd=2)
		# set service_time = 0 if service_time < 0
		if (service_time < 0) {
			service_time = 0
		}
		SimData[nrow(SimData)+1,] = c(arrival_time, service_time)	

		c = c + 1	

	}	

	Departure <- NA # departure time
	Wait <- NA # '1' if the customer had to wait, '0' if the customer did not have to wait
	Wait.Total <- NA # number of customers who had to wait
	Iteration <- NA # iteration (e.g. 1, 2, 3, ..., 100)
	SimData <- cbind(SimData, Departure, Wait, Wait.Total, Iteration)	

	for (i in 1:length(SimData$Arrival)) {
		if (i == 1) {
			SimData$Departure[i] = SimData$Arrival[i] + SimData$Service[i]
			SimData$Wait[i] = 0
		} else {
			if (SimData$Departure[i-1] < SimData$Arrival[i]) {
				SimData$Departure[i] = SimData$Arrival[i] + SimData$Service[i]
				SimData$Wait[i] = 0
			} else {
				SimData$Departure[i] = SimData$Departure[i-1] + SimData$Service[i]
				SimData$Wait[i] = 1
			}
		}
	}	

	wait_counter = 0 # wait counter
	TempSimData = data.frame(Wait.Total=as.numeric())

	for (i in 1:length(SimData$Arrival)) {
		SimData$Iteration[i] = iteration
		if (SimData$Wait[i] == 1) {
			wait_counter = wait_counter + 1
		}
		if (i == length(SimData$Arrival)) {
			SimData$Wait.Total[i] = wait_counter
			TempSimData[nrow(TempSimData)+1,] = c(wait_counter)
		}
	}	

	if (iteration == 1) {
		CumSimData <- cbind(SimData)
		SubSimData <- cbind(TempSimData)
	} else {
		CumSimData <- rbind(CumSimData, SimData)
		SubSimData <- rbind(SubSimData, TempSimData)
	}

	iteration = iteration + 1

}

mean(SubSimData$Wait.Total) # calculates the mean of the number of customers who have to wait for service
sd(SubSimData$Wait.Total) # calculates the standard deviation of the number of customers who have to wait for service
