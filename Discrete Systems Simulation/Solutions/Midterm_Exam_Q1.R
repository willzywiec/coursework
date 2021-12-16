rm(list = ls())
gc()

SimData <- data.frame(Arrival=as.numeric(), ServiceTime=as.numeric())

tt = 60 # Total Time
t = 0 #  Current Time

for(i in 1:50) {
  X = rexp(1,rate = 3)
  t=t+X
  SimData[nrow(SimData)+1,] = c(t,max(rnorm(1,1/3,1/6),0))
}


for (j in 1:length(SimData$Arrival)) {
  if (j==1) {
    SimData$Departure[j] = SimData$Arrival[j] + SimData$ServiceTime[j]
  }
  else {
    if (SimData$Departure[j-1] < SimData$Arrival[j]) {
      SimData$Departure[j] = SimData$Arrival[j] + SimData$ServiceTime[j]
    }
    else {
      SimData$Departure[j] = SimData$Departure[j-1] + SimData$ServiceTime[j]
    }
  }
}


for(j in 1:length(SimData$Arrival)) {
  if(floor(j/3) == j/3){
    SimData$NewServiceTime[j] = max(rnorm(1,2/3,1/4),0)
  }
  else{
    SimData$NewServiceTime[j] = SimData$ServiceTime[j]
  }
}


for (k in 1:length(SimData$Arrival)) {
  if (k==1) {
    SimData$NewDeparture[k] = SimData$Arrival[k] + SimData$NewServiceTime[k]
  }
  else {
    if (SimData$NewDeparture[k-1] < SimData$Arrival[k]) {
      SimData$NewDeparture[k] = SimData$Arrival[k] + SimData$NewServiceTime[k]
    }
    else {
      SimData$NewDeparture[k] = SimData$NewDeparture[k-1] + SimData$NewServiceTime[k]
    }
  }
}
SimData$Change = SimData$NewDeparture - SimData$Departure
AverageChange = mean(SimData$Change)
