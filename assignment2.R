 

 hasRun<-function(flips,length) {
 	runLength=1;
 	for(i in 2:length(flips)) {

 		if(flips[i] == flips[i-1]) {
 			runLength= runLength+1;
 		} else {
 			runLength= 1;
 		}

 		if(runLength == length) {
 			return(TRUE);
 		}
 	}
 	return(FALSE);
 }

simulate<-function(trials= 5000,length=7,n=100) {
	success=0;
	for (i in 1:trials) {
		flips<-rbinom(n= n, prob= 0.5, size= 1);
		if(hasRun(flips,length)) {
			success= success+1;
		}
	}
	prob= success/trials;
	return(prob);
}

print(simulate(length=7))