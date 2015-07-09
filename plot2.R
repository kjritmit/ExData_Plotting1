## Plot 2: Global Active Power vs. Day

## Read in data for target period
mydata <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?", stringsAsFactors = FALSE)
targetdata <- rbind(subset(mydata, Date == "1/2/2007"), 
                    subset(mydata, Date == "2/2/2007"))

## Convert 'Date' and 'Time' to date/time formats
datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep = " "), 
                     format = "%d/%m/%Y %H:%M:%S")
targetdata$datetime <- datetime

## Make line plot
png(filename = "plot2.png", width = 480, height = 480)
plot(targetdata$Global_active_power ~ as.POSIXct(targetdata$datetime), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()



