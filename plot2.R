par(mfrow = c(1, 1))
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";")
alldata$Date_parsed <- strptime(paste(as.character(alldata$Date), as.character(alldata$Time), sep = " "), "%d/%m/%Y %H:%M:%S")

mydata <- alldata[alldata$Date_parsed >= "2007-02-01" & alldata$Date_parsed < "2007-02-03",]
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))
mydata <- na.omit(mydata)

plot(mydata$Date_parsed, mydata$Global_active_power, type = "l", xlab = "", ylab = "Global active power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()