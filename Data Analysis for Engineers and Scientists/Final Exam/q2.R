# q2.R

rm(list=ls())
gc()
setwd("C:/Users/Will/Desktop")

q2data = read.table("q2data.csv", header=TRUE, sep=",")

# u_intensity = mvn(data=q2data$intensity, mvnTest="mardia")
# u_intensity
# u_commerce = mvn(data=q2data$commerce, mvnTest="mardia")
# u_commerce
# u_tradition = mvn(data=q2data$tradition, mvnTest="mardia")
# u_tradition
# u_midpeasant = mvn(data=q2data$midpeasant, mvnTest="mardia")
# u_midpeasant
# u_inequality = mvn(data=q2data$inequality, mvnTest="mardia")
# u_inequality

m_q2data = mvn(data=q2data, mvnTest="mardia")
m_q2data
mvn(data=q2data, univariatePlot="qqplot")
mvn(data=q2data, univariatePlot="histogram")
mvn(data=q2data, multivariatePlot="qq")
