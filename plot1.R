#These steps are the same for all four plot codes; omit if repeating to save time.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "consu.zip", mode ="wb")
unzip("consu.zip", "household_power_consumption.txt")
consu <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")
cons2 <- consu[consu$Date =="1/2/2007",]
cons3 <- consu[consu$Date == "2/2/2007",]
con1<- rbind(cons2,cons3)

#variable assignment
power <- con1$Global_active_power

#open graphic device
png(file = "plot1.png", width =480, height = 480)

#plotting
hist(power, xlab = "Global Active Power(kilowatts)", col = "red", main = "Global Active Power")

#closing graphic device
dev.off()