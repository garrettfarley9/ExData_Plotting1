#rm(list=ls())
library(readr)
library(dplyr)
library(lubridate)
opened<-("2020-04-26 13:36:59") #Sys.time

# file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))
# to_plot<- select(file, Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)%>%
#         filter(Date == "1/2/2007" | Date == "2/2/2007")
# to_plot$DateTime <- strptime(paste(to_plot$Date, to_plot$Time), format="%d/%m/%Y %H:%M:%S")
# to_plot$Wday <- wday(to_plot$DateTime, label=TRUE)
# xrange <-
color <- c("black", "red", "blue")

plot3<-plot(to_plot$DateTime, to_plot$Sub_metering_1, ylab = "Energy sub metering", xlab = " ", type = "l")

for (i in 3:5 ){
        print(i)
        meter <- subset(to_plot[,i])
        lines( meter, type="s", #to_plot$DateTime,
              lty=1, col="blue")#color[i-2]
}
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))