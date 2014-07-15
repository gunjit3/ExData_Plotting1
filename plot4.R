# To run this script just source the file !

# this function will plot the first graph with proper axis labels
plot_1 <- function(data) {
    plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
}

# this function will plot the second graph with proper lables
plot_2 <- function(data) {
    plot(data$Date, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
}

# this function does all the plotting task with proper labels and legends. Will be called later. 
# this will plot the 3rd graph
plot_3 <- function(data) {
    plot(data$Date, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    points(data$Date, data$Sub_metering_1, type="s")
    points(data$Date, data$Sub_metering_2, type="s", col="Red")
    points(data$Date, data$Sub_metering_3, type="s", col="Blue")
    legend("topright", col=c("Black","Red","Blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),bty="n")
}

# this function will plot the fourth graph with proper labels
plot_4 <- function(data) {
    plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
}

#downloading the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip", method = "curl") 
unzip("household_power_consumption.zip")

#Reading the data from txt file. I have added col classes as it is supposed to be more efficient and I
# did not want columns as factors
data <- read.delim("household_power_consumption.txt", sep=";", 
                   na.strings="?", colClasses = c("character", "character", "numeric", 
                                                  "numeric","numeric","numeric","numeric","numeric","numeric"))

# Filtering out the data and keeping only the required rows
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Pasting the time column in the date column separated by a space. I am doing this so that I can get rid of
# Time column all together and parse the full information in a single date time object
data$Date <- paste(data$Date, data$Time, sep=" ")

# deleting the Time column
data$Time <- NULL

# Since I pasted time information in date column. I will parse the whole thing as a single date object using
# strptime function. 
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")

#opening a png device and calling my plot function. This will plot in the png
png(filename="plot4.png", width=480, height=480)

#setting up the global parameter so the 4 graphs are put on device (row wise)
par(mfrow=c(2,2))

plot_1(data)
plot_2(data)
plot_3(data)
plot_4(data)

#closing the device
dev.off()

#plotting the graph on the screen
#setting up the global parameter so the 4 graphs are put on device (row wise)
par(mfrow=c(2,2))

plot_1(data)
plot_2(data)
plot_3(data)
plot_4(data)
