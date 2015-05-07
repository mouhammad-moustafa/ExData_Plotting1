source("plot1.R")

## Construct plot4 and save it to a plot3.png file 
## with a width of 480 pixels and a height of 480 pixels and transparent background.
plot4 <- function(){
        data <- readData()
        
        ## Open PNG Device: create plot4.png file with a width of 480 pixels and a height of 480 pixels.
        png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
        
        ## Multi paneled ploting window with 2 rows and 2 columns of plots 
        par(mfrow = c(2, 2))
        
        ## Create 4 plots:
        with(data, {
                ## 1. Global_active_power by DateTime
                plot(x = DateTime, y = Global_active_power, main = "", type = "l"
                     , xlab = ""
                     , ylab = "Global Active Power")
        
                ## 2. Voltage by DateTime
                plot(x = DateTime, y = Voltage, main = "", type = "l"
                        , xlab = "datetime"
                        , ylab = "Voltage")
        
                ## 3. Sub_metering_1, Sub_metering_2 and Sub_metering_3 by DateTime
                plot(x = DateTime, y = Sub_metering_1, main = "", type = "l"
                        , xlab = ""
                        , ylab = "Energy sub metering")
                lines(x = DateTime, y = Sub_metering_2, col = "red")
                lines(x = DateTime, y = Sub_metering_3, col = "blue")     
                legend("topright", lwd = 1, col = c("black", "red", "blue"), bty = "n"
                        , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
                ## 4. Global_reactive_power b y DateTime
                plot(x = DateTime, y = Global_reactive_power, main = "", type = "l"
                        , xlab = "datetime"
                        , ylab = "Global_reactive_power")
        })
             
        ## And send to a file (no plot appears on screen)
        
        ## Close the PNG file device
        dev.off()
}
