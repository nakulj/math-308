
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
total= sum(weights)

#Run several tests on the pooled data
passed=0
tests=10000
for(i in 1:tests) {
	if(testresample())
		passed=passed+1;
}
print(passed/tests)

testresample<-function() {
	m.rs<-sample(weights,m)
	m.rs.avg= mean(m.rs)
	n.rs.avg= (total-(m*m.avg))/n
	rs.diff= abs(m.rs.avg-n.rs.avg)
	return(rs.diff<=diff)
}