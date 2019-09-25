# Read data

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, na.strings = "?")

# Subset requested dates

subsetdata <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

# Convert dates and time, combine in 1 variable

subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

## Plot to png

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(subsetdata,{
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Sub_metering_1~datetime, type="l",ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~datetime, col="red")
    lines(Sub_metering_3~datetime, col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=3, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  plot(Voltage~datetime, type="l",
         ylab="Voltage (volt)", xlab="datetime")
  plot(Global_reactive_power~datetime, type="l",
       ylab="Global Reactive Power (kilowatts)", xlab="datetime")
    })

dev.off()
