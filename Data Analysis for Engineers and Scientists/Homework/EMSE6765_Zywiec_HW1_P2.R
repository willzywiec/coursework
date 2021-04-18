# EMSE6765_Zywiec_HW1_P2

rm(list=ls())
gc()

setwd('C:/Users/Will/Dropbox/George Washington University/Data Analysis for Engineers and Scientists/Homework 1')
data <- data.frame(read.table('Problem 2 Data.txt', sep='\t', header=TRUE))

mean_a <- mean(data$a)
median_a <- median(data$a)

mean_b <- mean(data$b)
median_b <- median(data$b)

Mode <- function(x) {
	ux <- unique(x)
	ux[which.max(tabulate(match(x, ux)))]
}

mode_a <- as.numeric(Mode(data$a))
mode_b <- as.numeric(Mode(data$b))

sd_a <- sd(data$a)
sd_b <- sd(data$a)

range_a <- as.numeric(max(data$a) - min(data$a))
range_b <- as.numeric(max(data$b) - min(data$b))

var_a <- var(data$a)
var_b <- var(data$b)

cat('Mean A:', mean_a, '\n')
cat('Median A:', median_a, '\n')
cat('Mode A:', mode_a, '\n')
cat('SD A:', sd_a, '\n')
cat('Range A: ', range_a, '\n')

cat('Mean B:', mean_b, '\n')
cat('Median B:', median_b, '\n')
cat('Mode B:', mode_b, '\n')
cat('SD B:', sd_b, '\n')
cat('Range B:', range_b, '\n')

plot(data$a)
hist(data$a)

plot(data$b)
hist(data$b)
