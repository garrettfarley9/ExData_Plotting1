#rm(list=ls())
library(dplyr)
library(readr)
opened<-("2020-04-26 13:36:59") #Sys.time

file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))
to_plot<-filter(file, Date == "1/2/2007" | Date == "2/2/2007")
