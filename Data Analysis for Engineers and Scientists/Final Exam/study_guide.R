# study_guide.R
#
# Will Zywiec
# The George Washington University
#
# ...

rm(list = ls())
gc()
setwd("C:/.../...")

# Plots
plot(data$a, xlab, ylab, col)
hist(data$a)
boxplot(data$a)

# Print
cat("mean a = ", mean_a, "\n")

# Sort and Clean Data
library("dplyr")
data = c(x, y, z)
data = sort(data)
data = na.omit(data)

# Matrix Operations
A = matrix(c(4, 6, 7, 5, 3, 4, 7, 5, 4), nrow = 3, ncol = 3)
B = matrix(c(8, 5, 7, 4, 3, 6, 5, 7, 2), nrow = 3, ncol = 3)
C = A + B # addition
D = A * B # element-wise multiplication
D1 = A %*% B # matrix multiplication
E = det(A) # determinant
F = cov(A) # covariance
G = solve(B) # inverse of a matrix
H = t(A) # transpose
I = sum(diag(A)) # trace
J = cor(A) # correlation
K = colMeans(A) # column means
L = rowMeans(B) # row means
M = sd(A[,3]) # standard deviation of a column
N = eigen(A) # eigenvalues/eigenvectors
N1 = N$values # eigenvalues
N2 = N$vectors # eigenvectors

# Bernoulli Random Numbers
A = runif(1)
if(A < 0.3){
  B = 1
} else {
    if (A < 0.7) {
        B = 2
    } else {
        B = 3
    }
}

# Statistical Analysis
rm(list = ls())
gc()
setwd("C:/.../...")
Data = read.csv(file = "XYZ.csv", head = TRUE)
print(Data) # printing the content of a data frame
str(Data) # data types in a data frame
dim(Data) # dimensions of a data frame
nrow(Data) # number of rows
ncol(Data) # number of columns
names(Data) # column names
class(Data[,"Item"]) # data type of a column
1:3 # sequence of numbers
c(1,2,3) # combine numbers into an array
seq(from = 1, to = 3, by = 1) # sequence with custom increments
median(Data[,"Sales"]) # median
mean(Data[,"Sales"]) # mean
range(Data[,"Sales"]) # range
sd(Data[,"Sales"]) # standard deviation
summary(Data[,"Sales"]) # summary of statistics
class(Data[,"Sector"]) # format of a column
nlevels(Data[,"Sector"]) # number of unique values
levels(Data[,"Sector"]) # unique values
table(Data[,"Sector"]) # count of observations by group
Data$Company[1:3] # selecting certain row numbers in a column
Data$Company[-(4:2000)] # de-select certain row numbers in a column
Data[1:3, c("Company", "Sales", "Profits", "Assets")] # select certain rows and columns
Data[Data$Assets > 1000,c("Company", "Sales", "Profits", "Assets")] # select rows and columns based on a filter
table(Data$Assets > 100) # count of observations satisfying a condition
na_profits = is.na(Data$Profits) # look for missing data points
table(na_profits) # count missing data points
tapply(Data$Profits,Data$Sector, median, na.rm = TRUE) # median by group
hist(Data$Market.Value) # histogram of a column

# Class Notes
mean(x, trim = 0.3, na.rm = FALSE, ...) # trim = 0.3 removes 3 values from each end
median(x, na.rm = FALSE)
get.mode = function(v) {
	value = unique(v)
	value[which.max(tabulate(match(v, value)))]
}
range_a = as.numeric(max(data$a) - min(data$a)) # calculate the range of 'a'
quantile(x) # calculate quartiles
x[order(x)] # put a vector of x values in ascending order
sd(x) # calculate standard deviation (equal to the square root of the variance)
# sd(x) = sqrt(sum((x - mean(x))^2)/n)
var(x) # calculate (population/sample) variance
# var(x) = sum((x - mean(x))^2)/n
# coefficient of variation (CV): measures the variability of values relative to the mean (equal to the standard deviation divided by the mean)
# bell-shaped distributions: 68% sd, 95% 2*sd, 99.75% 3*sd
# the 'skew' is in the direction the tail is facing
cor(duration, waiting) # calculate correlation coefficient (also known as 'r')

dnorm(1.95, mean = 0, sd = 1, log = FALSE) = 0.05959
pnorm(1.95, mean = 0, sd = 1, log = FALSE) = 0.97441
pnorm(1.95, mean = 0, sd = 1, log = FALSE, lower.tail = FALSE) = 0.02559
qnorm(0.95, mean = 0, sd = 1) = 1.6449
qnorm(0.95, mean = 0, sd = 1, lower.tail = FALSE) = -1.6449

sample = a[sample(1:length(a), 50, replace = FALSE)] # random sample size of 50

# Descriptive Univariate Statistics
p1 = read.table("data.txt", header = TRUE)
library("stats")
describe(p1)
p1d = describe(p1)
t(p1d)
boxplot(p1$StockData, main = "Question 1")
qqnorm(p1$StockData, col = "blue")
qqline(q1$StockData, col = "red")
grid()

# Correlation
# ...

# Z-test
# Preconditions: known sd, large data set, assumption of normal distribution
# Use: to determine if the mean can be approximated by a normal distribution
# Note: a two-tailed Z-score of 1.96 corresponds to a 95% CI [P(-z0 < z < z0) = 0.95]
#       on a one-sided Z-score table, the tabulated value is equal to 0.975
z_score = (event - pop_mean) / pop_sd
library("BSDA")
z.test(x, y = NULL, alternative = "two.sided"/"greater"/"less", mu = 0, sigma.x = NULL, sigma.y = NULL, conf.level = 0.95)
# Rearrange the statement to solve for the P(z < event)
# z > -1 --> P(z > -1) = 1 - P(z < -1)

# Linear Interpolation
(y - y0) / (x - x0) = (y1 - y0) / (x1 - x0)

# Confidence Intervals
# Calculate a 95% CI for 50 samples with a sd (sigma) of 7.1 and a mean of 110
plus_minus = 1.96 * 7.1 / sqrt(50) # answer is 1.968
# CI = 110 +/- 1.968

# Z-values and Probabilities
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# Examples
pnorm(1.96) = 0.975 # pnorm(Z-value) = probability
qnorm(0.975) = 1.96 # left-sided Z-value above the mean
qnorm(0.975, lower.tail = FALSE) = -1.96 # left-sided Z-value below the mean
qnorm(1 - 0.975) = -1.96 # right-sided Z-value above the mean
qnorm(1 - 0.975, lower.tail = FALSE) = 1.96 # right-sided Z-value above the mean

# Basic Definitions
# Alpha: probability of a Type I error on a hypothesis test
# Beta: probability of a Type II error on a hypothesis test
# Type I error: reject the null hypothesis when it is true
# Type II error: fail to reject the null hypothesis when it is false
# Rejection region: the area under the curve (equals alpha)

# T-test or Wilcoxon Rank Sum Test (T-test was used on the midterm exam)
# T-distribution: similar to the normal distribution, but with 'fatter' tails
# Preconditions: assumption of normal distribution, possible unknown sd and data
# Use: to determine if the mean of a (small) data set can be approximated by a normal distribution
# H0: MuA = MuB
# Ha: MuA != MuB
library("car")
p5 = read.table("data.txt", header = TRUE)
p5
qqPlot(p5$FieldA)
qqPlot(p5$FieldA, main = "Field A")
qqPlot(p5$FieldB, main = "Field B")
wilcox.test(p5$FieldA, p5$FieldB, alternative = "two.sided") # alternative="greater"/"less"

# T-test and Paired T-test
t.test(x, y = NULL, alternative = "two.sided"/"greater"/"less", mu = 0, paired = FALSE, var.equal = FALSE, conf.level = 0.95)
t.test(y ~ x) # y is numeric and x is a binary factor
t.test(y1, y2) # y1 and y2 are numeric
t.test(y1, y2, paired = TRUE) # y1 and y2 are numeric
t.test(y, mu  3) # one sample T-test, H0: mu=3

# F-test
# F-distribution: ratio of two independent scaled Chi Square distributions
# Preconditions: one or more data sets
# Use: to determine if a statistical model fits a given set (or sets) of data
# H0: MuA^2 = MuB^2
# Ha: MuA^2 != MuB^2
library("stats")
p6 = read.table("data.txt", header = TRUE)
var.test(p6$A, p6$B, alternative = "two.sided")

# Multivariate Normality Tests and Plots
library("Hmisc", "MVN")
data = read.table("data.txt", header = TRUE, sep = ",")
mardia = mvn(data=data, mvnTest = "mardia")
mardia
henze_zirkler = mvn(data=data, mvnTest = "hz")
henze_zirkler
royston = mvn(data=data, mvnTest = "royston")
royston
mvn(data=data, multivariatePlot = "qq")
mvn(data=data, univariatePlot = "qqplot")
mvn(data=data, univariatePlot = "histogram")

# Mahalanobis Distance
# The M-D is analogous to specifying values as standard deviations from the mean
library("psych")
p8 = read.table("data.txt", header = TRUE)
p8d = describe(p8)
p8d
p8d1 = mahalanobis(p8, p8d$mean, cov(p8))

# Correlation and Covariance Matrices
p9 = read.table("data.txt", header = TRUE)
p9d = describe(p9)
p9
p9d
cov_matrix = cov(p9)
cov_matrix
cor_matrix = cor(p9)
cor_matrix
p9_matrix = data.matrix(p9)
sscp = t(p9_matrix) %*% p9_matrix # this is also known as a Q-matrix

# Chi Square Test (Goodness of Fit)
# Chi Square distribution: special gamma distribution
# Preconditions: known expected and observed frequencies (need for calculation)
# Use: to determine if two variables are independent
packages = c("dplyr", "Hmisc", "Hotelling", "MVN", "stats", "xlsx")
lapply(packages, library, character.only = TRUE)

# Chi Square Test Example 1
position = c(1, 2, 3, 4, 5, 6, 7, 8)
winners = c(29, 19, 18, 25, 17, 10, 15, 11)
pr1 = c(rep(1/8, 8))
data1 = data.frame(position, winners)
chisq.test(data1$winners, p = pr1) # use only one vector of observations and one vector of probabilities
chisq.test(data1$winners, p = pr1, simulate.p.value = TRUE)

# Chi Square Test Example 2
breaks = c(0, 1, 2, 3, 4, 5)
pr2 = dpois(breaks, 0.8)
b = cumsum(pr2)
pr2[6] = 1 - b[5]
no_breaks = c(121, 110, 38, 7, 3, 1)
chisq.test(no_breaks, p = pr2)
# Note: the approximation is good enough if (1) Ei is less than 1 and (2) no more than 20% of the Ei are less than 5 (?)

# F-tests and T-tests on Chi Square Test Output
model = lm(width ~ length, data = kangaroo)
summary(model)

# ANOVA
# Preconditions: multiple statistical models or data sets, assumption of normal distribution
# Use: a multi-group T-test for studying variance between multiple statistical models and data sets

# One-way ANOVA
# Multiple groups based on a single factor; comparing them for the mean of a single dependent variable (i.e., 'mean')
# H0: mu1 = mu2 = mu3 = mu4
# Ha: things are affected or these is some difference between things
# 'F value': test statistic
# 'Pr(>F)': P-value
effectiveness = c(96, 79, 91, 85, 83, ...)
treatment = c(rep("A", 8), rep("B", 7), rep("C", 8))
test1 = data.frame(effectiveness, treatment)

plot(effectiveness ~ treatment, data  test1)
results1 = aov(effectiveness ~ treatment, data = test1)
results1
results1.lm = lm(effectiveness ~ treatment, data = test1)
results1.resid = resid(results1.lm)
boxplot(results1.resid)
hist(results1.resid)
qqPlot(results1.resid)
summary(results1)
qf(0.95, df1=2, df2=20) # 95th percentile of the F distribution with (2, 20) degrees of freedom

# Two-way ANOVA Without Replacement (?)
# Single estimate, multi-group based on multiple factors, single dependent variable
results2 = aov(auto_data ~ location + month, data = test2)
results2

# MANOVA (Multivariate Analysis of Variance): multiple groups with multiple dependencies
# Several multi-group, multiple dependent variables (i.e., a vector of 'means')
attach(UScereal)
shelf = factor(shelf)
y = cbind(calories, fat, sugars)
aggregate(y, by = list(shelf), FUN = mean)
fit = manova(y ~ shelf)
summary(fit)

# ANCOVA (Analysis of Covariance)

# Kruskal-Wallis Test
results6 = kruskal.test(as.factor(auto_data), as.factor(location))

# Regression Analysis
packages = c("dplyr", "Hmisc", "Hotelling", "MVN", "stats", "xlsx")
lapply(packages, library, character.only = TRUE)

data3 = as.data.frame(read.table("HW6P3Data.txt", header = TRUE))

standard = dplyr::filter(data3, type == "standard")
plot(standard$TempDiff, standard$Gas, col = "red", xlab = "Gas Consumption", ylab = "Temperature Difference")
abline(lm(standard$Gas ~ standard$TempDiff), col = "red")
standard_reg = lm(standard$Gas ~ standard$TempDiff)
summary(standard_reg)

new = dplyr::filter(data3, type == "new")
points(new$TempDiff, new$Gas, col = "blue")
abline(lm(new$Gas ~ new$TempDiff), col = "blue")
new_reg = lm(new$Gas ~ new$TempDiff)
summary(new_reg)

legend("topleft", c("Standard", "New"), col = c("red", "blue"), lty = 1, inset = 0.05, cex = 0.9)

# results3c = hotelling.test(standard[, 1:2], new[, 1:2])
results3c = t.test(standard[, 1:2], new[, 1:2], alternative = "greater", conf.level = 0.95)
results3c

# Regression Plot Example
plot(new$TempDiff, new_reg$residuals, main = "New", xlab = "Temperature Difference", ylab = "Residuals")
grid()
abline(0, 0)

# To predict something based on the results of the regression analysis, use the following results:
# Coefficients:
#				 Estimate Std.
# (Intercept)	 ('b' from the equation y = a*x + b)
# some_value	 ('a' from the equation y = a*x + b)

# Principal Component Analysis (PCA)
# R results are expresssed as a 'Proportion of Variance' which typically covers >= 0.95
data4 = as.data.frame(read.xlsx("data.xlsx", 1, header = TRUE))
cor(data4[, 2:8])

pca4 = prcomp(data4[, 2:8], scale. = TRUE)
pca4
summary(pca4)

pca4.1 = prcomp(data4[, 2:8], rank. = 2, scale. = TRUE)
pca4.1
summary(pca4.1)

plot(prcomp(data4[, 2:8], rank. = 2, scale. = TRUE))

# Scree Plot
library("psych")

data4 = read.table("data4.txt", header = TRUE)
data4s = scale(data4)
fa.parallel(data4, fa = "pc", n.iter = 100, show.legend = FALSE, main = "Unscaled Data")
grid()
fa.parallel(data4s, fa = "pc", n.iter = 100, show.legend = FALSE, main = "Scaled Data")

# Interpretation of Components
#
# The eigenvectors form the principal components and their corresponding eigenvalues
# are the variances of each principal component. In visual terms, each data point is
# surrounded by an n-dimensional ellipsoid, where each axis represents a principal
# component, and variance is expressed in the length of corresponding axes.
# Subtracting a few axes from the model does not necessarily diminish the data
# representation, as only a comparatively small amount of information is lost.
#
# For example, in the case shown above, only 4.58% of the data is lost.

# Central Limit Theorem
# When 'n' is large, the sampling distribution will be approximately normal.
# When the population distribution is normal, the sampling distribution is exactly normal for any sample size 'n'.

# Exploratory Factor Analysis (EFA)
fa(correlation_matrix, nfactors = 2, rotate = "varimax", fm = "pa")
