testResample<-function() {
	indices= sample(1:(m+n),m)
	tm.avg= mean(changes[indices])
	tn.avg= mean(changes[-indices])
	test.diff= tm.avg-tn.avg
	return(test.diff>diff || test.diff<(-diff))
}


#Organise the data
spruces<-read.csv("Spruce.csv")

#Get observed test statistic
m= 36
n= 36
means<- tapply(spruces$Ht.change, spruces$Competition, mean)
m.avg= means[["C"]]
n.avg= means[["NC"]]
diff= m.avg-n.avg

#Pool the data
changes=spruces$Ht.change

#Get resample test statistics
tests= 10000
passed=0
for(i in 1:tests) {
	if(testResample())
		passed=passed+1
}
print(passed/tests)
