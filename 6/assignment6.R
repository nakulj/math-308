
births<-read.csv("NCBirths2004.csv")

counts<-tapply(births$Weight,births$Smokers,length)
m= counts[["No"]]
n= counts[["Yes"]]

means<-tapply(births$Weight,births$Smokers,mean)
m.avg= means[["No"]]
n.avg= means[["Yes"]]

diff= abs(m.avg-n.avg)

#Pool the data
weights<-births$Weight

#Run several tests on the pooled data
passed=0
for(i in 1:10000) {
	if(testresample())
		passed=passed+1;
}

testresample<-function() {
	
}