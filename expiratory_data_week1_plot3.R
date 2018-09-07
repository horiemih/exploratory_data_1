##use the same csv file from plot1 and plot2
house3<- read.csv("C:\\Users\\Desktop\\corsera\\house3.csv")	
house3$Date <- as.Date(house3$Date, format ="%d/%m/%Y")
today = house3$Date
todaydate <- weekdays(as.Date(today))
house3$Sub_metering_1 <-as.numeric(as.character(house3$Sub_metering_1))
house3$sSub_metering_2 <-as.numeric(as.character(house3$Sub_metering_2))
house3$Sub_metering_3 <-as.numeric(as.character(house3$Sub_metering_3))

housetoday <- cbind(house3, todaydate)
housetoday$Date <- as.Date(housetoday$Date, format ="%d/%m/%Y")

housetoday2 <- subset(housetoday, (Date == "2007-02-01" | Date == "2007-02-02"))
housetoday2$DateTime <- as.POSIXct(paste(housetoday2$Date, housetoday2$Time), format="%Y-%m-%d %H:%M:%S")

##create graph

png("C:\\Users\\Desktop\\corsera\\plot3.png", width=480, height=480)
with(housetoday2, plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
lines(housetoday2$DateTime, housetoday2$Sub_metering_2, type="l", xlab="Day", ylab="Global Active Power (kilowatts)", col= "red")
lines(housetoday2$DateTime, housetoday2$Sub_metering_3, type="l", xlab="Day", ylab="Global Active Power (kilowatts)", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
