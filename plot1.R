source("readData.R")

## Reads the Data and plot the Global Active Power Histogram 
histGlobalActivePower <- function(){
        data <- readData()
        histData(data)
        
}

## Construct plot1 and save it to a plot1.png file 
## with a width of 480 pixels and a height of 480 pixels.
## Margin are adjusted to replicate the reference plot.
histData <- function(data){
        png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
        par(mfrow = c(1,1), mar = c(4.8, 4.1, 3.4, 0.1))
        hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
}
