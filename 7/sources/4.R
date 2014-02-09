#under the null, the difference in proportions is typical
#So, we need to count the number of times 


testResample<-function() {
	m= aa.counts
	n= ua.counts
	indices= sample(1:(m+n), m)

	m.sample= delayed20[indices]
	n.sample= delayed20[-indices]

	m.prop= sum(m.sample)/m
	n.prop= sum(n.sample)/n

	test.diff= m.prop- n.prop

	return(test.diff>diff)
}


#Organise the data
flights<- read.csv("FlightDelays.csv")
flights$Delayed20<- (flights$Delay>20) #create an extra column for convenience
table<-table(flights$Delayed20,flights$Carrier) #group data

#Get the proportions
aa.counts= sum(table[,'AA'])
aa.prop= table['TRUE','AA']/aa.counts
ua.counts= sum(table[,'UA'])
ua.prop= table['TRUE','UA']/ua.counts

#Get the difference.
#Under the null, this is zero.
diff= ua.prop-aa.prop

#Pool the data and count the number of samples that pass both tests
delayed20<-flights$Delayed20
tests=20000
passed=0
for(i in 1:tests) {
	if(testResample())
		passed= passed+1
}

p=2*passed/tests
if(p>1) p=1

print(p)