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
##    downloads and reads the "Individual household electric power consumption Data Set" stored in "household_power_consumption.txt" file.
##    converts Date and Time variables to Date/Time classes in R
##    subsets data based from the dates 2007-02-01 and 2007-02-02

## Usage
## readData().

## Value
## Data Set as data.frame ha the following columns:
## ColName                        ColClass
## "Date"                          Date
## "Time"                          POSIXlt POSIXt
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
        
        ## Use read.Table with the following argument:
        ## fileName: name of the file containing the data. 
        ###
        ## header = TRUE: Indicates that the file contains the names of the variables as its first line
        ## sep = ';': the field separator character is ';'
        ## na.strings = '?': specifies that in this dataset missing values are coded as '?'.
        ## stringsAsFactors = FALSE: character vectors should not be converted to factors 
        ## comment.char = "": turn off the interpretation of comments altogether.
        ###                   The file has no comments in it (e.g. lines starting with '#'), then setting 'comment.char = ""' will sometimes make 'read.table()' run faster.        
        res <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, comment.char = "")
        ## convert Date and Time variables to Date/Time classes in R using:
        ## as.Date: converts charcters to Date using "dd/mm/yyyy" format 
        ## strptime: converts character to time (POSIXlt) using "hh:mm:ss" format
        res <- transform(res, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(Time, format="%H:%M:%S"))
        ## subsets data based from the dates 2007-02-01 and 2007-02-02
        res <- res[res$Date %in% as.Date(c('2007-02-01', '2007-02-02'), format = "%Y-%m-%d"), ]
        res
        
}
