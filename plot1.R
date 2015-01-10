


data <- read.table("household_power_consumption.txt", header=T, sep=";", quote="",na.strings = "?", nrows=2075260)
data$DateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data <- subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime < as.POSIXct("2007-02-03 00:00:00"))

# Histogram
png("plot1.png") # default size is 480x480
with(data, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))
dev.off()
