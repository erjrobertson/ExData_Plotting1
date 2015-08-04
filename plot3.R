# Set working directory
setwd("C:\\Users\\erobertson\\datasciencecoursera\\ExploratoryDataAnalysis_Project1")


# Read in data / subset
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=F)
head(mydata)

str(mydata$Date)
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
mydata_cut <- mydata[mydata$Date >= DATE1 & mydata$Date <= DATE2,]
table(mydata_cut$Date)

mydata_cut$datetime <- paste(as.Date(mydata_cut$Date), mydata_cut$Time) 
mydata_cut$datetime <- as.POSIXct(mydata_cut$datetime) 


# Plot 3
str(mydata_cut$Global_active_power)
mydata_cut$Global_active_power <- as.numeric(mydata_cut$Global_active_power)

par(mar = c(3, 5, 3, 3))

with(mydata_cut, plot(datetime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", col="black"))
with(mydata_cut, lines(datetime, Sub_metering_2, type = "l", xlab="", col="red"))
with(mydata_cut, lines(datetime, Sub_metering_3, type = "l", xlab="", col="blue"))
legend("topright", lwd=1, lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()
