## Load the dataset using the loader script
## loader script is in the same directory as the data to keep this simple.
## In this plot, we are goiong to plot four graphs in two columns and two rows.  

source("loadPowerData.R")

##  Open the PNG graphics device

png(filename="plot4.png", width=1000, height=1000)

## Set up the plotting logistics for two rows and two columns
par(mfrow=c(2,2))

## Add plot1, a histogram of Global Active Power 

with (DT2, {
  hist(Global_active_power, main="", xlab="Global Active Power (kilowatts)", col="red")
})

## Add plot2, Global_active_power, over the two days in question

with (DT2, {
  plot(DateAndTime, Global_active_power,  
       xlab="datetime", ylab="Global Actve Power (kilowatts)", type="l")
})


## Add plot3, the sub-metering graph

with (DT2, {
  plot(DateAndTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateAndTime, Sub_metering_2, type="l", col="red")
  lines(DateAndTime, Sub_metering_3, type="l", col="blue")
})

## Add the legend into the upper right hand corner.  
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd="1", bty="n", col=c("black", "red", "blue"))


##  Plot the graph of Global_reactive_power.  We will default to black for Sub_metering_1and
##  use 'red'
with (DT2, {
  plot(DateAndTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
})


##  Close the graphics device.
dev.off()
