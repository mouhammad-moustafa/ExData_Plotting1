source("plot1.R")

## Construct plot3 and save it to a plot3.png file 
## with a width of 480 pixels and a height of 480 pixels and transparent background.
plot3 <- function(){
        data <- readData()
        ## Open PNG Device: create plot3.png file with a width of 480 pixels and a height of 480 pixels.
        png(filename = "plot3.png", width = 480, height = 480, bg = "transparent")
        ## Create a plot of Sub_metering_1, Sub_metering_2 and Sub_metering_3 
        ## by DateTime and send to a file (no plot appears on screen)
        with(data, {
                plot(x = DateTime, y = Sub_metering_1, main = "", type = "l" , xlab = "" , ylab = "Energy sub metering")
                lines(x = DateTime, y = Sub_metering_2, col = "red")
                lines(x = DateTime, y = Sub_metering_3, col = "blue")        
        })
        
        legend("topright", lwd = 1, col = c("black", "red", "blue")
                                  , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        ## Close the PNG file device
        dev.off()
}
