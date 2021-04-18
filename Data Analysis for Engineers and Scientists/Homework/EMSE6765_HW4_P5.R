library(Hmisc, MVN)
setwd('C:/Users/zywiec1/Downloads')

# Problem 5
# Part A

data <- read.table('Problem 5 Data.txt', header=TRUE)
x <- c(160, 200, 260, 340, 275, 338)
c <- cov(data)
s <- describe(data)
s
xbar <- c(160, 200, 260, 340, 275, 338)
ma <- mahalanobis(data, xbar, c)
ma

# Problem 5
# Part B

mardia <- mvn(data=data, mvnTest='mardia')
mardia
henze_zirkler <- mvn(data=data, mvnTest='hz')
henze_zirkler
royston <- mvn(data=data, mvnTest='royston')
royston

mvn(data=data, multivariatePlot='qq')

mvn(data=data$horsebean, univariatePlot='qqplot')
mvn(data=data$linseed, univariatePlot='qqplot')
mvn(data=data$soybean, univariatePlot='qqplot')
mvn(data=data$sunflower, univariatePlot='qqplot')
mvn(data=data$meatmeal, univariatePlot='qqplot')
mvn(data=data$casein, univariatePlot='qqplot')