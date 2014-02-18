#Creates a matrix enumerating all possible runs of heads
#Eg. for 3-runs amongst 5 coin flips, returns:
#11100
#01110
#00111
getRunsMatrix<-function(n, runLength) {
	heads<-rep(1, runLength);
	tails<-rep(0, n-runLength+1);
	data<-c(
		rep(c(heads,tails),n-runLength),
		heads
	);
	return(matrix(data=data,ncol=n,byrow=TRUE));
}

#Creates a (pseudo-randomly generated) vector of coin flips
getFlipsMatrix<-function(n) {
	return(rbinom(n,1,0.5));
}

#Tests a particular sequence of flips for
#presence of a given length of run
testForRuns<-function(flips, runs, runLength) {
	prod<- runs %*% flips;
	return(runLength %in% prod);
}

#Monte-Carlo simulation to determine probability
getProbability<-function(n=100, runLength=7, tests= 10000) {
	runs<-getRunsMatrix(n, runLength);
	passed= 0;
	for(i in 1:tests) {
		flips<-getFlipsMatrix(n);
		if(testForRuns(flips, runs, runLength)){
			passed= passed+1;
		}
	}
	return(passed/tests);
}

#Run the test
print(getProbability());
