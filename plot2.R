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
plot(subdata$Global_active_power~subdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()