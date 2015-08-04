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


# Plot 1
str(mydata_cut$Global_active_power)
mydata_cut$Global_active_power <- as.numeric(mydata_cut$Global_active_power)

par(mar = c(5, 5, 4, 4))

hist(mydata_cut$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

dev.copy(png, file = "Plot 1.png")
dev.off()
