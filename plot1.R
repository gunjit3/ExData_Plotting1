# To run this file just source it !!

#Reading the data from txt file. I have added col classes as it is supposed to be more efficient and I
# do not want columns as factors. Assuming the file is in working directory
data <- read.delim("household_power_consumption.txt", sep=";", 
                   na.strings="?", colClasses = c("character", "character", "numeric", 
                                                  "numeric","numeric","numeric","numeric","numeric","numeric"))

# Filtering out the data and keeping only the required rows
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Generating the histogram with required settings and labels and color
hist(data$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")

#Copying the histogram on screen to png file
dev.copy(png,width=480, height=480, filename="plot1.png")

#Closing the devices.
dev.off()