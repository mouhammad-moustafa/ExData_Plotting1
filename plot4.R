source("readData.R")
source("plot2.R")
source("plot3.R")

## Reads the Data and plot plot4.png 
plot4 <- function(){
        data <- readData()
        plotPng4(data)
        
}

## Construct plot4 and save it to a plot4.png file 
## with a width of 480 pixels and a height of 480 pixels.
## Margin are adjusted to replicate the reference plot.
plotPng4 <- function(data){
        png(file = "plot4.png", width = 480, height = 480, bg = "transparent")
        plotGraph4(data)
        dev.off()
}

## Construct plot4
plotGraph4 <- function(data){
        par(mfrow = c(2,2), mar = c(4.8, 4.1, 3.4, 2))
        ## type = l for lines
        plotGraph2(data, ylabel = "Global Active Power")
        plotTopRightGraph(data)
        plotGraph3(data, "n")
        plotBottomRightGraph(data)

}

## plots the top right graphics 
plotTopRightGraph <- function(data){
        plot(x = data$DateTime, y = data$Voltage, type ="l", xlab = "datetime", ylab = "voltage")
}

## plots the bottom right graphics
plotBottomRightGraph <- function(data){
        plot(x = data$DateTime, y = data$Global_reactive_power, type ="s", xlab = "datetime", ylab = "Global_reactive_power")
}
