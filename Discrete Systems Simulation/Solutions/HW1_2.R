# CC = Cost of buying a condo
# CS = Cost of buying a Subway
# S = Strategy Number
# A = Available capital
# ACOC = Annual costof ownership of a condo
# ACOS = Annual cost of ownership of a Subway
# ARC = Annual Revenue of a condo
# ARS = Annual Revenue of a Subway
# SPC = Sale price of a condo
# SPS = Sale price of a Subway
# ACO = Annual cost of ownership
# AR = Annual Revenue
# SP = Sale Price

rm(list = ls())
gc()
CC = 250000
CS = 350000
A = 1000000



Strategies <- data.frame(StrategyNumber=as.numeric(),
                 Condo=as.numeric(), 
                 Subway=as.numeric(),
                 Return=as.numeric(),
                 Iteration=as.numeric()) 
#Manages the tabulated results for each simulations

StrategiesLog <- data.frame(StrategyNumber=as.numeric(),
                         Condo=as.numeric(), 
                         Subway=as.numeric(),
                         Return=as.numeric(),
                         Iteration=as.numeric()) 
#Allows storage of all sims for review

maxstrat <- data.frame(Iteration=as.numeric(), Return=as.numeric())

#Tabulates max return for each iteration

for (k in 1:1000){
  S = 1
  for (i in 0:4) {
    for (j in 0:2) {
      if (CC * i + CS * j <= A) {
        investment = CC * i + CS * j
        StrategyNumber = S
        ACOC = 1000 * sample(6:15,1)
        ACOS = 1000 * sample(90:120,1)
        ARC = 1000 * sample(16:22,1)
        ARS = 1000 * sample(60:250,1)
        SPC = 1000 * sample(200:320,1)
        SPS = 1000 * sample(250:400,1)
        Remainder = A - investment
        ACO = ACOC * i + ACOS * j
        AR = ARC * i + ARS * j
        SP = SPC * i + SPS * j
        TotalReturn = (10 * (AR - ACO)) + SP + Remainder
        Strategies[S,] = c(S,i,j,TotalReturn,k)
        StrategiesLog[nrow(StrategiesLog)+1,] = c(S,i,j,TotalReturn,k) #Stores all iteration results
        S = S+1
      }
      maxstrat[k,] = c(k, which.max(Strategies$Return)) #Returns strategy number assoc w/max return
    }
  }
}
#OccurenceCt <- table(maxstrat$Return) #Tabulates # of occurences each strategy is max (unnecessary)
OccurenceFreq <- setNames(as.data.frame(table(maxstrat$Return)),c("Strategy", "Frequency")) #Tabulate max returns and create data frame for manipulation
OccurenceFreq$Percent <- OccurenceFreq$Freq / sum(OccurenceFreq$Frequency) #Calculate percentages
barplot(OccurenceFreq$Percent, names.arg = OccurenceFreq$Strategy)
