# Will Zywiec
#
# Johns Hopkins University
# Foundations of Modeling and Simulation
#
# TSA Project
# Part 2a

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

# Vectors

record1 <- c(0.002, 0, 0.001, 0.001, 0.002, 0.001, 0.001, 0.001, 0.003, 0.003, 0.002, 0.004, 0.008, 0.013, 0.026, 0.002, 0.002, 0.002, 0.001, 0.002, 0.001, 0.001, 0.002, 0.001, 0.004, 0.003, 0.005, 0.006, 0.016, 0.025, 0.001, 0.002, 0.001, 0.001, 0.002, 0.002, 0.001, 0.002, 0.002, 0.003, 0.003, 0.005, 0.007, 0.017, 0.032, 0.003, 0.002, 0.003, 0.002, 0.003, 0.002, 0.004, 0.002, 0.003, 0.004, 0.005, 0.006, 0.013, 0.017, 0.031, 0.002, 0.002, 0.003, 0.003, 0.005, 0.003, 0.003, 0.004, 0.003, 0.009, 0.006, 0.008, 0.014, 0.022, 0.035, 0.005, 0.003, 0.003, 0.003, 0.005, 0.004, 0.006, 0.008, 0.006, 0.006, 0.006, 0.01, 0.015, 0.022, 0.039, 0.004, 0.004, 0.005, 0.007, 0.005, 0.006, 0.007, 0.007, 0.007, 0.009, 0.008, 0.012, 0.018, 0.024, 0.042, 0.007, 0.007, 0.007, 0.008, 0.012, 0.01, 0.01, 0.011, 0.01, 0.012, 0.011, 0.015, 0.023, 0.033, 0.041
)

record2 <- c(0, 0.001, 0, 0, 0, 0, 0.001, 0, 0.001, 0.001, 0.001, 0.003, 0.004, 0.009, 0.021, 0.001, 0, 0.001, 0.001, 0.001, 0.001, 0, 0.001, 0.001, 0.001, 0.002, 0.003, 0.005, 0.013, 0.024, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.001, 0.001, 0.002, 0.005, 0.008, 0.013, 0.026, 0.001, 0.001, 0.002, 0.001, 0.001, 0.001, 0.002, 0.002, 0.002, 0.002, 0.004, 0.005, 0.01, 0.015, 0.028, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.002, 0.005, 0.005, 0.01, 0.021, 0.026, 0.003, 0.003, 0.002, 0.004, 0.003, 0.003, 0.005, 0.003, 0.003, 0.004, 0.006, 0.007, 0.012, 0.018, 0.031, 0.004, 0.004, 0.004, 0.004, 0.004, 0.005, 0.005, 0.005, 0.006, 0.005, 0.008, 0.009, 0.013, 0.02, 0.035, 0.006, 0.007, 0.008, 0.005, 0.007, 0.007, 0.006, 0.008, 0.008, 0.009, 0.013, 0.013, 0.018, 0.022, 0.037
)

record3 <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.001, 0.002, 0.005, 0.008, 0.02, 0, 0, 0.001, 0, 0, 0, 0, 0.001, 0, 0.001, 0.001, 0.002, 0.006, 0.009, 0.025, 0.001, 0, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.004, 0.006, 0.01, 0.02, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.002, 0.001, 0.002, 0.001, 0.003, 0.004, 0.007, 0.011, 0.023, 0.001, 0.001, 0.002, 0.002, 0.002, 0.002, 0.001, 0.002, 0.002, 0.002, 0.002, 0.004, 0.007, 0.016, 0.025, 0.003, 0.002, 0.002, 0.002, 0.002, 0.003, 0.002, 0.003, 0.003, 0.003, 0.004, 0.006, 0.01, 0.017, 0.027, 0.004, 0.002, 0.002, 0.003, 0.003, 0.004, 0.003, 0.004, 0.004, 0.005, 0.007, 0.009, 0.015, 0.02, 0.029, 0.005, 0.005, 0.005, 0.006, 0.005, 0.006, 0.005, 0.006, 0.006, 0.006, 0.009, 0.012, 0.016, 0.022, 0.03
)

record4 <- c(0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.003, 0.003, 0.007, 0.013, 0.025, 0, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.005, 0.004, 0.009, 0.013, 0.028, 0.001, 0.001, 0.001, 0.002, 0.001, 0.002, 0.001, 0.002, 0.001, 0.002, 0.003, 0.005, 0.008, 0.016, 0.034, 0.001, 0.001, 0.003, 0.002, 0.002, 0.002, 0.001, 0.002, 0.002, 0.002, 0.003, 0.006, 0.011, 0.018, 0.028, 0.002, 0.002, 0.002, 0.002, 0.003, 0.003, 0.002, 0.003, 0.005, 0.003, 0.005, 0.007, 0.011, 0.018, 0.034, 0.003, 0.003, 0.002, 0.003, 0.003, 0.003, 0.004, 0.004, 0.005, 0.008, 0.005, 0.01, 0.014, 0.02, 0.033, 0.004, 0.005, 0.005, 0.005, 0.005, 0.005, 0.006, 0.005, 0.006, 0.007, 0.009, 0.013, 0.015, 0.019, 0.039, 0.008, 0.008, 0.007, 0.008, 0.006, 0.007, 0.007, 0.01, 0.01, 0.011, 0.01, 0.015, 0.019, 0.028, 0.039
)

record5 <- c(0, 0.001, 0.001, 0.001, 0.001, 0.003, 0.001, 0.001, 0.002, 0.001, 0.002, 0.004, 0.007, 0.017, 0.029, 0.001, 0.001, 0.002, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.002, 0.002, 0.003, 0.009, 0.012, 0.034, 0.001, 0.001, 0.002, 0.002, 0.002, 0.002, 0.001, 0.002, 0.003, 0.003, 0.002, 0.005, 0.009, 0.017, 0.032, 0.003, 0.002, 0.001, 0.002, 0.004, 0.002, 0.002, 0.002, 0.003, 0.003, 0.004, 0.006, 0.011, 0.02, 0.03, 0.002, 0.003, 0.002, 0.002, 0.003, 0.004, 0.003, 0.003, 0.004, 0.004, 0.006, 0.009, 0.015, 0.019, 0.031, 0.003, 0.003, 0.003, 0.003, 0.003, 0.003, 0.007, 0.004, 0.005, 0.007, 0.008, 0.01, 0.014, 0.021, 0.038, 0.005, 0.006, 0.005, 0.005, 0.005, 0.005, 0.007, 0.008, 0.007, 0.009, 0.009, 0.012, 0.017, 0.027, 0.042, 0.007, 0.008, 0.007, 0.007, 0.009, 0.008, 0.011, 0.01, 0.012, 0.011, 0.013, 0.016, 0.025, 0.025, 0.049
)

record <- vector()
dev <- vector()
ave <- vector()

for (i in 1:length(record1)) {
	record <- c(record, max(record1[[i]], record2[[i]], record3[[i]], record4[[i]], record5[[i]]))
    temp <- c(record1[[i]], record2[[i]], record3[[i]], record4[[i]], record5[[i]])
    dev <- c(dev, sd(temp))
    ave <- c(ave, mean(temp))
}

record <- record * 100
dev <- dev * 100
dev3 <- dev * 3
ave <- ave * 100
avedev <- ave + dev
avedev3 <- ave + dev3

for (i in 1:length(record)) {
    if (record[[i]] > 1) {
        record[[i]] <- 0
    }
    else if (record[[i]] <= 1 && record[[i]] >= 0.7) {
        record[[i]] <- 1
    }
    else if (record[[i]] < 0.7 && record[[i]] >= 0.5) {
        record[[i]] <- 2
    }
    else if (record[[i]] < 0.5 && record[[i]] >= 0.3) {
        record[[i]] <- 3
    }
    else if (record[[i]] < 0.3 && record[[i]] >= 0.1) {
        record[[i]] <- 4
    }
    else {
        record[[i]] <- 5
    }
}

record <- as.factor(record)

day.df <- data.frame(x = likely, y = fail, z = record) # data frame

# Standard Deviation

for (i in 1:length(dev)) {
    if (dev[[i]] > 1) {
        dev[[i]] <- 0
    }
    else if (dev[[i]] <= 1 && dev[[i]] >= 0.7) {
        dev[[i]] <- 1
    }
    else if (dev[[i]] < 0.7 && dev[[i]] >= 0.5) {
        dev[[i]] <- 2
    }
    else if (dev[[i]] < 0.5 && dev[[i]] >= 0.3) {
        dev[[i]] <- 3
    }
    else if (dev[[i]] < 0.3 && dev[[i]] >= 0.1) {
        dev[[i]] <- 4
    }
    else {
        dev[[i]] <- 5
    }
}

for (i in 1:length(dev3)) {
    if (dev3[[i]] > 1) {
        dev3[[i]] <- 0
    }
    else if (dev3[[i]] <= 1 && dev3[[i]] >= 0.7) {
        dev3[[i]] <- 1
    }
    else if (dev3[[i]] < 0.7 && dev3[[i]] >= 0.5) {
        dev3[[i]] <- 2
    }
    else if (dev3[[i]] < 0.5 && dev3[[i]] >= 0.3) {
        dev3[[i]] <- 3
    }
    else if (dev3[[i]] < 0.3 && dev3[[i]] >= 0.1) {
        dev3[[i]] <- 4
    }
    else {
        dev3[[i]] <- 5
    }
}

dev <- as.factor(dev)
dev3 <- as.factor(dev3)

dev.df <- data.frame(x = likely, y = fail, z = dev) # data frame
dev3.df <- data.frame(x = likely, y = fail, z = dev3) # data frame

# Mean

for (i in 1:length(ave)) {
    if (ave[[i]] > 1) {
        ave[[i]] <- 0
    }
    else if (ave[[i]] <= 1 && ave[[i]] >= 0.7) {
        ave[[i]] <- 1
    }
    else if (ave[[i]] < 0.7 && ave[[i]] >= 0.5) {
        ave[[i]] <- 2
    }
    else if (ave[[i]] < 0.5 && ave[[i]] >= 0.3) {
        ave[[i]] <- 3
    }
    else if (ave[[i]] < 0.3 && ave[[i]] >= 0.1) {
        ave[[i]] <- 4
    }
    else {
        ave[[i]] <- 5
    }
}

for (i in 1:length(avedev)) {
    if (avedev[[i]] > 1) {
        avedev[[i]] <- 0
    }
    else if (avedev[[i]] <= 1 && avedev[[i]] >= 0.7) {
        avedev[[i]] <- 1
    }
    else if (avedev[[i]] < 0.7 && avedev[[i]] >= 0.5) {
        avedev[[i]] <- 2
    }
    else if (avedev[[i]] < 0.5 && avedev[[i]] >= 0.3) {
        avedev[[i]] <- 3
    }
    else if (avedev[[i]] < 0.3 && avedev[[i]] >= 0.1) {
        avedev[[i]] <- 4
    }
    else {
        avedev[[i]] <- 5
    }
}

for (i in 1:length(avedev3)) {
    if (avedev3[[i]] > 1) {
        avedev3[[i]] <- 0
    }
    else if (avedev3[[i]] <= 1 && avedev3[[i]] >= 0.7) {
        avedev3[[i]] <- 1
    }
    else if (avedev3[[i]] < 0.7 && avedev3[[i]] >= 0.5) {
        avedev3[[i]] <- 2
    }
    else if (avedev3[[i]] < 0.5 && avedev3[[i]] >= 0.3) {
        avedev3[[i]] <- 3
    }
    else if (avedev3[[i]] < 0.3 && avedev3[[i]] >= 0.1) {
        avedev3[[i]] <- 4
    }
    else {
        avedev3[[i]] <- 5
    }
}

ave <- as.factor(ave)
avedev <- as.factor(avedev)
avedev3 <- as.factor(avedev3)

ave.df <- data.frame(x = likely, y = fail, z = ave) # data frame
avedev.df <- data.frame(x = likely, y = fail, z = avedev) # data frame
avedev3.df <- data.frame(x = likely, y = fail, z = avedev3) # data frame

# Plot

day.plot <- ggplot(day.df, aes(x, y)) + 
    ggtitle('Maxima') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('firebrick2', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

dev.plot <- ggplot(dev.df, aes(x, y)) + 
    ggtitle('Standard Deviation') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

dev3.plot <- ggplot(dev3.df, aes(x, y)) + 
    ggtitle(expression(bold(paste('3', sigma)))) +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('turquoise3', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'))

ave.plot <- ggplot(ave.df, aes(x, y)) + 
    ggtitle('Mean') +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('turquoise3', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'), plot.title = element_text(face = 'bold'))

avedev.plot <- ggplot(avedev.df, aes(x, y)) + 
    ggtitle(expression(bold(paste('Mean + ', sigma)))) +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('turquoise3', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'))

avedev3.plot <- ggplot(avedev3.df, aes(x, y)) + 
    ggtitle(expression(bold(paste('Mean + 3', sigma)))) +
    geom_tile(aes(fill = z)) +
    xlab('Time Delay (min)') +
    ylab('Alarm Rate (%)') +
    scale_fill_manual(name = '>30-min', breaks = c('0', '1', '2', '3', '4', '5'), labels = c('>1%', '0.7-1%', '0.5-0.7%', '0.3-0.5%', '0.1-0.3%', '<0.1%'), values = c('turquoise3', 'gray35', 'gray25', 'gray15', 'gray5', 'black')) +
    theme(legend.title = element_text(face = 'bold'))

multiplot(day.plot, dev.plot, dev3.plot, ave.plot, avedev.plot, avedev3.plot, cols =2)
