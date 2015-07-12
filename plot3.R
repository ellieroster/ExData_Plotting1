plot3 <- function() {
  ## Reads text file of household energy consumption
  ## Subsets file to include data from 2/1/2007-2/2/2007
  ## Creates .png of histogram of useage of Global Active Power - color is red
  ## Convert "Date" from string to date and correct to yyyymmdd format
  ## Use as.POSIXlt and paste to create timestamp
  ## Create plot without data plotted
  ## Add each line of data
  ## Add legend
  ## Closes graphic device (.png file)
  
    energy <-read.table("./data/household_power_consumption.txt",stringsAsFactors=F,sep=";", na.strings = "?", header = TRUE)
    e1 <- subset(energy, Date == "1/2/2007" | Date == "2/2/2007")
    png(file="./R-work/ExData_Plotting1/plot3.png",width=480,height=480)
    e1$dateformat <- as.Date(e1$Date,"%d/%m/%Y")
       e1$timestamp <- as.POSIXlt(paste(e1$dateformat,e1$Time))
  
    plot(e1$timestamp,e1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(e1$timestamp,e1$Sub_metering_1,col="grey")
    lines(e1$timestamp,e1$Sub_metering_2,col="orange")
    lines(e1$timestamp,e1$Sub_metering_3,col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2,5),col=c("grey","orange","blue"))
    
dev.off()
}



