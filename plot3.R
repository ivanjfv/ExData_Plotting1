#Read data
mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#subset data
data<-subset(mydata,Date=="2/2/2007" | Date=="1/2/2007")

#Create new variable to manipulate dates and times
data$newdate<-paste(data$Date, data$Time, sep=" ")

#Create Graph
png(file = "plot3.png", width = 480, height = 480)
plot(strptime(data$newdate, "%d/%m/%Y %T" ), data$Sub_metering_1,type = "n", xlab="", ylab="Energy sub metering")
lines(strptime(data$newdate, "%d/%m/%Y %T" ),data$Sub_metering_1, col="black")
lines(strptime(data$newdate, "%d/%m/%Y %T" ),data$Sub_metering_2, col="red")
lines(strptime(data$newdate, "%d/%m/%Y %T" ),data$Sub_metering_3, col="blue")
legend("topright", pch = "____", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()