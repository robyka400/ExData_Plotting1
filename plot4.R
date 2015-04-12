data <- read.table("data.txt", header = T, sep = ";", na.strings = "?") #Reading in the data
data$Date <- as.Date(data$Date, "%d/%m/%Y") #Converting the data and the time factors to Date\Time classes
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] #Subsetting the data by the given criteria
dates <- data$Date
times <- data$Time
x <- paste(dates, times)
data$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480) #opening the png bitmap device

par(mfcol = c(2,2), mar = c(4,4,1,1))
with(data, plot(Time, Global_active_power, type = "h" , xlab = "", ylab = "Global Active Power (kilowatts)")) #Creating the plot: The Global Active Power by time, in default black color
with(data, plot(Time,Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")) #Making the empty plot
points(data$Time, data$Sub_metering_3, type = "h", col = "blue")
points(data$Time, data$Sub_metering_1, type = "h", col = "black")  #Adding the required elements, without transparency
points(data$Time, data$Sub_metering_2, type = "h", col = "red")   #But in order that the plot is still visible and easy to read
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(1,1,1), col = c("black", "red", "blue"))  #Adding the legends
with(data, plot(Time, Voltage, type = "h" , xlab = "datetime", ylab = "Voltage")) 
with(data, plot(Time, Global_reactive_power, type = "h" , xlab = "datetime", ylab = "Global_reactive_power")) 

dev.off() #closing the graphic device