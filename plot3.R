


data <- read.table("household_power_consumption.txt", header=T, sep=";", quote="",na.strings = "?", nrows=2075260)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data <- subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime < as.POSIXct("2007-02-03 00:00:00"))

# Line Graph
png("plot3.png") # default size is 480x480
with(data, plot(Sub_metering_1 ~ DateTime, main="", xlab="", ylab="Energy sub metering",type="n"))
with(data, lines(Sub_metering_1 ~ DateTime, col="black"))
with(data, lines(Sub_metering_2 ~ DateTime, col="red"))
with(data, lines(Sub_metering_3 ~ DateTime, col="blue"))
legend("topright",lwd=1,col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
