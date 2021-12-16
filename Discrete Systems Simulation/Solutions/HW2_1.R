rm(list = ls())
gc()

SimData <- data.frame(Arrival1=as.numeric(), ServiceTime1=as.numeric(), ServiceTime2=as.numeric())
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
  SimData[nrow(SimData)+1,] = c(t,5*runif(1),rnorm(1,mean=2, sd=0.5)) 
   i=i+1
}
SimData$ServiceTime2[SimData$ServiceTime2<0]<-0

Departure1 <- NA
SimData <- cbind(SimData,Departure1)

for (j in 1:length(SimData$Arrival1)) {
  if (j==1) {
    SimData$Departure1[j] = SimData$Arrival1[j] + SimData$ServiceTime1[j]
  }
  else {
    if (SimData$Departure1[j-1] < SimData$Arrival1[j]) {
      SimData$Departure1[j] = SimData$Arrival1[j] + SimData$ServiceTime1[j]
      }
    else {
      SimData$Departure1[j] = SimData$Departure1[j-1] + SimData$ServiceTime1[j]
    }
  }
}

Arrival2 <- SimData$Departure1
SimData <- cbind(SimData,Arrival2)


Departure2 <- NA
SimData <- cbind(SimData,Departure2)

for (j in 1:length(SimData$Arrival2)) {
  if (j==1) {
    SimData$Departure2[j] = SimData$Arrival2[j] + SimData$ServiceTime2[j]
  }
  else {
    if (SimData$Departure2[j-1] < SimData$Arrival2[j]) {
      SimData$Departure2[j] = SimData$Arrival2[j] + SimData$ServiceTime2[j]
    }
    else {
      SimData$Departure2[j] = SimData$Departure2[j-1] + SimData$ServiceTime2[j]
    }
  }
}


# Calculating Queue Length for Server 1
Events1 <- NA
Events1 = c(SimData$Arrival1,SimData$Departure1)
OrderedEvents1 = Events1[order(Events1)]
QueueLength1 <- NA
for(k in 1:length(OrderedEvents1)) {
  NOA1 = sum(SimData$Arrival1 < OrderedEvents1[k]) # NUmber of arrivals
  NOD1 = sum(SimData$Departure1 < OrderedEvents1[k]) # Number of departures
  QueueLength1[k] = NOA1 - NOD1
}

# Calculating Queue Length for server 2
Events2 <- NA
Events2 = c(SimData$Arrival2,SimData$Departure2)
OrderedEvents2 = Events2[order(Events2)]
QueueLength2 <- NA
for(k in 1:length(OrderedEvents2)) {
  NOA2 = sum(SimData$Arrival2 < OrderedEvents2[k]) # NUmber of arrivals
  NOD2 = sum(SimData$Departure2 < OrderedEvents2[k]) # Number of departures
  QueueLength2[k] = NOA2 - NOD2
}


plot(OrderedEvents1,QueueLength1, type = "s,S", xlab = "Time", ylab = "Queue Length", col = "blue")
# plot(OrderedEvents2,QueueLength2, type = "s,S", xlab = "Time", ylab = "Queue Length Server-2", col = "blue")
lines(OrderedEvents2,QueueLength2, type = "s,S", col = "red")

title("Hw-2 problem 1: Queue Length of servers 1 and 2")

legend(0,max(QueueLength1), c("Server 1", "Server 2"), lty=c(1,1), lwd=c(2.5,2.5),col=c("blue", "red")) 




