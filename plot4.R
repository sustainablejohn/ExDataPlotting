plot4 <- function() {
  data <- read.table("household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  varNames <- colnames(data)
  elecData <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=varNames)
  elecData[,1] <- as.Date(elecData[,1],"%d/%m/%Y")
  elecData[,10] <- as.POSIXct(paste(elecData$Date, elecData$Time), "%d/%m/%Y %H:%M:%S")
  png(file="plot4.png")
  par(mfrow=c(2,2))
  with(elecData, {
    plot(elecData$V10, elecData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(elecData$V10, elecData$Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(elecData$V10, elecData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    points(elecData$V10, elecData$Sub_metering_2, type="l", col="red")
    points(elecData$V10, elecData$Sub_metering_3, type="l", col="blue")
    legend("topright", bty="n", col=c("black","red","blue"), lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(elecData$V10, elecData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  })
  dev.off()
}