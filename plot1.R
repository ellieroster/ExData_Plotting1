plot1 <- function() {
    energy <-read.table("./data/household_power_consumption.txt",sep=";", na.strings = "?", header = TRUE)
    head (energy)
    nenergy <- subset(energy, Date == "1/2/2007" | Date == "2/2/2007")
    png(file="plot1.png",width=480,height=480)
  print("here")
    hist(nenergy$Global_active_power, col="green",xlab="Global Active Power (kilowatts)")
 title(main = "Global Active Power")
  dev.off()
}


