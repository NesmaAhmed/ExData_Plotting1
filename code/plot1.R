library(sqldf)
subset_data <- read.csv2.sql("F:/data science specialist/course4/data/household_power_consumption.txt", sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007' ", 
                            na.strings = "?")

## question 1
# Create the histogram with data
png(file = "plot1.png")
hist(subset_data$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

sqldf() # close connection
