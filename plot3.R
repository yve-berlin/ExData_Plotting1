# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
# 16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000
# 16/12/2006;17:26:00;5.374;0.498;233.290;23.000;0.000;2.000;17.000

data <- read.delim("household_power_consumption.txt", sep=";")
data[,"Date"] <- as.character(data[,"Date"])
data <- data[which((data[,"Date"]=="1/2/2007")|(data[,"Date"]=="2/2/2007")),]

data[,"Sub_metering_1"] <- as.numeric(as.character(data[,"Sub_metering_1"]))
data[,"Sub_metering_2"] <- as.numeric(as.character(data[,"Sub_metering_2"]))
data[,"Sub_metering_3"] <- as.numeric(as.character(data[,"Sub_metering_3"]))

time <- paste(data[,"Date"], data[,"Time"], sep=" ")
time <- strptime(time, format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(time, data[,"Sub_metering_1"],  ylab="Energy sub metering",  xlab="", type="l", col="black")
lines(time, data[,"Sub_metering_2"], lty=1, col="red")
lines(time, data[,"Sub_metering_3"], lty=1, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()