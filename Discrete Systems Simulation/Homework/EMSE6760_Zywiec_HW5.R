rm(list = ls())
gc()
library(forecast)
setwd("/Users/Will/Downloads")
Plant <- read.csv(file = "PowerPlant.csv", head=TRUE)

Forecast <- data.frame(Location=as.numeric(), Month=as.numeric(), SafetyWalk=as.numeric(), SafetyInspection=as.numeric(), WorkActivityObservation=as.numeric(), Hours=as.numeric(), Incidents=as.numeric())

k <- 0

for (i in 1:max(Plant$Location)) {
  for (j in 1:6) {
    k = k + 1
    NewPlant <- Plant[Plant$Location==i,]
  ###########################################################################
    Month <- 60 + j
  ###########################################################################
    SafetyWalkFit = auto.arima(NewPlant$SafetyWalk)
    NewSafetyWalk = as.data.frame(forecast(SafetyWalkFit, 6))
    SafetyWalkForecast = as.numeric(NewSafetyWalk[j,1])
  ###########################################################################  
    SafetyInspectionFit = auto.arima(NewPlant$SafetyInspection)
    NewSafetyInspection = as.data.frame(forecast(SafetyInspectionFit, 6))
    SafetyInspectionForecast = as.numeric(NewSafetyInspection[j,1])
  ###########################################################################  
    WAOFit = auto.arima(NewPlant$WorkActivityObservation)
    NewWAO = as.data.frame(forecast(WAOFit, 6))
    WAOForecast = as.numeric(NewWAO[j,1])
  ###########################################################################
    HoursFit = auto.arima(NewPlant$Hours)
    NewHours = as.data.frame(forecast(HoursFit, 6))
    HoursForecast = as.numeric(NewHours[j,1])
  ###########################################################################
    Forecast[nrow(Forecast)+1,] = c(i,Month,SafetyWalkForecast,SafetyInspectionForecast,WAOForecast,HoursForecast,NA)
  #############################################################################################################  
    Fit = lm(Incidents ~ SafetyWalk + SafetyInspection + WorkActivityObservation + Hours, data = NewPlant)
    #summary(Fit)
    NewIncidents = predict(Fit,Forecast[k,c(3:6)])
    Forecast$Incidents[k] = NewIncidents
  }
}

Risk <- Forecast[order(-Forecast$Incidents),]
Fit
