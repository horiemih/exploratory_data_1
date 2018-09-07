## use the same csv file from plot1

house3<- read.csv("C:\\Users\\Desktop\\corsera\\house3.csv")	
house3$Date <- as.Date(house3$Date, format ="%d/%m/%Y")
house3$Global_active_power <-as.numeric(as.character(house3$Global_active_power))
today = house3$Date
todaydate <- weekdays(as.Date(today))
housetoday <- cbind(house3, todaydate)
housetoday$Date <- as.Date(housetoday$Date, format ="%d/%m/%Y")

housetoday2 <- subset(housetoday, (Date == "2007-02-01" | Date == "2007-02-02"))

## create graph

housetoday2$DateTime <- as.POSIXct(paste(housetoday2$Date, housetoday2$Time), format="%Y-%m-%d %H:%M:%S")
png("C:\\Users\\Desktop\\corsera\\plot2.png", width=480, height=480)
dev.off()
