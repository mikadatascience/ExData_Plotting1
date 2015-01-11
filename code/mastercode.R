
# This file contains the code for all plots


# Assume working directory is ExData_Plotting1/code
# You can check that by getwd() and
# set it by setwd()

setwd("~/Documents/edaproject/ExData_Plotting1/code")


# read 
basicdata <- read.csv("../data/haousehold_power_consumption.txt", sep=";", stringsAsFactors = FALSE,
                      na.strings="?")


#variable transformation
basicdata$datetime <- strptime(paste(basicdata$Date, basicdata$Time),"%d/%m/%Y %T")


#subsetting to 2007-02-01 and 2007-02-02 only
dateofinterest1 <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %T")
dateofinterest2 <- strptime("02/02/2007 23:59:29", "%d/%m/%Y %T")

data <- subset(basicdata, basicdata$datetime <= dateofinterest2 &
                         basicdata$datetime >= dateofinterest1 )



#Check the basic stats
#summary(data)


######
#Plot1
######

png(filename = "../figure/plot1.png",units = "px", height = 480, width = 480 )
hist(data$Global_active_power, col=2, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200),
     labels = FALSE)
dev.off()


######
#Plot2
######

png(filename = "../figure/plot2.png",units = "px", height = 480, width = 480 )
plot(data$datetime,data$Global_active_power,type="l", xlab ="", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

######
#Plot3
######


png(filename = "../figure/plot3.png",units = "px", height = 480, width = 480 )
plot(data$datetime,data$Sub_metering_1,type="l", col=1, xlab ="", 
     ylab = "Energy sub metering") 
lines(data$datetime,data$Sub_metering_2,col=2)
lines(data$datetime,data$Sub_metering_3,col=4)
legend("topright", lty = c(1,1,1), col = c(1,2,4), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

#######
#plot 4
#######


png(filename = "../figure/plot4.png",units = "px", height = 480, width = 480 )
par(mfcol = c(2,2))
par(mar = c(4,4,2,4))

#4.1
plot(data$datetime,data$Global_active_power,type="l", xlab ="", 
     ylab = "Global Active Power")

#4.2
plot(data$datetime,data$Sub_metering_1,type="l", col=1, xlab ="", 
     ylab = "Energy sub metering") 
lines(data$datetime,data$Sub_metering_2,col=2)
lines(data$datetime,data$Sub_metering_3,col=4)
legend("topright", lty = c(1,1,1), col = c(1,2,4), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#4.3
plot(data$datetime,data$Voltage,type="l", col=1, xlab ="datetime", 
     ylab = "Voltage") 

#4.4
plot(data$datetime,data$Global_reactive_power,type="l", col=1, xlab ="datetime", 
     ylab = "Global_reactive_power") 
dev.off()




