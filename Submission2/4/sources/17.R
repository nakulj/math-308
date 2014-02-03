flights<-read.csv("FlightDelays.csv")
summary(flights)
aa.delays<-subset(flights,Carrier=="AA")$Delay
ua.delays<-subset(flights,Carrier=="UA")$Delay
aa.ecdf<-ecdf(aa.delays)
ua.ecdf<-ecdf(ua.delays)

plot(ua.ecdf,verticals=TRUE,do.p=FALSE,main="ECDF of UA and AA Flight Delays",xlab="Delay", lty="dashed", col.h="blue", col.v="blue")
lines(aa.ecdf,verticals=TRUE,do.p=FALSE,lty="dotted",col.h="red",col.v="red")
legend(100,.8,c("United Airlines","American Airlines"),col=c("blue","red"),lty=c("dashed","dotted"))