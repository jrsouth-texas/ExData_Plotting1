## Load the dataset using the loader script
## loader script is in the same directory as the data to keep this simple.

source("loadPowerData.R")

##  Open the PNG graphics device

png(filename="plot3.png", width=480, height=480)

##  Plot the graph comparing the submetering (1, 2, 3).  We will default to black for Sub_metering_1and
##  use 'red'
with (DT2, {
  plot(DateAndTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateAndTime, Sub_metering_2, type="l", col="red")
  lines(DateAndTime, Sub_metering_3, type="l", col="blue")
})

## Add the legend into the upper right hand corner.  
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd="1", col=c("black", "red", "blue"))

##  Close the graphics device.
dev.off()
