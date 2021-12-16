rm(list = ls())
gc()
Year <- NA
for (i in 1:100) {
  InvestmentA = 100000
  InvestmentB = 100000
  Year[i] = 0
  while(InvestmentA + InvestmentB < 500000) {
    ReturnA = 0.06*runif(1)
    B = runif(1)
    if(B<0.5) {
      ReturnB = 0.04
    }
    else {
      if(B<0.8){
        ReturnB = 0.02
      }
      else {
        ReturnB = 0
      }
    }
    InvestmentA = InvestmentA + ReturnA*InvestmentA
    InvestmentB = InvestmentB + ReturnB*InvestmentB
    Year[i] = Year[i] + 1
  }
}
AverageYears = mean(Year)