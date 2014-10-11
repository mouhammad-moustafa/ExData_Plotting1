source("readData.R")

## Reads the Data and plot plot3.png 
plot3 <- function(){
        data <- readData()
        plotPng3(data)
        
}

## Construct plot3 and save it to a plot3.png file 
## with a width of 480 pixels and a height of 480 pixels.
## Margin are adjusted to replicate the reference plot.
plotPng3 <- function(data){
        png(file = "plot3.png", width = 480, height = 480, bg = "transparent")
        par(mfrow = c(1,1), mar = c(4.8, 4.1, 3.4, 2))
        plotGraph3(data)
        dev.off()
}

## plots Graph 3
plotGraph3 <- function(data, legendBorder = "y"){
        ## type = l for lines
        plot(x = data$DateTime, y = data$Sub_metering_1, type ="l", xlab = "", ylab = "Energy sub metering")
        lines(x = data$DateTime, y = data$Sub_metering_2, type = "l", col="red")
        lines(x = data$DateTime, y = data$Sub_metering_3, type = "l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lwd = 1, bty = legendBorder)
}

