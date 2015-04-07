## Load the dataset using the loader script
## loader script is in the same directory as the data to keep this simple.

source("loadPowerData.R")

##  Open the PNG graphics device 

png(filename="plot1.png", width=480, height=480)

##  Plot the histogram given the parameters indicated

with (DT2, {
  hist(Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", col="red")
})


##  Close the graphics device.
dev.off()
