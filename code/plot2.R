library(sqldf)
subset_data <- read.csv2.sql("F:/data science specialist/course4/data/household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", 
                            na.strings = "?")
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")           
Data_Time <- paste(subset_data$Date, subset_data$Time)     
Data_Time <- strptime(Data_Time, "%Y-%m-%d %H:%M:%S") # Appropriate time format


####q2
# Correcting the data format
Sys.setlocale("LC_ALL","English") #to change from arabic to english
png(file = "plot2.png")
plot(Data_Time,subset_data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()

sqldf() # close connection
