#load data
#convert the Date and Time variables to Date/Time classes in 
#R using the strptime() and as.Date() functions.
#use data from 2007-02-01 and 2007-02-02
#create subset data from 2007-02-01 and 2007-02-02
#plot 1 - Global Active Power (x axis) Frequency (y axis)
#histogram
#save it to a PNG file with a width of 480 pixels and a height of 480 pixels

power <- read.table('household_power_consumption.txt', sep=";", head=TRUE, na.string="?")

power.sub=power[power$Date=="1/2/2007"|power$Date=="2/2/2007",]

power.sub <- power.sub[as.Date(strptime(power.sub$Date, "%d/%m/%Y")) %in% date_range,]

#create subset for plots 2, 3, and 4
write.table(power.sub,file='powersub.txt',sep='|',row.names=FALSE)

png("plot3.png", width = 480, height = 480)
plot(power.sub$Sub_metering_1, power.sub$DateTime, type="l",xlab="", ylab= "Energy sub metering", )
lines(power.sub$Sub_metering_2, power.sub$DateTime, type="l", col="red")
lines(power.sub$Sub_metering_3, power.sub$DateTime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()