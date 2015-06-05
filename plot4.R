#load data
#convert the Date and Time variables to Date/Time classes in 
#R using the strptime() and as.Date() functions.
#use data from 2007-02-01 and 2007-02-02
#create subset data from 2007-02-01 and 2007-02-02
#plot 1 - Global Active Power (x axis) Frequency (y axis)
#histogram
#save it to a PNG file with a width of 480 pixels and a height of 480 pixels

power <- read.table('household_power_consumption.txt', sep=";", head=TRUE, na.string="?")

power.sub<- subset(power, (power$Date == "1/2/2007" | power$Date== "2/2/2007")) 

# Changing the class of Date variable from character to Date: 
power.sub$Date <- as.Date(power.sub$Date, format = "%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
power.sub$DateTime <- as.POSIXct(paste(power.sub$Date, power.sub$Time))

#create subset tbale for plots 2, 3, and 4
write.table(power.sub,file='powersub.txt',sep='|',row.names=FALSE)


png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power.sub, {

plot(power.sub$DateTime, power.sub$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")

plot(power.sub$DateTime, power.sub$Voltage, type="l", ylab="Voltage (volt)", xlab="datetime")

plot(power.sub$DateTime, power.sub$Sub_metering_1,  type="l",ylab= "Energy sub metering", xlab="" )
lines(power.sub$DateTime, power.sub$Sub_metering_2,  type="l", col="red")
lines(power.sub$DateTime, power.sub$Sub_metering_3,  type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(power.sub$DateTime, power.sub$Global_reactive_power, type = "l", ylab="Global Reactive Power (kilowatts)", xlab="datetime")

})
dev.off()