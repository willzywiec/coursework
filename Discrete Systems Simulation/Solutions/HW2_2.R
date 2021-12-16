rm(list = ls())
gc()

SimData <- data.frame(Arrival=as.numeric(), ServiceTime1=as.numeric(), ServiceTime2=as.numeric())
# tt = Total Time
# NOA = Number of Arrivals
# NOD = Number of Departure
# s = Stage of the System
# TA = Time of Next Arrival
# TD = Time of Next Departure
t = 0
NOA = 0
NOD = 0
tt = 60
s = 1
i = 1


while(t<tt) {
  # Code for generating random arrival times using exponential distribution
  X = rexp(1,rate = 0.5)
  t = t+X
    # Code for generating random servie times using uniform distribution and storing arrival and service times
  SimData[nrow(SimData)+1,] = c(t, 5*runif(1), rnorm(1,mean=2, sd=0.5)) 
  i=i+1
}

Departure1 <- NA
Departure2 <- NA
ServerID <- NA
SimData <- cbind(SimData,Departure1,Departure2, ServerID)

for (j in 1:length(SimData$Arrival)) {
  if (j==1) {
    SimData$Departure1[j] = SimData$Arrival[j] + SimData$ServiceTime1[j]
    SimData$Departure2[j] = 0
    SimData$ServerID[j] = 1
  }
  else {
    if (SimData$Departure1[j-1] < SimData$Arrival[j]) {
      SimData$Departure1[j] = SimData$Arrival[j] + SimData$ServiceTime1[j]
      SimData$Departure2[j] = SimData$Departure2[j-1]
      SimData$ServerID[j] = 1
      } 
    else {
      if (SimData$Departure2[j-1] < SimData$Arrival[j]) { 
          SimData$Departure2[j] = SimData$Arrival[j] + SimData$ServiceTime2[j]
          SimData$Departure1[j] = SimData$Departure1[j-1]
          SimData$ServerID[j] = 2
          }
      else {
        if (SimData$Departure1[j-1] <= SimData$Departure2[j-1]) {
          SimData$Departure1[j] = SimData$Departure1[j-1] + SimData$ServiceTime1[j]
          SimData$Departure2[j] = SimData$Departure2[j-1]
          SimData$ServerID[j] = 1
          }
        else {
          SimData$Departure2[j] = SimData$Departure2[j-1] + SimData$ServiceTime2[j]
          SimData$Departure1[j] = SimData$Departure1[j-1]
          SimData$ServerID[j] = 2
        }
      }
    }
  }
}

 

# Calculating Queue Length
Events <- NA
Events = c(SimData$Arrival,unique(SimData$Departure1),unique(SimData$Departure2))

OrderedEvents = Events[order(Events)]
QueueLength <- NA
for(k in 1:length(OrderedEvents)) {
  NOA = sum(SimData$Arrival < OrderedEvents[k]) # NUmber of arrivals
  NOD1 = sum(SimData$ServerID == 1 & SimData$Departure1 < OrderedEvents[k])
  NOD2 = sum(SimData$ServerID == 2 & SimData$Departure2 < OrderedEvents[k])
  QueueLength[k] = NOA - (NOD1 + NOD2)
}
# Plotting the time series:q
plot(OrderedEvents,QueueLength, type = "s,S", xlab = "Time", ylab = "Queue Length", col = "blue")
title("Hw-2 problem 2: Queue Length")
