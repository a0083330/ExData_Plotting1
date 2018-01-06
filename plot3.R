input <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
input$Date <- as.Date(input$Date,"%d/%m/%Y")
input <- subset(input, Date=="2007-02-01" | Date=="2007-02-02")
input$DateTime <- paste(input$Date,input$Time)
input$DateTime <- strptime(input$DateTime,"%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
with(input, plot(DateTime, Sub_metering_1, 
                 col = "black", type = "l",
                 xlab = "", ylab = "Energy sub metering"))
with(input, lines(DateTime, Sub_metering_2, 
                  col = "red", type = "l"))
with(input, lines(DateTime, Sub_metering_3, 
                  col = "blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()