par(mfrow = c(1, 1))
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";")
alldata$Date_parsed <- strptime(paste(as.character(alldata$Date), as.character(alldata$Time), sep = " "), "%d/%m/%Y %H:%M:%S")

mydata <- alldata[alldata$Date_parsed >= "2007-02-01" & alldata$Date_parsed < "2007-02-03",]
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))

mydata <- na.omit(mydata)

plot(mydata$Date_parsed, mydata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy submetering")
points(mydata$Date_parsed, mydata$Sub_metering_1, type = "l", col = "black")
points(mydata$Date_parsed, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$Date_parsed, mydata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, width = 200)

dev.copy(png, file = "plot3.png", width = 1200, height = 900)
dev.off()