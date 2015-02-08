### Loading initial dataset
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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_Rective_Power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()