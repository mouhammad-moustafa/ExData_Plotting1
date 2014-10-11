source("readData.R")

## Reads the Data and plots plot2.png  
plot2 <- function(){
        data <- readData()
        plotPng2(data)
        
}

## Construct plot2 and save it to a plot2.png file 
## with a width of 480 pixels and a height of 480 pixels.
## Margin are adjusted to replicate the reference plot.
plotPng2 <- function(data){
        png(file = "plot2.png", width = 480, height = 480, bg = "transparent")
        par(mfrow = c(1,1), mar = c(4.8, 4.1, 3.4, 2))
        plotGraph2(data)
        dev.off()
}

## plots the Graph2 with default y label set to  "Global Active Power (kilowatts)"
plotGraph2 <- function(data, ylabel = "Global Active Power (kilowatts)"){
        ## type = l for lines
        plot(x = data$DateTime, y = data$Global_active_power, type ="l", xlab = "", ylab = ylabel)
}
