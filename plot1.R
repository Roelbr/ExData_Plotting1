## Download and unzip the data set

filename <- "exdata_data_household_power_consumption.zip"

if (!file.exists(filename)){
     URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
     download.file(URL, filename, mode='wb')
}  
if (!file.exists("household_power_consumption.txt")) { 
     unzip(filename) 
}
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Subset data
globalActivePower <- as.numeric(subSetData$Global_active_power)
# Open png
png("plot1.png", width=480, height=480)
#Plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


