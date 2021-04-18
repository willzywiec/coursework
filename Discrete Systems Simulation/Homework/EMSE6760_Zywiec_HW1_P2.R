# CC = Cost of buying a condo
# CS = Cost of buying a Subway
# S = Strategy Number
# A = Available capital
# ACOC = Annual costof ownership of a condo
# ACOS = Annual cost of ownership of a Subway
# ARC = Annual revenue of a condo
# ARS = Annual revenue of a Subway
# SPC = Sale price of a condo
# SPS = Sale price of a Subway
# ACO = Annual cost of ownership
# AR = Annual revenue
# SP = Sale price

# Homework explanation:
# - modified script to remove 'K' counter, re-nest for loops, and create 'Simulations' variable (runs a single simulation 1000 times)
# - created new 'WinningStrategies' data.frame and 'MaxStrategy' variable to capture and append winning strategies to a new data.frame for each for loop iteration (single simulation = for loop iteration)
# - imported 'plyr' library to organize data and create a subset of the 'WinningStrategies' data.frame, which displays a percentage breakdown of winning strategies

rm(list = ls())
gc()

CC = 250000
CS = 350000
A = 1000000
# ACOC = 9000
# ACOS = 110000
# ARC = 18000
# ARS = 170000
# SPC = 270000
# SPS = 300000

WinningStrategies <- data.frame(StrategyNumber=as.numeric(), MaxReturn=as.numeric())

Simulations = 1000

for (run in 1:Simulations) {

  S = 1;

  Strategies <- data.frame(StrategyNumber=as.numeric(),
                 Condo=as.numeric(), 
                 Subway=as.numeric(),
                 Return=as.numeric())

  for (i in 0:4) {
    for (j in 0:2) {
      if (CC * i + CS * j <= A) {
        Investment = CC * i + CS * j
        StrategyNumber = S
        ACOC = 1000 * sample(6:15,1)
        ACOS = 1000 * sample(90:120,1)
        ARC = 1000 * sample(16:22,1)
        ARS = 1000 * sample(60:250,1)
        SPC = 1000 * sample(200:320,1)
        SPS = 1000 * sample(250:400,1)
        Remainder = A - Investment
        ACO = ACOC * i + ACOS * j
        AR = ARC * i + ARS * j
        SP = SPC * i + SPS * j
        TotalReturn <- (10 * (AR - ACO)) + SP + Remainder
        Strategies[nrow(Strategies)+1,] = c(S,i,j,mean(TotalReturn))
        S = S+1
      }
    }
  }

  StrategySummaries = setNames(aggregate(Strategies$Return, list(Strategies$StrategyNumber), mean), c("StrategyNumber", "Return"))
  barplot(StrategySummaries$Return, names.arg = StrategySummaries$StrategyNumber)

  MaxStrategy <- sapply(StrategySummaries, max)

  for (row in 1:nrow(StrategySummaries)) {
    if (MaxStrategy[2] == StrategySummaries[row, 2]) {
      WinningStrategies <- rbind(WinningStrategies, StrategySummaries[row, ])
    }
  }

}

library(plyr)

WinningSummary <- count(WinningStrategies, "StrategyNumber")
WinningSummary$Fraction = WinningSummary$freq / Simulations * 100
colnames(WinningSummary) <- c("Strategy Number", "Frequency", "Percentage (%)")
