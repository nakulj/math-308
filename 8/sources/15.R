t=20000
n=c(2,3,4,5)
for(i in n) {
	sample<-rchisq(t,df=i)
	if(i == n[1]) {
		plot(density(sample))
	}
	else {
		lines(density(sample))
	}
	print(c(mean(sample),var(sample)))
}r