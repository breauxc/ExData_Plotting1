
rm(list = ls())
source("readPlotData.R")


data = readPlotData()
dates = strptime(paste(data[,1], data[,2]),"%d/%m/%Y %H:%M:%S")
opar <- par() 

png(file = "plot4.png", width = 480, height = 480)
par(cex = .6, bg = "transparent", mfcol= c(2,2))
plot(dates,data[,3], type = "l", xlab = "", ylab = "Global Active Power")

plot(dates,data[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(dates,data[,8], col = "#FF3300")
lines(dates,data[,9], col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), lwd = c(3,3,3),
       col = c("black","#FF3300", "blue"), cex = .95, box.lty = 0)

plot(dates,data[,5], type= "l", xlab = "datetime", ylab = "Voltage")

plot(dates,data[,4], type= "l", xlab = "datetime", ylab = "Global_reactive_power")


#dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
suppressWarnings(par(opar))
