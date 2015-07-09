## Plot 3: Submetering data vs. time

## Read in data for target period
mydata <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?", stringsAsFactors = FALSE)
targetdata <- rbind(subset(mydata, Date == "1/2/2007"), 
                    subset(mydata, Date == "2/2/2007"))

## Convert 'Date' and 'Time' to date/time formats
datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep = " "), 
                     format = "%d/%m/%Y %H:%M:%S")
targetdata$datetime <- datetime

## Make line plot of submetering time series (3 data series)
png(filename = "plot3.png", width = 480, height = 480)
plot(targetdata$Sub_metering_1 ~ as.POSIXct(targetdata$datetime), 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(targetdata$Sub_metering_2 ~ as.POSIXct(targetdata$datetime),
      col = "red")
lines(targetdata$Sub_metering_3 ~ as.POSIXct(targetdata$datetime),
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))
dev.off()