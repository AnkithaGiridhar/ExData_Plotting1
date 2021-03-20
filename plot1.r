pc <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
head(pc)
colnames(pc, do.NULL = TRUE, prefix = "col")
colnames(pc) <- c('Date','Time','Global_active_power','Global_reactive_power',
                  'Voltage','Global_intensity','Sub_metering_1',
                  'Sub_metering_2','Sub_metering_3')
head(pc$Date)
pc<-na.omit(pc)
pc$Date <- as.Date(pc$Date, format = "%d/%m/%Y")
pc$Time <- strptime(pc$Time, "%H:%M:%S")
pc$Global_active_power<-as.numeric(pc$Global_active_power)
png(file="C:/Users/palla/Desktop/ExData_Plotting1/plot1.png",
    width=480, height=480)
hist(pc$Global_active_power,xlim = c(0,6), ylim = c(0,1200), breaks = 12, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
