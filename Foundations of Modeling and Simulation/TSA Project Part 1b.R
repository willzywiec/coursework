# Will Zywiec
#
# Johns Hopkins University
# Foundations of Modeling and Simulation
#
# TSA Project
# Part 1a
#
# This script uses parametric data from the Arena Process Analyzer to create tile graphs.
#   Scenario
#     A new Whole Body Scanner is going to be installed at an airport. Based on a pre-set layout, 
#     determine objective and threshold operational parameters for the Whole Body Scanner.
#   Graphs
#     Alarm Rate (%) - percent-chance that the Whole Body Scanner alarms
#     Time Delay (min) - most-likely value for how long it takes each passenger to use the Whole Body Scanner
#     >30-min - percentage of passengers who wait longer than 30 minutes

rm(list = ls())

library(ggplot2)

# Multiplot Function

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

# Universal Vectors

likely <- c(0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5, 3.75, 4
)

fail <- c(5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40
)

# Day 1

record1 <- c(0.002, 0, 0.001, 0.001, 0.002, 0.001, 0.001, 0.001, 0.003, 0.003, 0.002, 0.004, 0.008, 0.013, 0.026, 0.002, 0.002, 0.002, 0.001, 0.002, 0.001, 0.001, 0.002, 0.001, 0.004, 0.003, 0.005, 0.006, 0.016, 0.025, 0.001, 0.002, 0.001, 0.001, 0.002, 0.002, 0.001, 0.002, 0.002, 0.003, 0.003, 0.005, 0.007, 0.017, 0.032, 0.003, 0.002, 0.003, 0.002, 0.003, 0.002, 0.004, 0.002, 0.003, 0.004, 0.005, 0.006, 0.013, 0.017, 0.031, 0.002, 0.002, 0.003, 0.003, 0.005, 0.003, 0.003, 0.004, 0.003, 0.009, 0.006, 0.008, 0.014, 0.022, 0.035, 0.005, 0.003, 0.003, 0.003, 0.005, 0.004, 0.006, 0.008, 0.006, 0.006, 0.006, 0.01, 0.015, 0.022, 0.039, 0.004, 0.004, 0.005, 0.007, 0.005, 0.006, 0.007, 0.007, 0.007, 0.009, 0.008, 0.012, 0.018, 0.024, 0.042, 0.007, 0.007, 0.007, 0.008, 0.012, 0.01, 0.01, 0.011, 0.01, 0.012, 0.011, 0.015, 0.023, 0.033, 0.041
)

record1 <- record1 * 100

for (i in 1:length(record1)) {
    if (record1[[i]] > 1) {
        record1[[i]] <- 0
    }
    else if (record1[[i]] <= 1 && record1[[i]] >= 0.7) {
        record1[[i]] <- 1
    }
    else if (record1[[i]] < 0.7 && record1[[i]] >= 0.5) {
        record1[[i]] <- 2
    }
    else if (record1[[i]] < 0.5 && record1[[i]] >= 0.3) {
        record1[[i]] <- 3
    }
    else if (record1[[i]] < 0.3 && record1[[i]] >= 0.1) {
        record1[[i]] <- 4
    }
    else {
        record1[[i]] <- 5
    }
}

record1 <- as.factor(record1)

day1.df <- data.frame(x = likely, y = fail, z = record1) # data frame

# Day 2

record2 <- c(0, 0.001, 0, 0, 0, 0, 0.001, 0, 0.001, 0.001, 0.001, 0.003, 0.004, 0.009, 0.021, 0.001, 0, 0.001, 0.001, 0.001, 0.001, 0, 0.001, 0.001, 0.001, 0.002, 0.003, 0.005, 0.013, 0.024, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.001, 0.001, 0.002, 0.005, 0.008, 0.013, 0.026, 0.001, 0.001, 0.002, 0.001, 0.001, 0.001, 0.002, 0.002, 0.002, 0.002, 0.004, 0.005, 0.01, 0.015, 0.028, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.005, 0.005, 0.01, 0.021, 0.026, 0.003, 0.003, 0.002, 0.004, 0.003, 0.003, 0.005, 0.003, 0.003, 0.004, 0.006, 0.007, 0.012, 0.018, 0.031, 0.004, 0.004, 0.004, 0.004, 0.004, 0.005, 0.005, 0.005, 0.006, 0.005, 0.008, 0.009, 0.013, 0.02, 0.035, 0.006, 0.007, 0.008, 0.005, 0.007, 0.007, 0.006, 0.008, 0.008, 0.009, 0.013, 0.013, 0.018, 0.022, 0.037
)

record2 <- record2 * 100

for (i in 1:length(record2)) {
    if (record2[[i]] > 1) {
        record2[[i]] <- 0
    }
    else if (record2[[i]] <= 1 && record2[[i]] >= 0.7) {
        record2[[i]] <- 1
    }
    else if (record2[[i]] < 0.7 && record2[[i]] >= 0.5) {
        record2[[i]] <- 2
    }
    else if (record2[[i]] < 0.5 && record2[[i]] >= 0.3) {
        record2[[i]] <- 3
    }
    else if (record2[[i]] < 0.3 && record2[[i]] >= 0.1) {
        record2[[i]] <- 4
    }
    else {
        record2[[i]] <- 5
    }
}

record2 <- as.factor(record2)

day2.df <- data.frame(x = likely, y = fail, z = record2) # data frame

# Day 3

record3 <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.001, 0.002, 0.005, 0.008, 0.02, 0, 0, 0.001, 0, 0, 0, 0, 0.001, 0, 0.001, 0.001, 0.002, 0.006, 0.009, 0.025, 0.001, 0, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.004, 0.006, 0.01, 0.02, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.002, 0.001, 0.002, 0.001, 0.003, 0.004, 0.007, 0.011, 0.023, 0.001, 0.001, 0.002, 0.002, 0.002, 0.002, 0.001, 0.002, 0.002, 0.002, 0.002, 0.004, 0.007, 0.016, 0.025, 0.003, 0.002, 0.002, 0.002, 0.002, 0.003, 0.002, 0.003, 0.003, 0.003, 0.004, 0.006, 0.01, 0.017, 0.027, 0.004, 0.002, 0.002, 0.003, 0.003, 0.004, 0.003, 0.004, 0.004, 0.005, 0.007, 0.009, 0.015, 0.02, 0.029, 0.005, 0.005, 0.005, 0.006, 0.005, 0.006, 0.005, 0.006, 0.006, 0.006, 0.009, 0.012, 0.016, 0.022, 0.03
)

record3 <- record3 * 100

for (i in 1:length(record3)) {
    if (record3[[i]] > 1) {
        record3[[i]] <- 0
    }
    else if (record3[[i]] <= 1 && record3[[i]] >= 0.7) {
        record3[[i]] <- 1
    }
    else if (record3[[i]] < 0.7 && record3[[i]] >= 0.5) {
        record3[[i]] <- 2
    }
    else if (record3[[i]] < 0.5 && record3[[i]] >= 0.3) {
        record3[[i]] <- 3
    }
    else if (record3[[i]] < 0.3 && record3[[i]] >= 0.1) {
        record3[[i]] <- 4
    }
    else {
        record3[[i]] <- 5
    }
}

record3 <- as.factor(record3)

day3.df <- data.frame(x = likely, y = fail, z = record3) # data frame

# Day 4

record4 <- c(0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.003, 0.003, 0.007, 0.013, 0.025, 0, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.005, 0.004, 0.009, 0.013, 0.028, 0.001, 0.001, 0.001, 0.002, 0.001, 0.002, 0.001, 0.002, 0.001, 0.002, 0.003, 0.005, 0.008, 0.016, 0.034, 0.001, 0.001, 0.003, 0.002, 0.002, 0.002, 0.001, 0.002, 0.002, 0.002, 0.003, 0.006, 0.011, 0.018, 0.028, 0.002, 0.002, 0.002, 0.002, 0.003, 0.003, 0.002, 0.003, 0.005, 0.003, 0.005, 0.007, 0.011, 0.018, 0.034, 0.003, 0.003, 0.002, 0.003, 0.003, 0.003, 0.004, 0.004, 0.005, 0.008, 0.005, 0.01, 0.014, 0.02, 0.033, 0.004, 0.005, 0.005, 0.005, 0.005, 0.005, 0.006, 0.005, 0.006, 0.007, 0.009, 0.013, 0.015, 0.019, 0.039, 0.008, 0.008, 0.007, 0.008, 0.006, 0.007, 0.007, 0.01, 0.01, 0.011, 0.01, 0.015, 0.019, 0.028, 0.039
)

record4 <- record4 * 100

for (i in 1:length(record4)) {
    if (record4[[i]] > 1) {
        record4[[i]] <- 0
    }
    else if (record4[[i]] <= 1 && record4[[i]] >= 0.7) {
        record4[[i]] <- 1
    }
    else if (record4[[i]] < 0.7 && record4[[i]] >= 0.5) {
        record4[[i]] <- 2
    }
    else if (record4[[i]] < 0.5 && record4[[i]] >= 0.3) {
        record4[[i]] <- 3
    }
    else if (record4[[i]] < 0.3 && record4[[i]] >= 0.1) {
        record4[[i]] <- 4
    }
    else {
        record4[[i]] <- 5
    }
}

record4 <- as.factor(record4)

day4.df <- data.frame(x = likely, y = fail, z = record4) # data frame

# Day 5

record5 <- c(0, 0.001, 0.001, 0.001, 0.001, 0.003, 0.001, 0.001, 0.002, 0.001, 0.002, 0.004, 0.007, 0.017, 0.029, 0.001, 0.001, 0.002, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.002, 0.003, 0.009, 0.012, 0.034, 0.001, 0.001, 0.002, 0.002, 0.002, 0.002, 0.001, 0.002, 0.003, 0.003, 0.002, 0.005, 0.009, 0.017, 0.032, 0.003, 0.002, 0.001, 0.002, 0.004, 0.002, 0.002, 0.002, 0.003, 0.003, 0.004, 0.006, 0.011, 0.02, 0.03, 0.002, 0.003, 0.002, 0.002, 0.003, 0.004, 0.003, 0.003, 0.004, 0.004, 0.006, 0.009, 0.015, 0.019, 0.031, 0.003, 0.003, 0.003, 0.003, 0.003, 0.003, 0.007, 0.004, 0.005, 0.007, 0.008, 0.01, 0.014, 0.021, 0.038, 0.005, 0.006, 0.005, 0.005, 0.005, 0.005, 0.007, 0.008, 0.007, 0.009, 0.009, 0.012, 0.017, 0.027, 0.042, 0.007, 0.008, 0.007, 0.007, 0.009, 0.008, 0.011, 0.01, 0.012, 0.011, 0.013, 0.016, 0.025, 0.025, 0.049
)

record5 <- record5 * 100

for (i in 1:length(record5)) {
    if (record5[[i]] > 1) {
        record5[[i]] <- 0
    }
    else if (record5[[i]] <= 1 && record5[[i]] >= 0.7) {
        record5[[i]] <- 1
    }
    else if (record5[[i]] < 0.7 && record5[[i]] >= 0.5) {
        record5[[i]] <- 2
    }
    else if (record5[[i]] < 0.5 && record5[[i]] >= 0.3) {
        record5[[i]] <- 3
    }
    else if (record5[[i]] < 0.3 && record5[[i]] >= 0.1) {
        record5[[i]] <- 4
    }
    else {
        record5[[i]] <- 5
    }
}

record5 <- as.factor(record5)

day5.df <- data.frame(x = likely, y = fail, z = record5) # data frame

# Plots

day1.plot <- ggplot(day1.df, aes(x, y)) + 
    ggtitle('Day 1') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('firebrick2', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

day2.plot <- ggplot(day2.df, aes(x, y)) + 
    ggtitle('Day 2') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('firebrick2', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

day3.plot <- ggplot(day3.df, aes(x, y)) + 
    ggtitle('Day 3') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('firebrick2', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

day4.plot <- ggplot(day4.df, aes(x, y)) + 
    ggtitle('Day 4') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('firebrick2', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

day5.plot <- ggplot(day5.df, aes(x, y)) + 
    ggtitle('Day 5') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('firebrick2', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

multiplot(day1.plot, day2.plot, day3.plot, day4.plot, day5.plot, cols =2)
