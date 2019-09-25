# Read data

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, na.strings = "?")

# Subset requested dates

subsetdata <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

# Convert dates and time, combine in 1 variable

subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

## Plot to png

png("plot2.png", width=480, height=480)

with(subsetdata, plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab=""))

dev.off()
