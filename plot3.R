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
with(subdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()