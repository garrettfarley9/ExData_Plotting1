#Libraries
rm(list=ls())
library(readr)
library(dplyr)
library(lubridate)

#Sys.time opened
opened<-("2020-04-26 13:36:59") 

#Read in zip file
file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))

#Transform data to plot
to_plot<- select(file, Date, Time, Global_active_power)%>%
         filter(Date == "1/2/2007" | Date == "2/2/2007")
to_plot$DateTime <- strptime(paste(to_plot$Date, to_plot$Time), format="%d/%m/%Y %H:%M:%S")
to_plot$Wday <- wday(to_plot$DateTime, label=TRUE)

#Plot data
plot2<-plot(to_plot$DateTime, to_plot$Global_active_power, type = "l", lty = 1,
        ylab ="Global Active Power (kilowatts)", xlab = " ")

#Create png
dev.copy(png, file ="plot2.png")
dev.off()