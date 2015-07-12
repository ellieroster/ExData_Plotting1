plot2 <- function() {
  ## Reads text file of household energy consumption
  ## Subsets file to include data from 2/1/2007-2/2/2007
  ## Creates .png of plot of useage of Global Active Power by time 
  ## Convert "Date" from string to date and correct to yyyymmdd format
  ## Use as.POSIXlt and paste to create timestamp
  ## Closes graphic device (.png file)
  
energy <-read.table("./data/household_power_consumption.txt",stringsAsFactors=F,sep=";", na.strings = "?", header = TRUE)
e1 <- subset(energy, Date == "1/2/2007" | Date == "2/2/2007")
png(file="./R-work/ExData_Plotting1/plot2.png",width=480,height=480)
e1$dateformat <- as.Date(e1$Date,"%d/%m/%Y")
e1$timestamp <- as.POSIXlt(paste(e1$dateformat,e1$Time))
plot(e1$timestamp,e1$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowats)")
dev.off()
}



