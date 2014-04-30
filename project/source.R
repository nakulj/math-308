

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