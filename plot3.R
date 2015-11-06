print("Run plot1.R first as that is the code that reads the data in.
      In that case, the second part of this code would work even run alone,
      without rearranging the data.")

#Part 1
EngConsDat <- read.table("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
EngDate<-as.Date(EngConsDat[,1],format="%d/%m/%Y")
EngConsDat[,1]<-EngDate
EngConstSmall<-EngConsDat[EngConsDat[,1]=="2007-02-01" | EngConsDat[,1]=="2007-02-02",]
EngDateTime<-paste(EngConstSmall[,1],EngConstSmall[,2])
EngTime<-strptime(EngDateTime,format="%Y-%m-%d %H:%M:%S")

# Part 2, plotting
plot(EngTime,as.numeric(EngConstSmall[,7]),lwd=1,type="l",col="black",xlab="",ylab = "Energy sub metering",ylim=c(0,40))
lines(EngTime,as.numeric(EngConstSmall[,8]),lwd=1,type="l",col="red")
lines(EngTime,as.numeric(EngConstSmall[,9]),lwd=1,type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off()