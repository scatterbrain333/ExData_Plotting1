# Read the file
df<-read.table('household_power_consumption.txt',header=T,sep=';')

# Calculate the subset data limits
m1<-min(which(df$Date=='1/2/2007'))
m2<-max(which(df$Date=='2/2/2007'))

#Subset data 
df2<-df[m1:m2,]
df2[df2=='?']<-NA
df2<- df2[complete.cases(df2),]

# Covert date and time
df2$Date<-paste(df2$Date,df2$Time)
df2$Date <- strptime(df2$Date, '%d/%m/%Y %H:%M:%S')


lines(df2$Date, as.numeric(as.character(df2$Sub_metering_1)), col = "red")
lines(df2$Date, as.numeric(as.character(df2$Sub_metering_2)), col = "blue")
lines(df2$Date, as.numeric(as.character(df2$Sub_metering_3)), col = "green")
legend("topright", pch = 1, col = c("blue", "red", "green"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

