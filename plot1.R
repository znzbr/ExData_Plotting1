par(mfrow = c(1, 1))
alldata <- read.table("household_power_consumption.txt", header = T, sep = ";")
alldata$Global_active_power <- as.numeric(as.character(alldata$Global_active_power))
alldata$Date_parsed <- strptime(paste(as.character(alldata$Date), as.character(alldata$Time), sep = " "), "%d/%m/%Y %H:%M:%S")

mydata <- alldata[alldata$Date_parsed >= "2007-02-01" & alldata$Date_parsed < "2007-02-03",]
mydata <- na.omit(mydata)

hist(mydata$Global_active_power, xlab = "Global active power (kilowats)", main = "Global active power", col = "red")

dev.copy(png, file = "plot1.png")
dev.off()