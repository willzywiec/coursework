# q7.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

prod = c(68, 72, 77, 42, 53, 72, 53, 63, 53, 48, 60, 82, 64, 75, 72, 48, 61, 57, 64, 50, 64, 65, 70, 68, 53)
machine = c(rep("A", 5), rep("B", 5), rep("C", 5), rep("D", 5), rep("E", 5))

q7data = data.frame(prod, machine)

plot(prod ~ machine, data=q7data)

q7results = aov(prod ~ machine, data=q7data)
q7results
q7results.lm = lm(prod ~ machine, data=q7data)
q7results.resid = resid(q7results.lm)
# boxplot(q7results.resid)
hist(q7results.resid)
qf(0.95, df1=4, df2=20)