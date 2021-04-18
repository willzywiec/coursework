# EMSE 6760
# Will Zywiec
# Homework 3
#
# Suppose that by increasing the selling price every $40, the average number of daily sales is
# decreased by 2. Keeping all other parameters constant, write a code that finds the optimal
# price of each product in order to increase profit.

# S = Maximum Inventory
# s = Ordering threshold
# x = Inventory
# y = Order size
# D = Demand
# C = Ordering cost (C = 150*y + 500)
# R = Revenue (200 per item)
# H = Holding Cost (H = 0.5*x per day)
# P = Profit
# z = Items ordered but not received

S = 100
TotalProfit <- NA
SellingPrice <- NA
SellingPrice2 <- NA

for (SellingPrice in seq(200, 320, by=40)) {

	s = 50
	x <- NA
	x[1] = 100
	y <- NA
	D <- NA
	C <- NA
	R <- NA
	H <- NA
	P <- NA
	z = 0

	for (t in 1:365) {
	  if (t>=4) {
	    if(y[t-3]>0){
	      x[t] = x[t] + y[t-3]
	      C[t] = 150 * y[t-3] + 500
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
	  D[t] = rpois(1,10) - (SellingPrice - 200) / 40 * 2
	  if(x[t] >= D[t]) {
	    x[t+1] = x[t] - D[t]
	    R[t] = SellingPrice * D[t]
	  }
	  else {
	    x[t+1] = 0
	    R[t] = SellingPrice * x[t]
	  }
	  H[t] = 0.5 * x[t+1]
	  P[t] = R[t] - C[t] - H[t]
	}
	TotalProfit[(SellingPrice - 200) / 40 + 1] = sum(P)
	SellingPrice2[(SellingPrice - 200) / 40 + 1] = SellingPrice
}

Results <- t(rbind(SellingPrice2, TotalProfit))
colnames(Results) <- c("Selling Price", "Total Profit")
plot(SellingPrice2, TotalProfit, type="l", xlab="Selling Price", ylab="Total Profit", col="blue")
