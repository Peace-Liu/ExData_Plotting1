##read full dataset
#df0<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#nrow(df0)  ##check total records=2075259

## directly read subset of data with records=2880
df<-subset(read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?"), as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date, format="%d/%m/%Y")<="2007-02-02")
## join Date, Time, convert date
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
df$Datetime<-as.POSIXct(paste(df$Date, df$Time))
## plot4
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,2,0))
with(df, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub merging", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_rective_power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
