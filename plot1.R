##Description:
##    downloads data from the web and store it locally in data folder.  

## Usage
## downloadData().

## Value
## the Data file relative path

downloadData <- function(){
        dataFolder <- "./data"
        if (!file.exists(dataFolder)){
                dir.create(dataFolder)
        }
        fileName <- "household_power_consumption.txt"
        zipFile = paste(dataFolder, "household_power_consumption_data.zip", sep = "/")
        
        if(!file.exists(zipFile)){
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = zipFile)
                unzip(zipFile, overwrite = TRUE, exdir = dataFolder)
        }
        paste(dataFolder, fileName, sep = "/")
        
}

##Description:
##    downloads and reads the "Individual household electric power consumption Data Set" 
##    stored in "household_power_consumption.txt" file.
##    converts Date and Time variables to Date/Time classes in R
##    subsets data based from the dates 2007-02-01 and 2007-02-02

## Usage
## readData().

## Value
## Data Set as data.frame ha the following columns:
## ColName                        ColClass
## "Date"                          Date
## "DateTime"                      POSIXlt POSIXt
## "Time"                          character
## "Global_active_power"           numeric
## "Global_reactive_power"         numeric
## "Voltage"                       numeric
## "Global_intensity"              numeric
## "Sub_metering_1"                numeric
## "Sub_metering_2"                numeric
## "Sub_metering_3"                numeric

readData <- function(){
        ## donwload data from the Web and return the file path containing the data
        fileName = downloadData()
        
        ## Use read.Table() with the following argument:
        ## fileName: name of the file containing the data. 
        ###
        ## header = TRUE: Indicates that the file contains the names of the variables as its first line
        ## sep = ';': the field separator character is ';'
        ## na.strings = '?': specifies that in this dataset missing values are coded as '?'.
        data <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?");
        
        ## Create Column DateTime by concatenating Date and Time fields
        data$DateTime <- paste(data$Date, data$Time)
        
        ## Convert Date column to appropriate format
        ## as.Date: converts charcters to Date using "dd/mm/yyyy" format
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        
        ## subset Data for 2007-02-01 and 2007-02-02 Dates
        data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"),]
        
        ## Convert DateTime Colmn to POSIXt using strptime
        ## strptime: converts character to time (POSIXlt) using "dd/mm/yyyy hh:mm:ss" format
        data$DateTime <- strptime(x = data$DateTime, format = "%d/%m/%Y %H:%M:%S")
        data
}

## Construct plot1 and save it to a plot1.png file 
## with a width of 480 pixels and a height of 480 pixels and transparent background.
plot1 <- function(){
        data <- readData()
        ## Open PNG Device: create plot1.png file with a width of 480 pixels and a height of 480 pixels.
        png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
        ## Create histogram plot for Global_active_power varaible and send to a file (no plot appears on screen)
        hist(data$Global_active_power, main = "Global Active Power",
                                     , xlab = "Global Active Power (kilowatts)"
                                     , col = "red")
        ## Close the PNG file device
        dev.off()
}
