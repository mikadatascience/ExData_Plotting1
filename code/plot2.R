
# Code for plot 2

# Assume working directory is ExData_Plotting1/code

# read data
basicdata <- read.csv("../data/household_power_consumption.txt", sep=";", stringsAsFactors = FALSE,
                      na.strings="?")


#variable transformation
basicdata$datetime <- strptime(paste(basicdata$Date, basicdata$Time),"%d/%m/%Y %T")


#subsetting to 2007-02-01 and 2007-02-02 only
dateofinterest1 <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %T")
dateofinterest2 <- strptime("02/02/2007 23:59:29", "%d/%m/%Y %T")

data <- subset(basicdata, basicdata$datetime <= dateofinterest2 &
                 basicdata$datetime >= dateofinterest1 )


######
#Plot2
######

png(filename = "../figure/plot2.png",units = "px", height = 480, width = 480 )
plot(data$datetime,data$Global_active_power,type="l", xlab ="", 
     ylab = "Global Active Power (kilowatts)")
dev.off()