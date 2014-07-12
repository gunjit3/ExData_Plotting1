# To run this script just source the file !


# this function does all the plotting task with proper labels and legends. Will be called later.
plot_3 <- function(data) {
    plot(data$Date, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    points(data$Date, data$Sub_metering_1, type="s")
    points(data$Date, data$Sub_metering_2, type="s", col="Red")
    points(data$Date, data$Sub_metering_3, type="s", col="Blue")
    legend("topright", col=c("Black","Red","Blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),bty="n")
}

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
png(filename="plot3.png", width=480, height=480)
plot_3(data)
#closing the device
dev.off()

#plotting the graph on the screen
plot_3(data)
