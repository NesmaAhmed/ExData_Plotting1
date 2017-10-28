library(sqldf)
subset_data <- read.csv2.sql("F:/data science specialist/course4/data/household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", 
                            na.strings = "?")
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")                  # Appropriate date format 
Data_Time <- paste(subset_data$Date, subset_data$Time)   
Data_Time <- strptime(Data_Time, "%Y-%m-%d %H:%M:%S") # Appropriate time format

#### q3
png(file = "plot3.png")
plot(Data_Time,subset_data$Sub_metering_1,type="l",col="Black",xlab = "",ylab = "Energy sub metering")
points(Data_Time,subset_data$Sub_metering_2,type="l",col="Red")
points(Data_Time,subset_data$Sub_metering_3,type="l",col="Blue")
legend("topright", lty = 1, col = c("Black","Red","Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

sqldf() # close connection
