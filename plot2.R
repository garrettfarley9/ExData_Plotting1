rm(list=ls())
library(readr)
library(dplyr)
library(lubridate)
opened<-("2020-04-26 13:36:59") #Sys.time

 file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))
 to_plot<- select(file, Date, Time, Global_active_power)%>%
         filter(Date == "1/2/2007" | Date == "2/2/2007")
to_plot$DateTime <- strptime(paste(to_plot$Date, to_plot$Time), format="%d/%m/%Y %H:%M:%S")
to_plot$Wday <- wday(to_plot$DateTime, label=TRUE)
plot2<-plot(to_plot$DateTime, to_plot$Global_active_power, type = "l", lty = 1,
        ylab ="Global Active Power (kilowatts)", xlab = " ")

dev.copy(png, file ="plot2.png")
dev.off()