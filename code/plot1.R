
# Code for plot 1

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
#Plot1
######

png(filename = "../figure/plot1.png",units = "px", height = 480, width = 480 )
hist(data$Global_active_power, col=2, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200),
     labels = FALSE)
dev.off()