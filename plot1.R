# Read the file
df<-read.table('household_power_consumption.txt',header=T,sep=';')

# Calculate the subset data limits
m1<-min(which(df$Date=='1/2/2007'))
m2<-max(which(df$Date=='2/2/2007'))

#Subset data and plot
df2<-df[m1:m2,]
hist(as.numeric(as.character(df2$Global_active_power)),xlab='Global Active Power (kilowatts)',main='Global Active Power', breaks=20,col='red')