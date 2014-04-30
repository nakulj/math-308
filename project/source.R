#Analysis

datasets=c("data/Fall2013.csv","data/Spring2013.csv")
usage=0
avail=0

for(i in datasets) {
	data<-read.csv(i)
	data<-subset(data,data$DOW != 1)
	data$USED=(data$CONDUCTED | data$NOSHOW)
	usage<-usage+tapply(data$USED,data$DOW,sum)
	avail<-avail+tapply(data$USED,data$DOW,length)
}

print(
	prop.test(usage,avail)
)

#Cross validation
fa12= read.csv("data/Fall2012.csv")
fa12$USED=fa12$CONDUCTED + fa12$NOSHOW
fa12$= (fa12$DOW==3 | fa12$DOW==4)
usage<-tapply(fa12$USED,fa12$MT,sum)
avail<-tapply(fa12$USED+fa12$EMPTY,fa12$MT,sum)
print(
	prop.test(usage,avail,alternative="less")
)