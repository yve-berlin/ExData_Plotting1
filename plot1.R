# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
# 16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000
# 16/12/2006;17:26:00;5.374;0.498;233.290;23.000;0.000;2.000;17.000

# read data
data <- read.delim("household_power_consumption.txt", sep=";")
# filter needed dates
data[,"Date"] <- as.character(data[,"Date"])
data <- data[which((data[,"Date"]=="1/2/2007")|(data[,"Date"]=="2/2/2007")),]

data[,"Global_active_power"] <- as.numeric(as.character(data[,"Global_active_power"]))

png("plot1.png", width=480, height=480)
hist(data[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()