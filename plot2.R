source("plot1.R")

## Construct plot2 and save it to a plot2.png file 
## with a width of 480 pixels and a height of 480 pixels and transparent background.
plot2 <- function(){
        data <- readData()
        ## Open PNG Device: create plot2.png file with a width of 480 pixels and a height of 480 pixels.
        png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
        ## Create a line plot of Global_active_power by DateTime and send to a file (no plot appears on screen)
        plot(x = data$DateTime, y = data$Global_active_power, main = "", type = "l"
                                     , xlab = ""
                                     , ylab = "Global Active Power (kilowatts)")
        ## Close the PNG file device
        dev.off()
}
