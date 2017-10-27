# Will Zywiec
#
# Johns Hopkins University
# Statistical Methods and Data Analysis
# Module 2 Assignment

rm(list = ls())			# clear objects
graphics.off()			# close graphics windows

shipping <- read.csv("C:\\Users\\Will\\Downloads\\shipping.csv")

par(font.lab = 2)		# bold axis labels
par(mfrow = c(3, 3))	# 8 graphs arranged in 3 rows and 3 columns

plot.new()
mtext("Graphical Analysis", font = 2, line = -3, side = 3, outer = FALSE)
mtext("of", font = 2, line = -5, side = 3)
mtext("Shipping Center Data", font = 2, line = -7, side = 3)


# Individual Value Plot of Days
xLabel <- c("Central", "Eastern", "Western")
suppressWarnings(plot(as.numeric(shipping$Center), as.numeric(as.character(shipping$Days)), main = "Individual Value Plot of Days", pch = 16, xaxt = "n", xlab = "Center", ylab = "Days"))
axis(1, at = 1:3, labels = xLabel)

central <- subset(shipping, shipping$Center == "Central")
suppressWarnings(c <- as.numeric(as.character(central$Days)))
centralMean <- mean(c, na.rm = TRUE)
centralSD <- sd(c, na.rm = TRUE)

eastern <- subset(shipping, shipping$Center == "Eastern")
suppressWarnings(e <- as.numeric(as.character(eastern$Days)))
easternMean <- mean(e, na.rm = TRUE)
easternSD <- sd(e, na.rm = TRUE)

western <- subset(shipping, shipping$Center == "Western")
suppressWarnings(w <- as.numeric(as.character(western$Days)))
westernMean <- mean(w, na.rm = TRUE)
westernSD <- sd(w, na.rm = TRUE)

mean <- c(centralMean, easternMean, westernMean)	# vector of mean values
lines(mean, type = "o", col = "red")


# Histogram of Delivery Time
hist(c, border = rgb(0, 0, 0, alpha = 0), main = "Histogram of Delivery Time", prob = TRUE, xlab = "Days", ylim = c(0, 0.4))
curve(dnorm(x, mean = centralMean, sd = centralSD), add = TRUE)

hist(e, border = rgb(0, 0, 0, alpha = 0), add = TRUE, prob = TRUE)
curve(dnorm(x, mean = easternMean, sd = easternSD), add = TRUE, col = "red")

hist(w, border = rgb(0, 0, 0, alpha = 0), add = TRUE, prob = TRUE)
curve(dnorm(x, mean = westernMean, sd = westernSD), add = TRUE, col = "green")

legend("topright", c("C", "E", "W"), fill = c("black", "red", "green"))


# Histogram of Days
hist(c, breaks = c(seq(0.25, 8.25, by = 0.5)), col = "gray", sub = "Central", xlab = "Days", ylim = c(0, 25))
c <- na.omit(c)
x <- seq(0, 8, length = 100)
freq <- dnorm(x, mean = centralMean, sd = centralSD)
freq <- freq * length(c) * 0.5
lines(x, freq, col = "blue")

hist(e, breaks = c(seq(0.25, 8.25, by = 0.5)), col = "gray", main = "Histogram of Days", sub = "Eastern", xlab = "Days", ylim = c(0, 25))
e <- na.omit(e)
x <- seq(0.5, 8, length = 100)
freq <- dnorm(x, mean = easternMean, sd = easternSD)
freq <- freq * length(e) * 0.5
lines(x, freq, col = "blue")

hist(w, breaks = c(seq(0.25, 8.25, by = 0.5)), col = "gray", sub = "Western", xlab = "Days", ylim = c(0, 25))
w <- na.omit(w)
x <- seq(0, 7, length = 100)
freq <- dnorm(x, mean = westernMean, sd = westernSD)
freq <- freq * length(w) * 0.5
lines(x, freq, col = "blue")


# Scatter Plot of Days vs Distance
suppressWarnings(plot(central$Distance, as.numeric(as.character(central$Days)), main = "", pch = 16, sub = "Central", xlab = "Distance", ylab = "Days", ylim = c(0, 8)))
suppressWarnings(abline(lm(as.numeric(as.character(central$Days)) ~ central$Distance), col = "blue"))

suppressWarnings(plot(eastern$Distance, as.numeric(as.character(eastern$Days)), col = "red", main = "Scatter Plot of Days vs Distance", pch = 16, sub = "Eastern", xlab = "Distance", ylab = "Days", ylim = c(0, 8)))
suppressWarnings(abline(lm(as.numeric(as.character(eastern$Days)) ~ eastern$Distance), col = "blue"))

suppressWarnings(plot(western$Distance, as.numeric(as.character(western$Days)), col = "green", main = "", pch = 16, sub = "Western", xlab = "Distance", ylab = "Days", ylim = c(0, 8)))
suppressWarnings(abline(lm(as.numeric(as.character(western$Days)) ~ western$Distance), col = "blue"))
