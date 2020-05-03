rm(list=ls())
library(dplyr)
library(readr)
library(ggplot2)
opened<-("2020-04-26 13:36:59") #Sys.time

file<-read_delim("exdata_data_household_power_consumption.zip", ";", na = c("", "NA", "?"))
to_plot<-filter(file, Date == "1/2/2007" | Date == "2/2/2007")
binsize<-cut(to_plot$Global_active_power, breaks =  c(quantile(to_plot$Global_active_power, probs = seq(0,1,.2))))

p<-qplot(to_plot$Global_active_power,
         geom = "histogram",
         breaks = seq(0, 7.5, .5),
         main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)",
         ylab = "Frequency",
         fill = I("red"),
         col = I("black"),
         )

last_plot()
ggsave("plot1.png", width = 480, height = 480)

