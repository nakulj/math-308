data<-read.csv("Service.csv")
times<-data$Times

mean= mean(times)
meansq= mean(times^2)
denom= meansq-mean^2

r=mean^2/denom
l=mean/denom

print(r)
print(l)

hist=hist(times)
obs=hist$counts

probs=diff(pgamma(breaks,shape=r,rate=l))
probs=probs/sum(probs)

print(chisq.test(x=obs,p=probs))

n=length(times)
pdf("../img/16a.pdf")
hist(times)
curve(n*0.2*dgamma(x,shape=r,rate=l),add=TRUE)
dev.off()

pdf("../img/16b.pdf")
plot(ecdf(times))
curve(pgamma(x,shape=r,rate=l),add=TRUE)
dev.off()