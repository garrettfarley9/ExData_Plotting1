#Libraries
rm(list=ls())
library(dplyr)
library(readr)
library(ggplot2)

#Sys.time opened
opened<-("2020-04-26 13:36:59") 

#Read in zip file
file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))

#Transform data to plot
to_plot<-filter(file, Date == "1/2/2007" | Date == "2/2/2007")

#Plot data
p<-qplot(to_plot$Global_active_power,
         geom = "histogram",
         breaks = seq(0, 7.5, .5),
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)",
         ylab = "Frequency",
         fill = I("red"),
         col = I("black"),
         )

#Create png
last_plot()
ggsave("plot1.png", width = 480, height = 480)

