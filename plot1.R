library(utils)
unzip("exdata-data-household_power_consumption.zip")
power_data <- read.table("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=F, header=T)
png(file="plot1.png")
power_data_subset <- subset(power_data,  grepl("^1/2/2007", Date) | grepl("^2/2/2007", Date))
hist(power_data_subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
