


data <- read.table("household_power_consumption.txt", header=T, sep=";", quote="",na.strings = "?", nrows=2075260)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data <- subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime < as.POSIXct("2007-02-03 00:00:00"))

# Line Graph
png("plot2.png") # default size is 480x480
with(data, plot(Global_active_power ~ DateTime, main="", xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()