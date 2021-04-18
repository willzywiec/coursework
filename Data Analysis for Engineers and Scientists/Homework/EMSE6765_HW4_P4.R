# Will Zywiec
# Homework 4

library(MVN)
setwd('C:/Users/zywiec1/Downloads')

# Problem 4
# Part C

data <- read.table('Problem 4 Data.txt', header=TRUE, sep=',')

old <- data[, 1]
new <- data[, 2]

mvn(old, univariatePlot='histogram')
mvn(new, univariatePlot='histogram')

mvn(old, univariatePlot='qqplot')
mvn(new, univariatePlot='qqplot')

boxplot(old)
boxplot(new)