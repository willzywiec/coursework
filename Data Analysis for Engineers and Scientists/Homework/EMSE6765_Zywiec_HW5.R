# Will Zywiec
# EMSE 6765
# Homework 5

library(car)

# Problem 1 (Slide 11)
effectiveness <- c(96, 79, 91, 85, 83, 91, 82, 87, 77, 76, 74, 73, 78, 71, 80, 66, 73, 69, 77, 73, 71, 70, 74)
treatment <- c(rep('A', 8), rep('B', 7), rep('C', 8))
test1 <- data.frame(effectiveness, treatment)

plot(effectiveness ~ treatment, data=test1)
results1 <- aov(effectiveness ~ treatment, data=test1)
results1
results1.lm <- lm(effectiveness ~ treatment, data=test1)
results1.resid <- resid(results1.lm)
boxplot(results1.resid)
hist(results1.resid)
qqPlot(results1.resid)
summary(results1)
qf(0.95, df1=2, df2=20)

# Problem 2 (Slide 11?)
cff <- c(26.8, 27.9, 23.7, 25, 26.3, 24.8, 25.7, 24.5, 26.4, 24.2, 28, 26.9, 29.1, 25.7, 27.2, 29.9, 28.5, 29.4, 28.3)
color <- c(rep('Brown', 8), rep('Green', 5), rep('Blue', 6))
test2 <- data.frame(cff, color)

plot(cff ~ color, data=test2)
results2 <- aov(cff ~ color, data=test2)
results2
results2.lm <- lm(cff ~ color, data=test2)
results2.resid <- resid(results2.lm)
boxplot(results2.resid)
hist(results2.resid)
qqPlot(results2.resid)
summary(results2)
qf(0.95, df1=2, df2=16)

# Problem 3 (Slide ?)
auto_data1 <- c(76, 67, 81, 56, 51, 82, 69, 96, 59, 70, 68, 59, 67, 54, 42, 63, 56, 64, 58, 37)
month <- c(rep('Oct', 5), rep('Jan', 5), rep('May', 5), rep('Aug', 5))
test3 <- data.frame(auto_data1, month)

plot(auto_data1 ~ month, data=test3)
results3 <- aov(auto_data1 ~ month, data=test3)
results3
results3.lm <- lm(auto_data1 ~ month, data=test3)
results3.resid <- resid(results3.lm)
boxplot(results3.resid)
hist(results3.resid)
qqPlot(results3.resid)
summary(results3)
qf(0.95, df1=3, df2=16)

auto_data2 <- c(76, 82, 68, 63, 67, 69, 59, 56, 81, 96, 67, 64, 56, 59, 54, 58, 51, 70, 42, 37)
location <- c(rep('loc1', 4), rep('loc2', 4), rep('loc3', 4), rep('loc4', 4), rep('loc5', 4))
test4 <- data.frame(auto_data2, location)

plot(auto_data2 ~ location, data=test4)
results4 <- aov(auto_data2 ~ location, data=test4)
results4
results4.lm <- lm(auto_data2 ~ location, data=test4)
results4.resid <- resid(results4.lm)
boxplot(results4.resid)
hist(results4.resid)
qqPlot(results4.resid)
summary(results4)
qf(0.95, df1=4, df2=15)

auto_data3 <- log1p(auto_data2)
test5 <- data.frame(auto_data3, location)
plot(auto_data3 ~ location, data=test5)
results5 <- aov(auto_data3 ~ location, data=test5)
results5
results5.lm <- lm(auto_data3 ~ location, data=test5)
results5.resid <- resid(results5.lm)
boxplot(results5.resid)
hist(results5.resid)
qqPlot(results5.resid)
summary(results5)
qf(0.95, df1=4, df2=15)

results6 <- kruskal.test(as.factor(auto_data2), as.factor(location))
results6
