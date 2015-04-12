data <- read.table("data.txt", header = T, sep = ";", na.strings = "?") #Reading in the data
data$Date <- as.Date(data$Date, "%d/%m/%Y") #Converting the data and the time factors to Date\Time classes
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] #Subsetting the data by the given criteria
dates <- data$Date
times <- data$Time
x <- paste(dates, times)
data$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png", width = 480, height = 480) #opening the png bitmap device
hist(data$Global_active_power, col = "RED", xlab = "Global Active Power(kilowatts)", main = "Global Active Power") #creating the histogram
dev.off() #closing the graphic device