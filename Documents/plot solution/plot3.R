## Opening the files

	mydata<-read.table("household_power_consumption.txt", header=FALSE, sep = ";", skip = 66637, nrows=2880)
	vheader<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
	colnames(mydata)<-vheader

## Soltion itself

	png(file="plot3.png", width=480, height=480)
	 plot(mydata$Sub_metering_1, 
		type = "l", 
		axes = FALSE,
		ylab = "Energy Sub Metering", 
		xlab = "")
	 lines(mydata$Sub_metering_2,col = "red")
	 lines(mydata$Sub_metering_3,col = "blue")

	 axis(1,  at = c (0, 1500, 2990), labels = c("Thu", "Fri", "Sat"))
	axis(2)  ##to simply show the Y Axis
	
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty= 1)	
	box (which = "plot", lty = "solid")
	
	dev.off()