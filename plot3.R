##read full dataset
#df0<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#nrow(df0)  ##check total records=2075259

## directly read subset of data with records=2880
df<-subset(read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?"), as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date, format="%d/%m/%Y")<="2007-02-02")
## join Date, Time, convert date
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
df$Datetime<-as.POSIXct(paste(df$Date, df$Time))
## plot3: df$Global_active_power~df$Datetime=y~x
with(df, { 
  plot(Datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(Datetime, Sub_metering_2, type="l", col="red")
  lines(Datetime, Sub_metering_3, type="l", col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, text.font=10,  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
