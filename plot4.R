#Read data
mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#subset data
data<-subset(mydata,Date=="2/2/2007" | Date=="1/2/2007")

#Create new variable to manipulate dates and times
data$newdate<-paste(data$Date, data$Time, sep=" ")

#Create Graph
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(data, {
        plot(strptime(data$newdate, "%d/%m/%Y %T" ),Global_active_power,type="l",xlab="",ylab="Global Active Power")
        plot(strptime(data$newdate, "%d/%m/%Y %T" ),Voltage,type="l",xlab="datetime",ylab="Voltage")
        plot(strptime(data$newdate, "%d/%m/%Y %T" ), data$Sub_metering_1,type = "n", xlab="", ylab="Energy sub metering")
        lines(strptime(data$newdate, "%d/%m/%Y %T" ),data$Sub_metering_1, col="black")
        lines(strptime(data$newdate, "%d/%m/%Y %T" ),data$Sub_metering_2, col="red")
        lines(strptime(data$newdate, "%d/%m/%Y %T" ),data$Sub_metering_3, col="blue")
        legend("topright", pch = "____", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        plot(strptime(data$newdate, "%d/%m/%Y %T" ),Global_reactive_power,type="l",xlab="datetime")
})
dev.off()
