#Read data
mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#subset data
data<-subset(mydata,Date=="2/2/2007" | Date=="1/2/2007")

#Create new variable to manipulate dates and times
data$newdate<-paste(data$Date, data$Time, sep=" ")

#Create Graph
png(file = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()


