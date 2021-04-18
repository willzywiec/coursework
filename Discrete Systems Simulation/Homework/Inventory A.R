rm(list = ls())
gc()

# S = Maximum Inventory
# s = Ordering threshold
# x = Inventory
# y = Order size
# C = Ordering cost (C = 150*y + 500)
# H = Holding Cost (H = 0.5*x per day)
# P = Profit (50 per item)
# L = Length of time until order is delivered (3 days)
# D = Demand

S = 100
s = 40
x <- NA
y <- NA
D <- NA
x[1] = 100

for (t in 1:50) {
  if (t>=4) {
    x[t] = x[t] + y[t-3]
  }
  
  if (x[t] < s && y[t-1]==0 && y[t-2]==0) {
    y[t] = S - x[t]
  }
  else {
    y[t] = 0
  }
  D[t] = rpois(1,10)
  if(x[t]>=D[t]) {
    x[t+1] = x[t] - D[t]
  }
  else {
    x[t+1] = 0
  }
}

Results <- t(rbind(x,y,D))
colnames(Results) <- c("Inventory", "Order", "Demand")
