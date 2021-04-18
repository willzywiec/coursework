# q9.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q9data = read.table("q9data.txt", header=TRUE)

small = dplyr::filter(q9data, Type=="Small")
small = small[, c(1, 2, 4, 5)]
sporty = dplyr::filter(q9data, Type=="Sporty")
sporty = sporty[, c(1, 2, 4, 5)]
compact = dplyr::filter(q9data, Type=="Compact")
compact = compact[, c(1, 2, 4, 5)]
midsize = dplyr::filter(q9data, Type=="Midsize")
midsize = midsize[, c(1, 2, 4, 5)]
large = dplyr::filter(q9data, Type=="Large")
large = large[, c(1, 2, 4, 5)]
van = dplyr::filter(q9data, Type=="Van")
van = van[, c(1, 2, 4, 5)]

fwd = dplyr::filter(q9data, DriveTrainType=="FWD")
fwd = fwd[, c(1, 2, 4, 5)]
rwd = dplyr::filter(q9data, DriveTrainType=="RWD")
rwd = rwd[, c(1, 2, 4, 5)]