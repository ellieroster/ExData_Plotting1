plot3 <- function() {
    energy <-read.table("./data/household_power_consumption.txt",stringsAsFactors=F,sep=";", na.strings = "?", header = TRUE)
    e1 <- subset(energy, Date == "1/2/2007" | Date == "2/2/2007")
    png(file="./R-work/ExData_Plotting1/plot3.png",width=480,height=480)
    e1$dateformat <- as.Date(e1$Date,"%d/%m/%Y")
       e1$timestamp <- as.POSIXlt(paste(e1$dateformat,e1$Time))
  
    plot(e1$timestamp,e1$Sub_metering_1,type="n")
    lines(e1$timestamp,e1$Sub_metering_1,col="grey")
    lines(e1$timestamp,e1$Sub_metering_2,col="orange")
    lines(e1$timestamp,e1$Sub_metering_3,col="blue")
dev.off()
}



