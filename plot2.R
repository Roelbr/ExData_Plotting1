## Download and unzip the data set to the working directory

filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists(filename)){
     URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     download.file(URL, filename, mode='wb')
}  
if (!file.exists("household_power_consumption.txt")) { 
     unzip(filename) 
}
dataFile <- "household_power_consumption.txt"

## Reading and subsetting data for the right dates
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting time formats, subsetting and plotting Global Active Power
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
