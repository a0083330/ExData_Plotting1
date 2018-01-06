input <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
input$Date <- as.Date(input$Date,"%d/%m/%Y")
input <- subset(input, Date=="2007-02-01" | Date=="2007-02-02")
#library(lubridate)
#input$Time <- hms(input$Time)

png(filename = "plot1.png", width = 480, height = 480)
hist(input$Global_active_power, col="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()