plot2 <- function() {
  data <- read.table("household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  varNames <- colnames(data)
  elecData <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=varNames)
  elecData[,1] <- as.Date(elecData[,1],"%d/%m/%Y")
  elecData[,10] <- as.POSIXct(paste(elecData$Date, elecData$Time), "%d/%m/%Y %H:%M:%S")
  png(file="plot2.png")
  plot(elecData$V10, elecData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}