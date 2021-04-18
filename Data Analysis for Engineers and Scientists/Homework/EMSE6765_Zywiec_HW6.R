# Will Zywiec
# EMSE 6765 Data Analysis for Engineers and Scientists
# Homework 6

rm(list=ls())
gc()

packages <- c('dplyr', 'Hmisc', 'Hotelling', 'MVN', 'stats', 'xlsx')
lapply(packages, library, character.only=TRUE)

setwd('/Users/Will/Downloads')

# Problem 1

position <- c(1, 2, 3, 4, 5, 6, 7, 8)
winners <- c(29, 19, 18, 25, 17, 10, 15, 11)
# pr1 <- list(rep(0.125, 8))
pr1 <- c(0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125)
data1 <- data.frame(position, winners)
# chisq.test(data1, p=0.95)
chisq.test(data1, p=pr1)
chisq.test(data1, p=pr1, simulate.p.value=TRUE)

# Problem 2

x2 <- rep(0:5, times=c(121, 110, 38, 7, 3, 1))
table(x2)

pr2 <- dpois(0:5, lambda=mean(x2))
comp2 <- 1 - sum(pr2)

chisq.test(x=c(121, 110, 38, 7, 3, 1, 0), p=c(pr2, comp2))
chisq.test(x=c(121, 110, 38, 7, 3, 1, 0), p=c(pr2, comp2), simulate.p.value=TRUE)

# Problem 3

data3 <- as.data.frame(read.table('HW6P3Data.txt', header=TRUE))

standard <- dplyr::filter(data3, type=='standard')
plot(standard$TempDiff, standard$Gas, col='red', xlab='Gas Consumption', ylab='Temperature Difference')
abline(lm(standard$Gas ~ standard$TempDiff), col='red')
standard_reg <- lm(standard$Gas ~ standard$TempDiff)
summary(standard_reg)

new <- dplyr::filter(data3, type=='new')
points(new$TempDiff, new$Gas, col='blue')
abline(lm(new$Gas ~ new$TempDiff), col='blue')
new_reg <- lm(new$Gas ~ new$TempDiff)
summary(new_reg)

legend('topleft', c('Standard', 'New'), col=c('red', 'blue'), lty=1, inset=0.05, cex=0.9)

# Problem 3c

# results3c <- hotelling.test(standard[, 1:2], new[, 1:2])
# results3c

results3c <- t.test(standard[, 1:2], new[, 1:2], alternative='greater', conf.level=0.95)
results3c

# Problem 4

data4 <- as.data.frame(read.xlsx('HW6P4Data.xlsx', 1, header=TRUE))
cor(data4[, 2:8])

pca4 <- prcomp(data4[, 2:8], scale.=TRUE)
pca4
summary(pca4)

pca4.1 <- prcomp(data4[, 2:8], rank.=2, scale.=TRUE)
pca4.1
summary(pca4.1)

plot(prcomp(data4[, 2:8], rank.=2, scale.=TRUE))