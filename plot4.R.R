#### Create Plot 4

# read in data set
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset only the two days I need
twoDays <- dat[dat$Date == "2007-02-01" | 
                       dat$Date == "2007-02-02", ]

twoDays$Time <- strptime(paste(twoDays$Date, twoDays$Time), format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2))

# Plot of Global Active Power by Date
plot(twoDays$Time, twoDays$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")
plot(twoDays$Time, twoDays$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(twoDays$Time, twoDays$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(twoDays$Time, twoDays$Sub_metering_2, col = "red")
lines(twoDays$Time, twoDays$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), bty = "n", cex = 0.6, lty = 1)
plot(twoDays$Time, twoDays$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()