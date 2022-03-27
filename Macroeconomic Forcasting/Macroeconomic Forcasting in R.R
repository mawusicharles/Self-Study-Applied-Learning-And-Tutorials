# --------------------------------------------------------------------------------------------------------------
                               # Macroeconomic Forecasting in R 
# --------------------------------------------------------------------------------------------------------------

# Install(Tidyverse, ggplot2, timetk, forcast) and load data 

library(tidyverse)
library(ggplot2)
library(timetk)
library(dplyr)
library(forecast)

ARMA_et<-read.csv(file = file.choose(), sep = " , ", header = T)
head(ARMA_et)
sum(is.null(ARMA_et))

# Plot time series graph 

ARMA_et %>% plot.ts() %>% abline(h=mean(ARMA_et$et), col="red")

mean(ARMA_et$et) # mean of the series 
sd(ARMA_et$et)   # Standard deviation of the series 

# Generating an AR process yt  = 3.0 + 0.55 yt-1 + et; y0 = 0

st.seed(16)

y_AR<-as.vector(1)
y_AR[1]<-0
n=500
for (i in 2:500){
  y_AR[i]<-3 + 0.55*(y_AR[i-1])+ARMA_et$et[i]
}
head(y_AR[5]) # fifth element 

# Generating an MA process  yt = -2.5 + et + 0.70 et-1 

y_MA<-as.vector(1)
y_MA[1]<-0
n=500
for (i in 2:500){
  y_MA[i]<--2.5 + ARMA_et$et[i]+0.7*ARMA_et$et[i-1]
}
y_MA[5]
 
# Plot the ACF and PAC for the AR(1) and MA(1) Processes 


par(mfrow =c(2, 2))
ts.plot(y_AR)
afc
ts.plot(y_MA)
