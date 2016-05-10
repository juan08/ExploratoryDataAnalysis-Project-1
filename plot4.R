T_Data <- read.csv("C:\\Users\\Juan\\Desktop\\household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Subsetting the data
P_Data <- subset(T_Data,Date=="1/2/2007"| Date=="2/2/2007")
dim(P_Data)
rm(T_Data)
## Converting dates
P_Data$Date <- as.Date(P_Data$Date, format="%d/%m/%Y")
P_Data$Datetime <- as.POSIXct(paste(as.Date(P_Data$Date), P_Data$Time))
names(P_Data)
#####################################################
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
#----------------------
#  Plot-1
plot(P_Data$Global_active_power~P_Data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
##
#  Plot-2
plot(P_Data$Voltage~P_Data$Datetime, type="l",ylab="Voltage", xlab="datetime")
##
#  Plot-3
plot(P_Data$Sub_metering_1~P_Data$Datetime, type="n",ylab="Energy sub metering", xlab="")
lines(P_Data$Sub_metering_1~P_Data$Datetime,col="black")
lines(P_Data$Sub_metering_2~P_Data$Datetime,col="blue")
lines(P_Data$Sub_metering_3~P_Data$Datetime,col="red")
legend("topright", lty=1,lwd=1, col = c("Black", "blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex = 0.50)
##
#  Plot-4
plot(P_Data$Global_reactive_power~P_Data$Datetime, type="l",ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()