EngConsDat <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
EngDate<-as.Date(EngConsDat[,1],format="%d/%m/%Y")
EngConsDat[,1]<-EngDate
EngConstSmall<-EngConsDat[EngConsDat[,1]=="2007-02-01" | EngConsDat[,1]=="2007-02-02",]
EngDateTime<-paste(EngConstSmall[,1],EngConstSmall[,2])
EngTime<-strptime(EngDateTime,format="%Y-%m-%d %H:%M:%S")

hist(as.numeric(EngConstSmall[,3]), col="red", main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()