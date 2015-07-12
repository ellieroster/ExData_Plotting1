plot4 <- function() {
  ## Reads text file of household energy consumption
  ## Subsets file to include data from 2/1/2007-2/2/2007
  ## Creates .png of histogram of useage of Global Active Power - color is red
  ## Convert "Date" from string to date and correct to yyyymmdd format
  ## Use as.POSIXlt and paste to create timestamp
  ## Specify a 2x2 graph display (mfrow)
  ## Create 4 plots with the dataset 
  ##         1. Global active power by time 
  ##         2. Voltage by time
  ##         3. Sub metering by time
  ##         4. Global reactive power by time
  ## Closes graphic device (.png file)
  
    energy <-read.table("./data/household_power_consumption.txt",stringsAsFactors=F,sep=";", na.strings = "?", header = TRUE)
    e1 <- subset(energy, Date == "1/2/2007" | Date == "2/2/2007")
    png(file="./R-work/ExData_Plotting1/plot4.png",width=480,height=480)
    e1$dateformat <- as.Date(e1$Date,"%d/%m/%Y")
    e1$timestamp <- as.POSIXlt(paste(e1$dateformat,e1$Time))
    par(mfrow = c(2,2))
    with(e1,{
       plot(e1$timestamp,e1$Global_active_power,type = "l",xlab="",ylab="Global Active Power")
       plot(e1$timestamp,e1$Voltage,type = "l",xlab="datetime",ylab="Voltage")
       plot(e1$timestamp,e1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
         lines(e1$timestamp,e1$Sub_metering_1,col="grey")
         lines(e1$timestamp,e1$Sub_metering_2,col="orange")
         lines(e1$timestamp,e1$Sub_metering_3,col="blue")
         legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2,5),col=c("grey","orange","blue"))
     plot(e1$timestamp,e1$Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power")
   })
    
dev.off()
}



