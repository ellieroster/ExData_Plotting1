plot1 <- function() {
  
## Reads text file of household energy consumption
## Subsets file to include data from 2/1/2007-2/2/2007
## Creates .png of histogram of useage of Global Active Power - color is red
## Creates title for historgram
## Closes graphic device (.png file)

    energy <-read.table("./data/household_power_consumption.txt",sep=";", na.strings = "?", header = TRUE)
    nenergy <- subset(energy, Date == "1/2/2007" | Date == "2/2/2007")
    png(file="./R-work/ExData_Plotting1/plot1.png",width=480,height=480)
    hist(nenergy$Global_active_power, main = "Global Active Power", col="red",xlab="Global Active Power (kilowatts)")
    dev.off()
}


