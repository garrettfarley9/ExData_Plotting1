#Libraries
rm(list=ls())
library(readr)
library(dplyr)
library(lubridate)

#Sys.time file opened
opened<-("2020-04-26 13:36:59") 

#Read in zip file
file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))

#Transform data to plot
to_plot<-select(file, -6)%>%
        filter(Date == "1/2/2007" | Date == "2/2/2007")
to_plot$DateTime <- strptime(paste(to_plot$Date, to_plot$Time), format="%d/%m/%Y %H:%M:%S")
to_plot$Wday <- wday(to_plot$DateTime, label=TRUE)

color <- c("black", "red", "blue")
par(mfrow = c(2,2))

#plot[1,1]
plot1_1<-plot(to_plot$DateTime, to_plot$Global_active_power, type = "l", lty = 1,
            ylab ="Global Active Power (kilowatts)", xlab = " ")

#plot[2,1]
plot2_1<-plot(to_plot$DateTime, to_plot$Voltage, type = "l", lty = 1, ylab = "Voltage", xlab = "datetime")

#plot[1,2]
plot1_2<-plot(to_plot$DateTime, to_plot$Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l")
lines(to_plot$DateTime, to_plot$Sub_metering_3, col = "blue", type = "s")
lines(to_plot$DateTime, to_plot$Sub_metering_2, col = "red", type = "s")
par(mar = c(4,4,2,2))

        #Add the legend
        color <- c("black", "red", "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               cex = .4, col = color, lty = 1 )

#plot[2,2]
plot2_2<-plot(to_plot$DateTime, to_plot$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Create png for plot
dev.copy(png, file ="plot4.png")
dev.off()