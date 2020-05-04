rm(list=ls())
library(readr)
library(dplyr)
library(lubridate)
opened<-("2020-04-26 13:36:59") #Sys.time

file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))
to_plot<-filter(Date == "1/2/2007" | Date == "2/2/2007")
to_plot$DateTime <- strptime(paste(to_plot$Date, to_plot$Time), format="%d/%m/%Y %H:%M:%S")
to_plot$Wday <- wday(to_plot$DateTime, label=TRUE)

color <- c("black", "red", "blue")
par(mfrow = c(2,2))

#plot[1,1]
plot1_1<-plot(to_plot$DateTime, to_plot$Global_active_power, type = "l", lty = 1,
            ylab ="Global Active Power (kilowatts)", xlab = " ")
plot2_1<-plot(to_plot$DateTime, to_plot$Voltage, type = "l", lty = 1, ylab = "Voltage", xlab = "datetime")
plot1_2<-plot()
plot2_2<-plot(to_plot$DateTime, to_plot$Global_reactive_power, type = "l", xlab = "datetime")
