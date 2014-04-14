bootstrapCI<-function(x) {
	n=length(x)
	mu= mean(x)
	s=sd(x)/sqrt(n)


	B=100000
	boot=matrix(
		sample(x,B*n,replace=TRUE),
		nrow=B
	)
	means=apply(boot,1,mean)
	t=(means-mu)/(apply(boot,1,sd)/sqrt(n))
	q=quantile(t,c(0.025,0.975),names=FALSE)
	print(q)
	print(c(mu-q[2]*s,mu-q[1]*s))

}


x<-na.omit(read.csv("Bangladesh.csv")$Chlorine)
summary(x)
pdf("../img/25.pdf")
boxplot(x)
dev.off()

print(mean(x))

#bootstrapCI(x)