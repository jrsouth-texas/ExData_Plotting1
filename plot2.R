## Load the dataset using the loader script
## loader script is in the same directory as the data to keep this simple.

source("loadPowerData.R")

##  Open the PNG graphics device

png(filename="plot2.png", width=480, height=480)

##  Plot the graph over the two days in question 
with (DT2, {
  plot(DateAndTime, Global_active_power,  
     xlab="", ylab="Global Actve Power (kilowatts)", type="l")
})

##  Close the graphics device.
dev.off()
