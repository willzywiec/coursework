rm(list = ls())
gc()

CostPerBurger = 2
Quantity = 400

Price <- NA
AverageDemand <- NA
Profit <- NA
for (i in 1:92) {
  Price[i] = 0.25*i + 2
  M = 550 - 100*sqrt(Price[i])
  Demand <- NA
  for (j in 1:100) {
    Demand[j] = round(rnorm(1,M,30))
  }
  AverageDemand[i] = max(mean(Demand),0)
  
  if(AverageDemand[i]<Quantity) {
    Profit[i] = Price[i]*AverageDemand[i] - CostPerBurger*Quantity
  }
  else {
    Profit[i] = Price[i]*Quantity - CostPerBurger*Quantity
  }
}

plot(Price,Profit)