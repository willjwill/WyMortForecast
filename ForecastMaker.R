#######################################################
#SARIMA and ETS Modelling of Wyoming Expected Moratalities
#by County
#
#Liam Guille
#######################################################

library(forecast)
library(plyr)
library(tseries)
library(seastests)
#Dataset
dfMort<-read.csv("MonthlyCountyMortality.csv")

#Subset for counties
Albany = ts(dfMort[1], frequency=12)
Big_Horn	= ts(dfMort[2], frequency=12)
Carbon	= ts(dfMort[3], frequency=12)
Campbell = ts(dfMort[4], frequency=12)
Converse	= ts(dfMort[5], frequency=12)
Crook = ts(dfMort [6], frequency=12)
Fremont	= ts(dfMort[7], frequency=12)
Goshen	= ts(dfMort[8], frequency=12)
Hot_Springs	= ts(dfMort[9], frequency=12)
Johnson	= ts(dfMort[10], frequency=12)
Laramie	= ts(dfMort[11], frequency=12)
Lincoln	= ts(dfMort[12], frequency=12)
Natrona	= ts(dfMort[13], frequency=12)
Niobrara	= ts(dfMort[14], frequency=12)
Park	= ts(dfMort[15], frequency=12)
Platte	= ts(dfMort[16], frequency=12)
Sheridan	= ts(dfMort[17], frequency=12)
Sublette	= ts(dfMort[18], frequency=12)
Sweetwater	= ts(dfMort[19], frequency=12)
Teton	= ts(dfMort[20], frequency=12)
Uinta	= ts(dfMort[21], frequency=12)
Washakie	= ts(dfMort[22], frequency=12)
Weston= ts(dfMort[23], frequency=12)

Allcounties<-list(Albany,	Big_Horn,	Campbell,	Carbon,	Converse,	Crook,	
               Fremont,	Goshen,	Hot_Springs,	Johnson,	Laramie,	Lincoln,	
               Natrona,	Niobrara,	Park,	Platte,	Sheridan,	Sublette,	Sweetwater,	
               Teton,	Uinta,	Washakie,	Weston
)

hybridAllcounties<-lapply(Allcounties, hybridModel, models= "aen")
hybridforecastAllcounties<-lapply(hybridAllcounties, forecast, h=8)

