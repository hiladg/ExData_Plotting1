
drawPlot4<-function()
{

	##Open the file
	mydata<-read.table("household_power_consumption.txt", header=FALSE, sep = ";", skip = 66637, nrows=2880)
	vheader<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
	colnames(mydata)<-vheader

	## Solution itself
	
	png(file="plot4.png", width=480, height=480)
	par (mfrow = c(2, 2), pty = "s")

	## the first one is plot 2, but different y axis title

	
	 plot(mydata$Global_active_power,  type="l", axes=FALSE, ylab = "Global Active Power" , xlab = "")
	 axis(1,  at = c (0, 1500, 2990), labels = c("Thu", "Fri", "Sat"))
	box (which = "plot", lty = "solid")
	
	
	## the second plot
	 plot(mydata$Voltage, type = "l", ylab = "Voltage", xlab = "", axes = FALSE)
	 axis(1, at = c (0, 1500, 2990), labels = c("Thu", "Fri", "Sat"))
	 axis(2)
	box (which = "plot", lty = "solid")	

	##the third plot
	
	 plot(mydata$Sub_metering_1, type = "l", axes = FALSE, ylab = "Energy Sub Metering", 
		xlab = "")
	 lines(mydata$Sub_metering_2,col = "red")
	 lines(mydata$Sub_metering_3,col = "blue")

	 axis(1,  at = c (0, 1500, 2990), labels = c("Thu", "Fri", "Sat"))
	axis(2)  ##to simply show the Y Axis
	
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),  cex = .75, lty = 1, bty = "n")	
	box (which = "plot", lty = "solid")

	## the forth and last plot

	 plot (mydata$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime", axes = FALSE, lty=1)
	 axis(2)
	 axis(1, at = c (0, 1500, 2990), labels = c("Thu", "Fri", "Sat"))
	box (which = "plot", lty = "solid")

	##and now to draw, and 
	


	dev.off()
}