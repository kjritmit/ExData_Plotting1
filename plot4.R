## Plot 4: Four plots in one

## Read in data for target period
mydata <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?", stringsAsFactors = FALSE)
targetdata <- rbind(subset(mydata, Date == "1/2/2007"), 
                    subset(mydata, Date == "2/2/2007"))

## Convert 'Date' and 'Time' to date/time formats
datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep = " "), 
                     format = "%d/%m/%Y %H:%M:%S")
targetdata$datetime <- datetime

## Make plots.  All are parameters vs. time
png(filename = "plot4.png", width = 480, height = 480) ## Set graphics device

par(mfrow = c(2, 2))  ## Set up two rows and two columns of plots in one file.
     
     ## Plot 4a: Global Active Power
plot(targetdata$Global_active_power ~ as.POSIXct(targetdata$datetime), 
     type = "l", xlab = "", ylab = "Global Active Power")

     ## Plot 4b: Voltage
plot(targetdata$Voltage ~ as.POSIXct(targetdata$datetime), 
     type = "l", xlab = "datetime", ylab = "Voltage")

     ## Plot 4c: Sub metering
plot(targetdata$Sub_metering_1 ~ as.POSIXct(targetdata$datetime), 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(targetdata$Sub_metering_2 ~ as.POSIXct(targetdata$datetime),
      col = "red")
lines(targetdata$Sub_metering_3 ~ as.POSIXct(targetdata$datetime),
      col = "blue")
legend("topright", bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"))

     ## Plot 4d: Global reactive power
plot(targetdata$Global_reactive_power ~ as.POSIXct(targetdata$datetime), 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()  ## reset graphics device to screen (default)
  