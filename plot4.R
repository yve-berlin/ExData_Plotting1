
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

day <- c(rep("Fri", length(which(data[,"Date"]=="1/2/2007"))), rep("Sat", length(which(data[,"Date"]=="2/2/2007"))))
day[1] <- "Thu"

# topleft figure
plot(data[,"Global_active_power"], ylab="Global Active Power (kilowatts)",  xlab="TODO: Dates", type="l", xaxt='n', col="black")
axis(1, at=c(1, length(which(data[,"Date"]=="1/2/2007"))-1, length(data[,"Date"])), labels=c("Thu", "Fri", "Sat"))

# topright figure
plot(data[,"Voltage"], ylab="Voltage",  xlab="TODO: Dates datetimes", type="l", col="black", xaxt='n')
axis(1, at=c(1, length(which(data[,"Date"]=="1/2/2007"))-1, length(data[,"Date"])), labels=c("Thu", "Fri", "Sat"))

# bottomleft figure
plot(data[,"Sub_metering_1"],  ylab="Energy sub metering",  xlab=" TODO Dates", type="l", col="black", xaxt='n')
axis(1, at=c(1, length(which(data[,"Date"]=="1/2/2007"))-1, length(data[,"Date"])), labels=c("Thu", "Fri", "Sat"))
lines(data[,"Sub_metering_2"], lty=1, col="red")
lines(data[,"Sub_metering_3"], lty=1, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

# bottomright figure
plot(data[,"Global_reactive_power"], ylab="Global_reactive_power",  xlab="TODO: Dates datetimes", type="l", col="black", xaxt='n')
axis(1, at=c(1, length(which(data[,"Date"]=="1/2/2007"))-1, length(data[,"Date"])), labels=c("Thu", "Fri", "Sat"))
dev.off()