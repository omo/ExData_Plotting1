library(utils)
unzip("exdata-data-household_power_consumption.zip")
power_data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F, header=T)
png(file="plot4.png")
power_data_subset <- subset(power_data,  grepl("^1/2/2007", Date) | grepl("^2/2/2007", Date))
power_data_subset$datetime <- strptime(paste(power_data_subset$Date, power_data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


with(power_data_subset, {
  par(mfrow=c(2,2), cex=0.8)
  plot(datetime,  Global_active_power, type="l", main="", ylab="Glocal Active Power", xlab="")
  plot(datetime,  Voltage, type="l", main="", ylab="Voltage")
  plot(datetime,  Sub_metering_1, type="l", main="", ylab="Energy sub metering", xlab="")
  lines(datetime,  Sub_metering_2, type="l", col="red")
  lines(datetime,  Sub_metering_3, type="l", col="blue")
  legend("topright", lty="solid", col=c("black", "red", "blue"), box.lwd=0, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime,  Global_reactive_power, type="l", main="")
})