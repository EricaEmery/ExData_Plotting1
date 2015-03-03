#### Create Plot 1

# read in data set
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset only the two days I need
twoDays <- dat[dat$Date == "2007-02-01" | 
                        dat$Date == "2007-02-02", ]

twoDays$Time <- strptime(paste(twoDays$Date, twoDays$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot histogram of Global Active Power
hist(twoDays$Global_active_power, main = "Global Active Power", 
                                  xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
