# Read data

fulldata <- read.table("household_power_consumption.txt", header = TRUE, sep=";",stringsAsFactors=FALSE, na.strings = "?")

# Subset requested dates

subsetdata <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

# Plot to png

png("plot2.png", width=480, height=480)

hist(subsetdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
