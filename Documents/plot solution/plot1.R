## reading 	the data into a dataframe
## In order to read only the data that interests us I skipped straight to where the data is
## and counted the relevant rows
## Not intirely what is desired but it works!


	mydata<-read.table("household_power_consumption.txt", header=FALSE, sep = ";", skip = 66637, nrows=2880)
	vheader<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
	colnames(mydata)<-vheader

	png(file="plot1.png", width=480, height=480)
	hist(mydata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
	dev.off()
