## Loading initial dataset
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?") 

## Converting dates into Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]


## Converting dates and times into POSIXct
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## The next command is for setting of weekdays in English
Sys.setlocale("LC_TIME", "English")

## Plot
hist(subdata$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
  