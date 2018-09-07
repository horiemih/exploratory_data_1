house <- read.table("C:\\Users\Desktop\\corsera\\household.txt", sep=";", header=TRUE)

## change text to csv file
write.table(house, file ="C:\\Users\\Desktop\\corsera\\house3.csv", sep=",", quote=FALSE, row.names = FALSE, col.names = TRUE)
house3<- read.csv("C:\\Users\\Desktop\\corsera\\house3.csv")	
house3$Date <- as.Date(house3$Date, format ="%d/%m/%Y")
house3$Global_active_power <-as.numeric(as.character(house3$Global_active_power))
house5 <- subset(house3, (Date == "2007-02-01" | Date == "2007-02-02"))
house6 <- house5$Global_active_power
##plot graph and save it to a computer
png("C:\\Users\\Desktop\\corsera\\plot1.png", width=480, height=480)
hist(house6, col = "red", xlab= " Global Active Power (kilowatts) ", main =" Global Active Power")
dev.off()
