pc <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
head(pc)
colnames(pc, do.NULL = TRUE, prefix = "col")
colnames(pc) <- c('Date','Time','Global_active_power','Global_reactive_power',
                  'Voltage','Global_intensity','Sub_metering_1',
                  'Sub_metering_2','Sub_metering_3')
pc<-na.omit(pc)
pc$DateTime <- paste(pc$Date, pc$Time, sep = " ")
head(pc$DateTime)
pc$DateTime <- strptime(pc$DateTime, "%d/%m/%Y %H:%M:%S")
pc$Global_active_power<-as.numeric(pc$Global_active_power)
png(file="plot2.png",width=480, height=480)
with(pc,plot(DateTime,Global_active_power,type = "l",  ylab = 'Global Active Power (kilowatts)'))
dev.off()
