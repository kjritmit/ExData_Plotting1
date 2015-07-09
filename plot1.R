## Plot 1: Global Active Power histogram

## Read data
mydata <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?", stringsAsFactors = FALSE)
targetdata <- rbind(subset(mydata, Date == "1/2/2007"), 
                    subset(mydata, Date == "2/2/2007"))

## Make histogram
png(filename = "plot1.png", 
    width = 480, height = 480)
hist(targetdata$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
