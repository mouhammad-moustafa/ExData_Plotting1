source("readData.R")

## Reads the Data and plot the Global Active Power Histogram 
plot2 <- function(){
        data <- readData()
        plotData(data)
        
}

## Construct plot2 and save it to a plot2.png file 
## with a width of 480 pixels and a height of 480 pixels.
## Margin are adjusted to replicate the reference plot.
plotData <- function(data){
        png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
        par(mfrow = c(1,1), mar = c(4.8, 4.1, 3.4, 2))
        ## type = l for lines
        plot(x = data$DateTime, y = data$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
}