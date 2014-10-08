
rm(list = ls())
source("readPlotData.R")


data = readPlotData()
opar <- par() 
par(cex = .75, bg = "transparent")
#png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
hist(data[,3], col = "#FF3300", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
suppressWarnings(par(opar))

