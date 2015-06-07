library(dplyr)
data = read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")


#global active power plot
data$newDate = as.Date(data$Date, format = "%d/%m/%Y")

filtdata = data %>% filter(newDate >= as.Date("01/02/2007", format = "%d/%m/%Y") & newDate <= as.Date("02/02/2007", format = "%d/%m/%Y"))

filtdata$DateTime = paste(filtdata$Date, filtdata$Time)
filtdata$DateTime = strptime(filtdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
png(width=480, height=480, file="plot2.png")
plot(x = filtdata$DateTime, y= filtdata$Global_active_power, type = "line", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()