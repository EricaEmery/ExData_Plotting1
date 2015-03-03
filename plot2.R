#### Create Plot 2

# read in data set
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset only the two days I need
twoDays <- dat[dat$Date == "2007-02-01" | 
                       dat$Date == "2007-02-02", ]

twoDays$Time <- strptime(paste(twoDays$Date, twoDays$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot of Global Active Power by Date
plot(twoDays$Time, twoDays$Global_active_power, type = "l", 
                xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
