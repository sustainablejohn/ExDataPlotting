plot1 <- function() {
  data <- read.table("household_power_consumption.txt", nrows=2, sep=";", header=TRUE)
  varNames <- colnames(data)
  elecData <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";", header=TRUE, col.names=varNames)
  png(file="plot1.png")
  hist(elecData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}