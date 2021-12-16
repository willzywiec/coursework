# CC = Cost of buying a condo
# CS = Cost of buying a Subway
# Ci = $500,000 investment increment
# S = Strategy Number
# A = Available capital
# ACOC = Annual cost of ownership of a condo
# ACOS = Annual cost of ownership of a Subway
# ARC = Annual Revenue of a condo
# ARS = Annual Revenue of a Subway
# SPC = Sale price of a condo
# SPS = Sale price of a Subway
# ACO = Annual cost of ownership
# AR = Annual Revenue
# SP = Sale Price
# Investment = total investment outlay
# TCI = total cash in
# TCR = total cash return

rm(list = ls())
gc()
S = 1; #Initialize strategy count

#Define constants
CC = 250000
CS = 350000
A = 1000000
Ci = 500000 # Cash increment



Strategies <- data.frame(StrategyNumber=as.numeric(),
                 Condo=as.numeric(), 
                 Subway=as.numeric(),
                 Cash=as.numeric(),
                 Return=as.numeric(),
                 Iteration=as.numeric()) 

for (i in 0:4) { # i = condo count; max of four
  for (j in 0:2) { # j = Subway count; max of two
    for (x in 0:2) { # x = $0.5M investment count; max of two
      
        if (CC * i + CS * j + Ci * x  <= A) {
          investment = CC * i + CS * j + Ci * x #total investment outlay
          StrategyNumber = S
          for (k in 1:1000){
            ACOC = 1000 * sample(6:15,1)
            ACOS = 1000 * sample(90:120,1)
            ARC = 1000 * sample(16:22,1)
            ARS = 1000 * sample(60:250,1)
            SPC = 1000 * sample(200:320,1)
            SPS = 1000 * sample(250:400,1)
            Remainder = A - investment
            ACO = ACOC * i + ACOS * j # Combined annual cost of ownership
            AR = ARC * i + ARS * j # Combined annual revenue from condos/Subways
            SP = SPC * i + SPS * j # Combined sale prices of condos/Subways
            TCI = x * Ci # Total cash investment per strategy
            TCR = TCI * (1.06^10) # Total return from cash invested
            TotalReturn <- (10 * (AR - ACO)) + TCR + SP + Remainder
            Strategies[nrow(Strategies)+1,] = c(S,i,j,TCI,mean(TotalReturn),k)
        }
        S = S+1
        
      }    
    }
  }
}

StrategySummaries = setNames(aggregate(Strategies$Return, list(Strategies$StrategyNumber), mean),c("StrategyNumber","Return"))
barplot(StrategySummaries$Return, names.arg = StrategySummaries$StrategyNumber)
