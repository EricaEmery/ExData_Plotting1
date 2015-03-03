#### Create Plot 3

# read in data set
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset only the two days I need
twoDays <- dat[dat$Date == "2007-02-01" | 
                       dat$Date == "2007-02-02", ]

twoDays$Time <- strptime(paste(twoDays$Date, twoDays$Time), format = "%Y-%m-%d %H:%M:%S")

plot(twoDays$Time, twoDays$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(twoDays$Time, twoDays$Sub_metering_2, col = "red")
lines(twoDays$Time, twoDays$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                col = c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png")
dev.off()