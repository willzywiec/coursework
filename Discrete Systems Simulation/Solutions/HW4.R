# Code for comparing the two strategies without iterations
# Strategy1: Longest job first
# Strategy2: Shortest job first
rm(list = ls())
gc()

TotalTimeS1 <- NA
TotalTimeS2 <- NA
S1Advantage <- NA
for (j in 1:100) {
  t1 = 0
  t2 = 0
  t3 = 0
  ServiceTime1 = sample(1:10,50, replace = TRUE)
  SortedServiceTime1 = sort(ServiceTime1, decreasing = TRUE)
  
  for (i in 1:length(ServiceTime1)) {
    if(t1<=t2 & t1<=t3) {
      t1 = t1 + SortedServiceTime1[i]
    }
    else {
      if (t2<t1 & t2<=t3) {
        t2 = t2 + SortedServiceTime1[i] 
      }
      else {
        t3 = t3 + SortedServiceTime1[i]
      }
    }
  }
  
  TotalTimeS1[j] = max(t1,t2,t3)
 
  t4 = 0
  t5 = 0
  t6 = 0
  
  SortedServiceTime2 = sort(ServiceTime1, decreasing = FALSE)
  
  for (i in 1:length(ServiceTime1)) {
    if(t4<=t5 & t4<=t6) {
      t4 = t4 + SortedServiceTime2[i]
    }
    else {
      if (t5<t4 & t5<=t6) {
        t5 = t5 + SortedServiceTime2[i] 
      }
      else {
        t6 = t6 + SortedServiceTime2[i]
      }
    }
  }
  
  TotalTimeS2[j] = max(t4,t5,t6) 
  S1Advantage[j] = TotalTimeS1[j] - TotalTimeS2[j]
}

MeanS1Advantage = mean(S1Advantage)
STDS1Advantage = sd(S1Advantage)
MeanS1Advantage
STDS1Advantage