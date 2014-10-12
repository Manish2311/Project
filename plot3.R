# Creat a temp file

temp <- tempfile()

# download the data from website 

download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)

# Unzip the downloaded file

file <- unzip(temp)

}

# Read the data

power <- read.table(file, header=T, sep=";")

# change the format of date

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Selecte only 2 days from entire data

df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

# convert active power variable as numeric

df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# convert reactive power variable as numeric

df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))

# convert voltage variable as numeric

df$Voltage <- as.numeric(as.character(df$Voltage))

# change the date formate

df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


# convert Sub_metering_1 variable as numeric

df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))

# convert Sub_metering_2 variable as numeric

df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))

# convert Sub_metering_3 variable as numeric

df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

plot3 <- function() {

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(df$timestamp,df$Sub_metering_2,col="red")

lines(df$timestamp,df$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1)

}

dev.copy(png, file="plot3.png", width=480, height=480)

 dev.off()

cat("plot3.png has been saved in", getwd())

}
