#Loading the file..!
#---------------------------------------------------------
inf<-read.table("C:\\Users\\Juan\\Desktop\\household_power_consumption.txt", sep=";",stringsAsFactors = FALSE,check.names = FALSE,na.strings="?",header = TRUE,quote = '\"')
################
#subsetting
#---------------------------------------------------------
inf2<-subset(inf,Date=="1/2/2007"| Date=="2/2/2007")
################
#Transforming date variable
#---------------------------------------------------------
inf2$Datetime<-as.POSIXct(paste(as.Date(inf2$Date),inf2$Time))
################
#Creating the plot-1
#---------------------------------------------------------
hist(inf2$Global_active_power,ylab="Frenquency",xlab="Global Active Power (Kilowatts)",col="red",main="Global Active Power")
################
#Exporting to PNG file.
#---------------------------------------------------------
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
################





