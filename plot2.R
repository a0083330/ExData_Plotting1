input <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
input$Date <- as.Date(input$Date,"%d/%m/%Y")
input <- subset(input, Date=="2007-02-01" | Date=="2007-02-02")
input$DateTime <- paste(input$Date,input$Time)
input$DateTime <- strptime(input$DateTime,"%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(input$DateTime, input$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()