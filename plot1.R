library(data.table)
library(lubridate)

## Calculte the rough memory needed to load the data
rough_memory <- 2075259 * 9 * 8

## read the data
data <- fread("household_power_consumption.txt", skip = "1/2/2007", nrows = 2880)

## Cheack if the data right
head(data)
tail(data)

## Give names to column
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
## Convert Date and Time
data$Date <- dmy(data$Date)
data$Time <- strptime(data$Time)


## Make the histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (in kilowatt)")
dev.copy(png, file = "plot1.png")
dev.off()
