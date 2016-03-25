##
## Plot3.R
## Plot line graph of sub_metering measures over time, in red, blue, and black
##

require(utils)  # Needed for unzip

## Do our work in the right place
setwd("~/coursera/exploredata/ExData_Plotting1")

## Download and unzip the data file
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")

## Read, convert, and trim the data frame
power.consum <- read.delim(file="./household_power_consumption.txt", header=TRUE, sep=";",
                           colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                           na.strings="?")
power.consum$datetime <- strptime(paste0(power.consum$Date,"-",power.consum$Time), format="%d/%m/%Y-%H:%M:%S")
power.consum$Date <- as.Date(power.consum$Date, format="%d/%m/%Y")
power.consum <- power.consum[power.consum$Date == "2007-02-01" | power.consum$Date == "2007-02-02",]

## Create the plot in a PNG file
png(filename="plot3.png")
plot(x=power.consum$datetime, y=power.consum$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=NA)
lines(x=power.consum$datetime, y=power.consum$Sub_metering_2, type="l", col="red")
lines(x=power.consum$datetime, y=power.consum$Sub_metering_3, type="l", col="blue")
legend(x="topright", lwd=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
