
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# read data
data <- read.delim("household_power_consumption.txt", sep=";")
data[,"Date"] <- as.character(data[,"Date"])
data <- data[which((data[,"Date"]=="1/2/2007")|(data[,"Date"]=="2/2/2007")),]

data[,"Global_active_power"] <- as.numeric(as.character(data[,"Global_active_power"]))
data[,"Sub_metering_1"] <- as.numeric(as.character(data[,"Sub_metering_1"]))
data[,"Sub_metering_2"] <- as.numeric(as.character(data[,"Sub_metering_2"]))
data[,"Sub_metering_3"] <- as.numeric(as.character(data[,"Sub_metering_3"]))
data[,"Voltage"] <- as.numeric(as.character(data[,"Voltage"]))
data[,"Global_reactive_power"] <- as.numeric(as.character(data[,"Global_reactive_power"]))

time <- paste(data[,"Date"], data[,"Time"], sep=" ")
time <- strptime(time, format="%d/%m/%Y %H:%M:%S")

# topleft figure
plot(time, data[,"Global_active_power"], ylab="Global Active Power (kilowatts)",  xlab="", type="l", col="black")

# topright figure
plot(time, data[,"Voltage"], ylab="Voltage",  xlab="datetime", type="l", col="black")

# bottomleft figure
plot(time, data[,"Sub_metering_1"],  ylab="Energy sub metering",  xlab="", type="l", col="black")
lines(time, data[,"Sub_metering_2"], lty=1, col="red")
lines(time, data[,"Sub_metering_3"], lty=1, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

# bottomright figure
plot(time, data[,"Global_reactive_power"], ylab="Global_reactive_power",  xlab="datetime", type="l", col="black")
dev.off()