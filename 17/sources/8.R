test<-function(n) {
	N=10000
	mu=5/2
	q=qt(0.975,n-1)

	x<-rgamma(n*N,shape=5,rate=2)
	x<-matrix(x, nrow=N)

	xbar=apply(x,1,mean)
	s=apply(x,1,sd)

	diff=q*s/sqrt(n)
	L<-xbar-diff
	U<-xbar+diff

	tooLo=sum(U<mu)/N
	tooHi=sum(mu<L)/N

	return(c(tooLo,tooHi))
}

tooLo=c()
tooHi=c()
nvalues=c(20,30,60,100,250)
for(i in nvalues) {
	res=test(i)
	tooLo=c(tooLo,res[1])
	tooHi=c(tooHi,res[2])
}
miss=tooLo+tooHi

print(tooLo)
print(tooHi)
print(miss)

yrange<-range(c(tooLo,tooHi,miss))

pdf("../img/8.pdf")

plot(n,miss,type="o",col="green",xlim=c(0,250),ylim=c(0,1))
lines(n,tooLo,type="o",col="blue")
lines(n,tooHi,type="o",col="red")
dev.off()

