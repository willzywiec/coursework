rm(list = ls())
gc()

# S = Maximum Inventory
# s = Ordering threshold
# x = Inventory
# y = Order size
# C = Ordering cost (C = 150*y + 500)
# H = Holding Cost (H = 0.5*x per day)
# P = Profit
# R = Revenue (200 per item)
# L = Length of time until order is delivered (3 days)
# D = Demand
# z = Items ordered but not received

S = 100
s = 50
x <- NA
y <- NA
D <- NA
x[1] = 100
C <- NA
R <- NA
H <- NA
P <- NA
z = 0

for (t in 1:50) {
  if (t>=4) {
    if(y[t-3]>0){
      x[t] = x[t] + y[t-3]
      C[t] = 150*y[t-3]+500
      z = 0
    }
    else {
      C[t] = 0
    }
  }
  else {
    C[t] = 0
  }
  
  if (x[t] < s && z==0) {
    y[t] = S - x[t]
    z = y[t]
  }
  else {
    y[t] = 0
  }
  D[t] = rpois(1,10)
  if(x[t]>=D[t]) {
    x[t+1] = x[t] - D[t]
    R[t] = 200 * D[t]
  }
  else {
    x[t+1] = 0
    R[t] = 200 * x[t]
  }
  H[t] = 0.5 * x[t+1]
  P[t] = R[t] - C[t] - H[t]
}

Results <- t(rbind(x,y,D,R,C,H,P))
colnames(Results) <- c("Inventory", "Order", "Demand", "Revenue", "Ordering Cost", "Holding Cost", "Profit")
