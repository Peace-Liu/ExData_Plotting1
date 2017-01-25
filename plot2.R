##read full dataset
#df0<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#nrow(df0)  ##check total records=2075259

## directly read subset of data with records=2880
df<-subset(read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?"), as.Date(Date,format="%d/%m/%Y")>="2007-02-01" & as.Date(Date, format="%d/%m/%Y")<="2007-02-02")
## join Date, Time, convert date
df$Date<-as.Date(df$Date, format="%d/%m/%Y")
df$Datetime<-as.POSIXct(paste(df$Date, df$Time))
## plot2: df$Global_active_power~df$Datetime=y~x
plot(df$Datetime, df$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
