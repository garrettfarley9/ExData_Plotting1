#rm(list=ls())
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
opened<-("2020-04-26 13:36:59") #Sys.time

#file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))

to_plot<-filter(file, Date == "1/2/2007" | Date == "2/2/2007")
d<- mutate(to_plot, Date = as.POSIXct(to_plot$Date, format = "%d/%m/%Y"))%>%
        mutate(Date = wday(Date, label=TRUE))%>%
        

g<-ggplot(data = d, aes(Time, Global_active_power))+geom_line()
        #qplot(Date, Global_active_power, data = to_plot, geom = "line")

# example df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
# wday(df$DateTime, label=TRUE)