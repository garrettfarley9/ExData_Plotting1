rm(list=ls())
library(dplyr)
opened<-("2020-04-26 13:36:59") #Sys.time
colname<-read.table("household_power_consumption.txt", sep = ";", nrows = 1, 
                    stringsAsFactors = FALSE, header = TRUE)
dat<-read.table("household_power_consumption.txt", sep = ";", 
                skip = grep("[01]/[02]/[2007]", readLines("household_power_consumption.txt")), nrows = 2879 )

