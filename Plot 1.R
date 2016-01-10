setwd("E:\\My Documents\\Coursera\\In Progress\\Exploratory Data Analysis\\Course Project 1\\")
fName <- "household_power_consumption.txt"

setClass('myDate')
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setClass("myTime")
setAs("character", "myTime", function(from) as.Date(from, format="%H:%M:%S"))
setClass("myNumeric")
setAs("character", "myNumeric", function(from) ifelse(from == "?", NA, as.numeric(from)))

cClasses <- c("myDate", "character", "myNumeric", "myNumeric", "myNumeric", "myNumeric", "myNumeric", "myNumeric", "myNumeric")
epc <- read.csv(fName, header = T, sep = ";", colClasses = cClasses)
epc_p <- epc[epc[,1] %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
epc_p <- cbind(epc_p, dt = as.POSIXct(paste(epc_p[,1], epc_p[,2]),
    format = "%Y-%m-%d %H:%M:%S"))

# plot 1
png(filename = "E:\\My Documents\\Coursera\\In Progress\\Exploratory Data Analysis\\Course Project 1\\Plot1.png")
par(mfrow = c(1,1))
br <- seq(0, ceiling(max(as.numeric(epc_p[,3]))), .5)
hist(as.numeric(epc_p[,3]), breaks = br, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()