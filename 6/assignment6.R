testresample<-function() {
	indices=sample(1:(m+n),m)
	m.rs.avg= mean(weights[indices])
	n.rs.avg= mean(weights[-indices])
	rs.diff= m.rs.avg-n.rs.avg
	return(rs.diff>=diff)
}

births<-read.csv("NCBirths2004.csv")

counts<-tapply(births$Weight,births$Smokers,length)
m= counts[["No"]]
n= counts[["Yes"]]

means<-tapply(births$Weight,births$Smokers,mean)
m.avg= means[["No"]]
n.avg= means[["Yes"]]

boxplot[]

diff= m.avg-n.avg

#Pool the data
weights<-births$Weight
total= sum(weights)

#Run several tests on the pooled data
passed=0
tests=10000
for(i in 1:tests) {
	if(testresample()) {
		passed=passed+1
	}
}
print(passed/tests)

