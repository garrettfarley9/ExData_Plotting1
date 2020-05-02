#rm(list=ls())
library(dplyr)
library(readr)
opened<-("2020-04-26 13:36:59") #Sys.time
#h<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

file<-read_delim("household_power_consumption.txt", delim=";", na = c("", "?", "NA"))
to_plot<- filter(file, Date == "02/01/2007" | Date == "02/02/2007")


