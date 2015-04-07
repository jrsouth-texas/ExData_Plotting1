##  The purpose of this script is to load the power data into memory to start working with it.  It will
##  also adjust the date from a character string to a date format.
#t#
##  Check whether the data have already been downloaded and unzipped.   

if (!file.exists("household_power_consumption.txt")) {
  
  ##  Download the file from the Internet
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "powerData.zip")
  unzip("powerData.zip")

  ##  Our data file name is loaded into a variable to save in the typing

  myFile <- "household_power_consumption.txt"

  ##  Read into a data frame.  We need to account for the NA values being maked as a "?".  

  DT <- read.table(myFile, na.string = "?", header=TRUE, sep=";", strip.white=TRUE, stringsAsFactors=FALSE,
                   colClasses=c(rep("character", 2),
                              rep("numeric",   7)))

  ##  Finally, using the functions in lubridate, convert the Date and Time variables to internal Date formats

  

  #as.Date("2006-11-16") == testDate2
  } else {
    
    myFile <- "household_power_consumption.txt"
    DT <- read.table(myFile, na.string = "?", header=TRUE, sep=";", strip.white=TRUE, stringsAsFactors=FALSE,
                     colClasses=c(rep("character", 2),
                                  rep("numeric",   7)))
  }

## We will need the Date and Time columns pasted together in the second plot.  We could do that on the fly
## in plot2, but it would be just as easy to do it here, and add a column that holds that data for when we
## need it in plot 2 and plot 4.

dateTime <- paste(DT$Date, DT$Time, sep=" ")
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")

##  Now add this vector to the table that we already have in memory

DT$DateAndTime <- dateTime

DT2 <- subset(DT, ((as.Date(DT$DateAndTime)) == "2007-02-01") | ((as.Date(DT$DateAndTime)) == "2007-02-02"))
            
 ##           d <- d[d$Date == '1/2/2007' | d$Date == '2/2/2007', ] 
             
             