N= 10000

testUnif<-function(n) {
	mu=0.5
	x<-matrix(
		runif(N*n,0,1),
		nrow=N
	)
	means=apply(x,1,mean)
	sds=apply(x,1,sd)
	T=sqrt(n)*(means-mu)/sds
	pdf(paste(c("../img/17unif",n,".pdf"),collapse=""))
	h=hist(T,main=paste(c("n=",n),collapse=""))
	w=h$breaks[2]-h$breaks[1]
	curve(N*w*dt(x,n-1),add=TRUE)
	dev.off()
}

testExp<-function(n) {
	mu=1
	x<-matrix(
		rexp(N*n,1),
		nrow=N
	)
	means=apply(x,1,mean)
	sds=apply(x,1,sd)
	T=sqrt(n)*(means-mu)/sds
	pdf(paste(c("../img/17exp",n,".pdf"),collapse=""))
	h=hist(T,main=paste(c("n=",n),collapse=""))
	w=h$breaks[2]-h$breaks[1]
	curve(N*w*dt(x,n-1),add=TRUE)
	dev.off()
}


n=c(10,20,30,60,100,250)
for(i in n) {
	testExp(i)
}
