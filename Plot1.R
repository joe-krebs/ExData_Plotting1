##
## Plot1.R
## Plot a simple, red histogram of Global Active Power
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
png(filename="plot1.png")
hist(power.consum$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
