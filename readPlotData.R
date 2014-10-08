
readPlotData <- function (){
 
    ### Download and unzip the dataset. This script will also generate a text file recording the timestamp of the download.
    
    if(!file.exists("household_power_consumption.txt")){
        
        download = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(download,"household_power_consumption.zip")
        unzip("household_power_consumption.zip")
        
        dateDownloaded = date()
        timestamp = paste0("The household_power_consumption dataset was downloaded from ", download, " on ",dateDownloaded,".")
        write.table(timestamp, file = "household_power_consumption timestamp.txt", row.names= FALSE, col.names = FALSE, quote = FALSE)
        
    }
    
    hpcdata = read.table("household_power_consumption.txt", 
                         header = TRUE, 
                         sep = ";", 
                         colClasses = c("character","character",rep("numeric",7)), 
                         stringsAsFactors = FALSE,
                         na.strings = "?")
    
    dates = as.Date(strptime(hpcdata[,1],"%d/%m/%Y"))
    use.dates = (dates == as.Date("2007-02-01")) | (dates == as.Date("2007-02-02"))
    useddata = hpcdata[use.dates,]
    return(useddata)
}