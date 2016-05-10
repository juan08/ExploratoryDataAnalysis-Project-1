T_Data <- read.csv("C:\\Users\\Juan\\Desktop\\household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Subsetting the data
P_Data <- subset(T_Data,Date=="1/2/2007"| Date=="2/2/2007")
rm(T_Data)
## Converting dates
P_Data$Date <- as.Date(P_Data$Date, format="%d/%m/%Y")
P_Data$Datetime <- as.POSIXct(paste(as.Date(P_Data$Date), P_Data$Time))
## Plot 2
plot(P_Data$Global_active_power~P_Data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()