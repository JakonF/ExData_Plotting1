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

# plot 3
par(mfrow = c(1,1))
y_r <- range(epc_p[,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")])
png(filename = "E:\\My Documents\\Coursera\\In Progress\\Exploratory Data Analysis\\Course Project 1\\Plot3.png")
plot(epc_p$dt, epc_p[, "Sub_metering_1"], type = "l", xlab = "", ylab = "Energy sub metering",
     ylim = y_r)
par(new = T)
plot(epc_p$dt, epc_p[, "Sub_metering_2"], type = "l", xlab = "", ylab = "Energy sub metering",
     ylim = y_r, col = "red")
par(new = T)
plot(epc_p$dt, epc_p[, "Sub_metering_3"], type = "l", xlab = "", ylab = "Energy sub metering",
     ylim = y_r, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col = c("black", "red", "blue"), lty = 1, cex = .9, text.width = strwidth("Sub_metering_1"),
       y.intersp = .8)
dev.off()