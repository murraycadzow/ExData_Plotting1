library(dplyr)
data = read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")


#global active power plot
data$newDate = as.Date(data$Date, format = "%d/%m/%Y")

filtdata = data %>% filter(newDate >= as.Date("01/02/2007", format = "%d/%m/%Y") & newDate <= as.Date("02/02/2007", format = "%d/%m/%Y"))

filtdata$DateTime = paste(filtdata$Date, filtdata$Time)
filtdata$DateTime = strptime(filtdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(width=480, height=480, file="plot3.png")
plot(x=filtdata$DateTime, y= filtdata$Sub_metering_1, type = "line", xlab="", ylab="Energy sub metering")
points(x=filtdata$DateTime, y= filtdata$Sub_metering_2, type = "line", col="red")
points(x=filtdata$DateTime, y= filtdata$Sub_metering_3, type = "line", col="blue")
legend(x="right",y=30,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"),)
dev.off()