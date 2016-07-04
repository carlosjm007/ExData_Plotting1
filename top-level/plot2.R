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
plot(su$dateTime, as.numeric(as.character(su$Global_active_power)), type = "l", ylab="Global Active Power (kilowatts)", xlab="")
# Save PNG format
dev.copy(png,'plot2.png')
dev.off()