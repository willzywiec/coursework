# Will Zywiec
# EMSE 6765 Data Analysis for Engineers and Scientists
# Homework 2

library('dplyr')
setwd('C:/Users/Will/Dropbox/George Washington University/Data Analysis for Engineers and Scientists/Homework 2')


# Problem 3
z_a <- 1 - pnorm(2.326667)
z_b <- pnorm(-0.67452)


# Problem 4
sample_means <- c(2.5, 4, 5, 5.5, 7, 13.5, 15.5, 20.5, 26, 4.5, 5.5, 6, 7.5, 14, 16, 21, 26.5, 7, 7.5, 9, 15.5, 17.5, 22.5, 28, 8.5, 10, 16.5, 18.5, 23.5, 29, 10.5, 17, 19, 24, 29.5, 18.5, 20.5, 25.5, 31, 27, 32, 37.5, 34, 39.5, 44.5)
sample_means <- sort(sample_means)

boxplot(sample_means)
hist(sample_means)

n <- length(sample_means)
plot((1:n - 1)/(n - 1), sample_means)


# Problem 5
data <- data.frame(read.csv('Partial Cars Database.csv', header=TRUE))
data <- na.omit(data)

matrix <- cbind(data$Min.Price, data$Midrange.Price, data$Max.Price, data$City.MPG, data$Highway.MPG, data$Engine.Size..L., data$HP)

cov_matrix <- cov(matrix)
cor_matrix <- cor(matrix)
q_matrix <- t(matrix) %*% matrix

compact_data <- filter(data, Type=='Compact')
midsize_data <- filter(data, Type=='Midsize')

compact_matrix <- cbind(compact_data$Min.Price, compact_data$Midrange.Price, compact_data$Max.Price, compact_data$City.MPG, compact_data$Highway.MPG, compact_data$Engine.Size..L., compact_data$HP)
midsize_matrix <- cbind(midsize_data$Min.Price, midsize_data$Midrange.Price, midsize_data$Max.Price, midsize_data$City.MPG, midsize_data$Highway.MPG, midsize_data$Engine.Size..L., midsize_data$HP)

compact_cov_matrix <- cov(compact_matrix)
compact_cor_matrix <- cor(compact_matrix)
compact_q_matrix <- t(compact_matrix) %*% compact_matrix

midsize_cov_matrix <- cov(midsize_matrix)
midsize_cor_matrix <- cor(midsize_matrix)
midsize_q_matrix <- t(midsize_matrix) %*% midsize_matrix
