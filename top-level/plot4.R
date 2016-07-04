# Read the .txt file
df <- read.table("household_power_consumption.txt", sep=";",header = TRUE)
# Select only the dates 2007-02-01 and 2007-02-02
su <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
# Remove "df" variable
rm(df)
# Merge the columns
dateTime <- paste(su$Date, su$Time)
su$dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%OS")
# Order by dateTime
su<-su[order(su$dateTime),]
dev.new(width=480, height=480)
# Graphic
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(su$dateTime, as.numeric(as.character(su$Global_active_power)), type = "l", ylab="Global Active Power (kilowatts)", xlab="")
plot(su$dateTime, as.numeric(as.character(su$Voltage)), type = "l", ylab="Voltage", xlab="datetime")
plot(su$dateTime, as.numeric(as.character(su$Sub_metering_1)), type="l", col="black", xlab="", ylab="Energy sub metering")
lines(su$dateTime, as.numeric(as.character(su$Sub_metering_2)), type="l", col="red")
lines(su$dateTime, as.numeric(as.character(su$Sub_metering_3)), type="l", col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(su$dateTime, as.numeric(as.character(su$Global_reactive_power)), type = "l", ylab="Global_rective_power", xlab="datetime")
# Save PNG format
dev.copy(png,'plot4.png')
dev.off()