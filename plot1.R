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

# plot a histogram to a png output file.
png("plot1.png", width=480, height=480, bg="white")
hist(power.sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()