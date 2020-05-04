#Libraries
rm(list=ls())
library(readr)
library(dplyr)
library(lubridate)

#Sys.time opened file
opened<-("2020-04-26 13:36:59") 

#Read in data from zip file
file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))

#Transform data for specific date and format
to_plot<- select(file, Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)%>%
        filter(Date == "1/2/2007" | Date == "2/2/2007")
to_plot$DateTime <- strptime(paste(to_plot$Date, to_plot$Time), format="%d/%m/%Y %H:%M:%S")
to_plot$Wday <- wday(to_plot$DateTime, label=TRUE)

#Create plot and add lines
plot3<-plot(to_plot$DateTime, to_plot$Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l")
lines(to_plot$DateTime, to_plot$Sub_metering_3, col = "blue", type = "s")
lines(to_plot$DateTime, to_plot$Sub_metering_2, col = "red", type = "s")

#Add the legend
color <- c("black", "red", "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = .55, col = color, lty = 1 )

#Create png for plot
dev.copy(png, file ="plot3.png")
dev.off()