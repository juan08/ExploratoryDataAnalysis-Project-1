T_Data <- read.csv("C:\\Users\\Juan\\Desktop\\household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Subsetting the data
P_Data <- subset(T_Data,Date=="1/2/2007"| Date=="2/2/2007")
dim(P_Data)
rm(T_Data)
## Converting dates
P_Data$Date <- as.Date(P_Data$Date, format="%d/%m/%Y")
P_Data$Datetime <- as.POSIXct(paste(as.Date(P_Data$Date), P_Data$Time))

## Plot 3

plot(P_Data$Sub_metering_1~P_Data$Datetime, type="n",ylab="Energy sub metering", xlab="")
lines(P_Data$Sub_metering_1~P_Data$Datetime,col="black")
lines(P_Data$Sub_metering_2~P_Data$Datetime,col="blue")
lines(P_Data$Sub_metering_3~P_Data$Datetime,col="red")
legend("topright", lty=1,lwd=1, col = c("Black", "blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex = 0.50)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()