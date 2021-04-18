# Will Zywiec
# EMSE 6765
# Midterm Exam
# Question 7

rm(list=ls())
gc()

library(MVN)

sample.data <- data.frame(Front=as.numeric(), Rear=as.numeric())

front <- c(867, 825, 806, 814, 991, 945, 1004, 1091, 958, 850, 1109, 1113, 925, 903, 1006, 892, 990, 866, 1095, 1204, 1029, 1147, 1171, 1299, 944, 874, 840, 893, 1007, 973, 1097, 1194, 988, 1077, 1045, 1115, 1005, 857, 879, 887, 1075, 1121, 1190, 1058, 939, 1074, 1089, 1208, 903, 916)
rear <- c(269, 265, 319, 407, 454, 427, 522, 536, 405, 437, 434, 437, 316, 311, 351, 362, 486, 429, 551, 646, 456, 475, 456, 468, 356, 271, 354, 427, 465, 440, 539, 646, 457, 446, 402, 441, 359, 334, 312, 427, 434, 486, 569, 523, 418, 452, 462, 497, 354, 347)

sample.data <- cbind(front, rear)

front.test = mvn(data=front, univariatePlot="qqplot")
rear.test = mvn(data=rear, univariatePlot="qqplot")
front.test2 = mvn(data=front, univariatePlot="histogram")
rear.test2 = mvn(data=rear, univariatePlot="histogram")

combined.test = mvn(data=sample.data, mvnTest="mardia", multivariatePlot="qq")
combined.test

combined.test2 = mvn(data=sample.data, mvnTest="mardia", multivariatePlot="histogram")
combined.test2
