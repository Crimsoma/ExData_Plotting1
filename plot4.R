#These steps are the same for all four plot codes; omit if repeating to save time.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "consu.zip", mode ="wb")
unzip("consu.zip", "household_power_consumption.txt")
consu <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
cons2 <- consu[consu$Date =="1/2/2007",]
cons3 <- consu[consu$Date == "2/2/2007",]
con1<- rbind(cons2,cons3)

#variable assignments
submeter1 <- con1$Sub_metering_1
submeter2 <- con1$Sub_metering_2
submeter3 <- con1$Sub_metering_3
power <- con1$Global_active_power
voltage <- con1$Voltage
repower <- con1$Global_reactive_power
dateTime<- strptime(paste(con1$Date, con1$Time), "%d/%m/%Y %H:%M:%S")

#opening graphics device
png(file="plot4.png", height = 480, width = 480)

#plotting, including setting mfcol to allow for columnwise ordering of plots to retain ordering in assignment
#layering still present, legend cex specified to restrict size
par(mfcol=c(2,2))
plot(dateTime, power, xlab = "", ylab = "Global Active Power", type = "l")
plot(dateTime, submeter1, xlab = "", ylab = "Energy sub metering", type = "l")
points(dateTime, submeter2, col = "red", xlab = "", ylab = "Energy sub metering", type = "l")
points(dateTime, submeter3, col = "blue", xlab = "", type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"), cex = .8, bty ="n")
plot(dateTime, voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(dateTime, repower, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

#closing graphics device
dev.off()