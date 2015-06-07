library(dplyr)
data = read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings = "?")


#global active power plot
data$newDate = as.Date(data$Date, format = "%d/%m/%Y")
#data$Time = strptime(data$Time, format = "%H:%M:%S")
filtdata = data %>% filter(newDate >= as.Date("01/02/2007", format = "%d/%m/%Y") & newDate <= as.Date("02/02/2007", format = "%d/%m/%Y"))


png(width=480, height=480, file="plot1.png")
hist(filtdata$Global_active_power, col="red", ylab = "Frequency", xlab="Global ACtive Power (kilowatts)")
dev.off()