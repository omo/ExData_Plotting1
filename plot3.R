library(utils)
unzip("exdata-data-household_power_consumption.zip")
power_data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F, header=T)
png(file="plot3.png")
power_data_subset <- subset(power_data,  grepl("^1/2/2007", Date) | grepl("^2/2/2007", Date))
power_data_subset$DateTime <- strptime(paste(power_data_subset$Date, power_data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

with(power_data_subset, {
  plot(DateTime,  Sub_metering_1, type="l", main="", ylab="Energy sub metering", xlab="")
  lines(DateTime,  Sub_metering_2, type="l", col="red")
  lines(DateTime,  Sub_metering_3, type="l", col="blue")
  legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  })