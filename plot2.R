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
plot(EngTime,as.numeric(EngConstSmall[,3]),lwd=1,type="l",xlab="",ylab = " Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()