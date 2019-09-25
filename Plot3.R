# Read data

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, na.strings = "?")

# Subset requested dates

subsetdata <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

# Convert dates and time, combine in 1 variable

subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

## Plot to png

png("plot3.png", width=480, height=480)

with(subsetdata,{
  plot(Sub_metering_1~datetime, type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime, col="red")
  lines(Sub_metering_3~datetime, col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()
