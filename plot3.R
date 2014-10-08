
rm(list = ls())
source("readPlotData.R")


data = readPlotData()
dates = strptime(paste(data[,1], data[,2]),"%d/%m/%Y %H:%M:%S")
opar <- par() 

png(file = "plot3.png", width = 480, height = 480)
par(bg = "transparent")

plot(dates,data[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(dates,data[,8], col = "#FF3300")
lines(dates,data[,9], col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                lty = c(1,1,1), lwd = c(3,3,3),
                col = c("black","#FF3300", "blue"))


#dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
suppressWarnings(par(opar))
