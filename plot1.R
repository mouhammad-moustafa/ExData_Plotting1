source("readData.R")

## Reads the Data and plots plot1.png 
plot1 <- function(){
        data <- readData()
        plotData(data)
        
}

## Construct plot1 and save it to a plot1.png file 
## with a width of 480 pixels and a height of 480 pixels.
## Margin are adjusted to replicate the reference plot.
plotData <- function(data){
        png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
        par(mfrow = c(1,1), mar = c(4.8, 4.1, 3.4, 0.1))
        hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
}
