# Read the .txt file
df <- read.table("household_power_consumption.txt", sep=";",header = TRUE)
# Select only the dates 2007-02-01 and 2007-02-02
su <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
# Remove "df" variable
rm(df)
dev.new(width=480, height=480)
# Histogram with title, color, y-axis's label and x-axis's label
hist(as.numeric(as.character(su$Global_active_power)), main="Global Active Power", col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)")
# Save PNG format
dev.copy(png,'plot1.png')
dev.off()