# To run this script just source the file !

#Reading the data from txt file. I have added col classes as it is supposed to be more efficient and I
# did not want columns as factors
data <- read.delim("household_power_consumption.txt", sep=";", 
                   na.strings="?", colClasses = c("character", "character", "numeric", 
                                                  "numeric","numeric","numeric","numeric","numeric","numeric"))

# Filtering out the data and keeping only the required rows
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Pasting the time column in the date column, separated by a space. I am doing this so that I can get rid of
# Time column all together and parse the full information in a single date time object
data$Date <- paste(data$Date, data$Time, sep=" ")

# deleting the Time column
data$Time <- NULL

# Since I pasted time information in date column. I will parse the whole thing as a single date object using
# strptime function. 
data$Date <- strptime(data$Date, "%d/%m/%Y %H:%M:%S")

# plotting the data with propex axis labels and line type
plot(data$Date, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Copying it in the png file
dev.copy(png, filename="plot2.png", width=480, height=480)

#closing the device
dev.off()
