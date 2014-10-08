
rm(list = ls())
source("readPlotData.R")


data = readPlotData()
dates = strptime(paste(data[,1], data[,2]),"%d/%m/%Y %H:%M:%S")
opar <- par() 
par(cex = .75, bg = "transparent")

plot(dates,data[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")



dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
suppressWarnings(par(opar))
