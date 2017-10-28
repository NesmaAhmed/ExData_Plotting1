library(sqldf)
subset_data <- read.csv2.sql("F:/data science specialist/course4/data/household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", 
                            na.strings = "?")
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")                  # Appropriate date format 
Data_Time <- paste(subset_data$Date, subset_data$Time)     # create a new column with data and time joined
Data_Time <- strptime(Data_Time, "%Y-%m-%d %H:%M:%S") # Appropriate time format


###### q4
png(file = "plot4.png")
par(mfrow = c(2,2))
#1
plot(Data_Time,subset_data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
#2
plot(Data_Time,subset_data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
#3
plot(Data_Time,subset_data$Sub_metering_1,type="l",col="Black",xlab = "",ylab = "Energy sub metering")
points(Data_Time,subset_data$Sub_metering_2,type="l",col="Red")
points(Data_Time,subset_data$Sub_metering_3,type="l",col="Blue")
legend("topright", lty = 1, col = c("Black","Red","Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
#4
plot(Data_Time,subset_data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()
sqldf() # close connection
