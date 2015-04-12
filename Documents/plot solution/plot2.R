	
	##Just opening the files
	mydata<-read.table("household_power_consumption.txt", header=FALSE, sep = ";", skip = 66637, nrows=2880)
	vheader<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
	colnames(mydata)<-vheader



	png(file="plot2.png", width=480, height=480)
	 plot(mydata$Global_active_power,  type="l", axes=FALSE, ylab = "Global Active Power (kilowatts)" , xlab = "")
	 axis(1,  at = c (0, 1500, 2990), labels = c("Thu", "Fri", "Sat"))
	box (which = "plot", lty = "solid")
	
	dev.off()