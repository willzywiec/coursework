# Will Zywiec
# 
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 2 Assignment
#
# Batting Average Problem

# Monte Carlo Simulation
mc1 <- rgamma(10, 3, 8)
mc2 <- rgamma(1000, 3, 8)
mc3 <- rgamma(100000, 3, 8)

hitprob1 <- mean(mc1)
hitprob2 <- mean(mc2)
hitprob3 <- mean(mc3)
