# CC = Cost of buying a condo
# CS = Cost of buying a Subway
# BD = Bank deposit of $500,000
# S = Strategy Number
# A = Available capital
# ACOC = Annual costof ownership of a condo
# ACOS = Annual cost of ownership of a Subway
# ARC = Annual Revenue of a condo
# ARS = Annual Revenue of a Subway
# ARBD = Annual Revenue of a bank deposit
# SPC = Sale price of a condo
# SPS = Sale price of a Subway
# ACO = Annual cost of ownership
# AR = Annual Revenue
# SP = Sale Price

# Homework explanation:
# - added 'BD' for bank deposit
# - added new 'BankDeposit' input to 'Strategies' data.frame
# - nested for loops in another 'h' for loop
# - modified 'if' statement and 'investment' variable
# - added 'ARBD' for annual return on bank deposit
# - modified 'AR' variable
# - modified 'cat' statement

rm(list = ls())
gc()

S = 1;
CC = 250000
CS = 350000
BD = 500000
A = 1000000
# ACOC = 9000
# ACOS = 110000
# ARC = 18000
# ARS = 170000
# SPC = 270000
# SPS = 300000

Strategies <- data.frame(StrategyNumber=as.numeric(),
                 Condo=as.numeric(), 
                 Subway=as.numeric(),
                 BankDeposit=as.numeric(),
                 Return=as.numeric(),
                 Iteration=as.numeric()) 
for (h in 0:2) {
  for (i in 0:4) {
    for (j in 0:2) {
      if (CC * i + CS * j + BD * h <= A) {
        investment = CC * i + CS * j + BD * h
        StrategyNumber = S
        for (k in 1:1000){
          ACOC = 1000 * sample(6:15,1)
          ACOS = 1000 * sample(90:120,1)
          ARC = 1000 * sample(16:22,1)
          ARS = 1000 * sample(60:250,1)
          ARBD = 0.06 * BD
          SPC = 1000 * sample(200:320,1)
          SPS = 1000 * sample(250:400,1)
          Remainder = A - investment
          ACO = ACOC * i + ACOS * j
          AR = ARC * i + ARS * j + ARBD * h
          SP = SPC * i + SPS * j
          TotalReturn <- (10 * (AR - ACO)) + SP + Remainder
          Strategies[nrow(Strategies)+1,] = c(S,i,j,h,mean(TotalReturn),k)
        }
        S = S+1
      }
    }
  }
}

StrategySummaries = setNames(aggregate(Strategies$Return, list(Strategies$StrategyNumber), mean),c("StrategyNumber", "Return"))
barplot(StrategySummaries$Return, names.arg = StrategySummaries$StrategyNumber)
